module MicroHs.GenRomMem(genRomMem) where
import Prelude(); import MHSPrelude
import MicroHs.Lex(readInt)   -- dialect-safe decimal String->Int
import Data.List
import Data.Bits
import Numeric(showHex)
import qualified MicroHs.IdentMap as M
import Data.Maybe
import MicroHs.Desugar(LDef)
import MicroHs.Exp
import MicroHs.Expr(Lit(..), errorMessage, HasLoc(..))
import MicroHs.Ident(Ident(..), showIdent, mkIdent)
import MicroHs.State
import MicroHs.GenRomCommon(getPatNum, inlineSingle, finalEtaApply)

-- ---------------------------------------------------------------------------
-- Generate a `fun` assembly listing (.S) for the patched RISC-V binutils
-- (`+xfun`), replacing the older .scala / .mem program formats.  The program is
-- a flat sequence of Applications in heap-address order; each 32-bit word is a
-- graph atom rendered as its real xfun mnemonic (or, for a databox payload, a
-- raw `.word`).
--
-- 32-bit atom encoding (2-bit primary tag in bits[1:0])
-- -----------------------------------------------------
--   00 ptr    : 4-byte-aligned address                   -> fn.link  <label>
--   01 eptr   : ptr | 1 (indirection)                    -> fn.elink <label>
--   10 combi  : bit2=0, type[10:4], arity[13:11], args    -> fn.combi.t<t> <ar>, [args]
--   10 int    : bit2=1, 29-bit value in bits[31:3]        -> .word (raw int data)
--   11 sys    : custom graph ops (opcode 0x5B/0x7B)       -> fn.y / fn.box / fn.cata …
-- There is NO custom arithmetic/compare/error instruction: primitive ops are
-- RV32 blobs (fn.elink / inline), and a boxed int/float is a two-word databox
-- (fn.box marker + a raw `.word` payload -- the only `.word` the listing emits).

maxAppLen :: Int
maxAppLen = 8

-- one encoded atom: (32-bit word, mnemonic)
type MWord = (Int, String)

-- 2-bit primary tag in bits[1:0]: 00 ptr | 01 eptr | 10 combi | 11 prm.
-- int is a raw 32-bit word (data; reached only by dereferencing a ptr).

wPtr :: Int -> MWord
wPtr a = (a, "ptr " ++ show a)                 -- a is 4-byte aligned -> low2 = 00

wEptr :: Int -> MWord
wEptr a = (a .|. 1, "eptr " ++ show a)         -- ptr | 1 -> low2 = 01

-- int: 29-bit literal, tagged low2=10 & bit2=1 (combi is low2=10 & bit2=0).
-- value in bits[31:3]; self-identifying so a ptr-deref yields a typed INT atom.
wInt :: Int -> MWord
wInt n = (((n .&. 0x1FFFFFFF) `shiftL` 3) .|. 0x6, "int " ++ show n)

-- fn.data box (--rvfun-linux only): a 2-word boxed 32-bit value. Marker word
-- (custom-2, funct3=6) then a raw 32-bit payload. Lets ints carry the full 32
-- bits (the 29-bit wInt truncates); arithmetic on boxes runs at 32-bit width.
wDataMarker :: MWord
wDataMarker = (opSys .|. (6 `shiftL` 12), "data")          -- 0x0000605b
wDataPayload :: Int -> MWord
wDataPayload n = (n .&. 0xFFFFFFFF, "raw word " ++ show n)  -- emitted as a literal .word

-- custom-2 opcode slot (low2 = 11): the graph terminators (y / force / box).
-- There are NO custom arithmetic/comparison fn.* instructions -- every primitive
-- op is an RV32 blob reached via fn.elink (primEff) or inlined in place
-- (primArith / primImm).  So `opSys` is the only custom opcode the encoder needs.
opSys :: Int
opSys = 0x5B

wY :: MWord
wY = (opSys, "y")                              -- custom-2, funct3 = 0

-- Explicit-morphism dispatch (--morph).  custom-3 opcode; funct3 = scheme index
-- (0=cata 1=ana 2=para 3=hylo).  A nullary spine head: the algebra and scrutinee
-- travel as the two App args.  Mirrors `./f`'s RVFun `morphWord`.
opMorph :: Int
opMorph = 0x7B   -- custom-3 : fn.cata / fn.ana / fn.para / fn.hylo (low2 = 11)

wMorph :: MScheme -> MWord
wMorph s = (opMorph .|. (schemeIx s `shiftL` 12), "fn." ++ schemeName s)

-- Effect primitives (IO / MMIO / CPU counters): emitted as a RISC-V-as-atom —
-- a `j <helper>` word.  The reducer sees a RISC-V word at the spine head, yields
-- (A_RVEFF) to its address; the linked helper performs the effect on the RISC-V
-- datapath via fn.tor/fn.fromr and resumes.  These resolve at link time, so they
-- exist on the gas/.S (Linux) path only (the .mem RTL path keeps the sentinel).
effSentinel :: Int
effSentinel = 0x0000006F          -- JAL x0,0 shape: low2=11, opc 0x6F -> FC_RISCV
-- (helper symbol, is-value-effect).  Value effects PRODUCE a result for the
-- continuation (rd=1, `jal ra`); strict effects CONSUME an arg (rd=0, `j`).
effSym :: String -> Maybe (String, Bool)
effSym op = case op of
  "io.putb"   -> Just ("_io_putb",   False)
  "io.getb"   -> Just ("_io_getb",   True)
  -- file IO (all 1-arg effects; fd kept in a helper-side current_fd register):
  "io.setfd"  -> Just ("_io_setfd",  False)  -- set current_fd = arg
  "io.putbf"  -> Just ("_io_putbf",  False)  -- write byte arg to current_fd
  "io.getbf"  -> Just ("_io_getbf",  True)   -- read a byte from current_fd (-1 EOF)
  "io.pathc"  -> Just ("_io_pathc",  False)  -- append byte arg to the path buffer
  "io.open"   -> Just ("_io_open",   True)   -- open buffered path, mode arg -> fd
  "io.close"  -> Just ("_io_close",  False)  -- close fd arg
  "io.argc"   -> Just ("_io_argc",   True)   -- argv count
  "io.argsel" -> Just ("_io_argsel", False)  -- select argv[arg]; reset read offset
  "io.argrd"  -> Just ("_io_argrd",  True)   -- next byte of the selected arg (-1 end)
  "rdcycle"   -> Just ("_rd_cycle",  True)
  "rdinstret" -> Just ("_rd_instret",True)
  "mmio.peek" -> Just ("_mmio_peek", True)
  "mmio.poke" -> Just ("_mmio_poke", False)
  _           -> Nothing
wEff :: (String, Bool) -> MWord
wEff (sym, isval) = (effSentinel, (if isval then "jal ra, " else "j ") ++ sym)

-- --rvfun-linux PC-reducer: a primitive/effect head is an fn.elink into its RV32
-- blob (low2=01). Emitted as the real `fn.elink <sym>` mnemonic; gas lowers it to
-- `.word sym+1` and the linker resolves the symbol.
wElinkSym :: String -> MWord
wElinkSym sym = (effSentinel, "fn.elink " ++ sym)

-- --rvfun-linux: arithmetic primitives are RV32 blobs reached via the SAME effect
-- mechanism (value effects: consume 2 boxed operands, produce 1 boxed result).
-- opInfix guarantees both operands are already WHNF boxes, so the blob just unboxes
-- (fn.tor) -- no forcing in the reducer.
primEff :: String -> Maybe (String, Bool)
primEff op = case op of
  "+"    -> Just ("_prim_add",  True)
  "-"    -> Just ("_prim_sub",  True)
  "*"    -> Just ("_prim_mul",  True)
  "quot" -> Just ("_prim_div",  True)
  "uquot"-> Just ("_prim_divu", True)
  "rem"  -> Just ("_prim_rem",  True)
  "urem" -> Just ("_prim_remu", True)
  "and"  -> Just ("_prim_and",  True)
  "or"   -> Just ("_prim_or",   True)
  "xor"  -> Just ("_prim_xor",  True)
  "shl"  -> Just ("_prim_sll",  True)
  "shr"  -> Just ("_prim_srl",  True)
  "ashr" -> Just ("_prim_sra",  True)
  "=="   -> Just ("_prim_eq",  True)
  "/="   -> Just ("_prim_ne",  True)
  "<"    -> Just ("_prim_lt",  True)
  "<="   -> Just ("_prim_le",  True)
  ">"    -> Just ("_prim_gt",  True)
  ">="   -> Just ("_prim_ge",  True)
  "u<"   -> Just ("_prim_ltu", True)
  "u<="  -> Just ("_prim_leu", True)
  "u>"   -> Just ("_prim_gtu", True)
  "u>="  -> Just ("_prim_geu", True)
  -- F32 float ops (blobs on the F datapath; arith Y-wrapped like the Int
  -- set, compares end in a combi branch, unary = force+compute+box)
  "f+"   -> Just ("_prim_fadd", True)
  "f-"   -> Just ("_prim_fsub", True)
  "f*"   -> Just ("_prim_fmul", True)
  "f/"   -> Just ("_prim_fdiv", True)
  "f=="  -> Just ("_prim_feq",  True)
  "f/="  -> Just ("_prim_fne",  True)
  "f<"   -> Just ("_prim_flt",  True)
  "f<="  -> Just ("_prim_fle",  True)
  "f>"   -> Just ("_prim_fgt",  True)
  "f>="  -> Just ("_prim_fge",  True)
  "fneg" -> Just ("_prim_fneg", True)
  "fsqrt"-> Just ("_prim_fsqrt",True)
  "itof" -> Just ("_prim_itof", True)
  "ftoi" -> Just ("_prim_ftoi", True)
  "io.putb" -> Just ("_pm_putb", True)
  -- buffered stdout/file byte IO (standard Prelude System.IO): arity-2 (arg + k),
  -- same shape as io.putb. setfd latches the fd; putbf writes a byte to it.
  "io.setfd"-> Just ("_pm_setfd", True)
  "io.putbf"-> Just ("_pm_putbf", True)
  -- perf self-reporting uses the GENERIC csrr/csrw mechanism (see litWord +
  -- csrBlobs in Main.hs): a Haskell `primitive "csrr 0xNNN"` / `"csrw 0xNNN"`.
  _      -> Nothing

-- Arithmetic prims inlined IN-PLACE as their 4-word blob, so the spine head/arg is
-- the blob itself rather than an fn.elink into a shared blob -- saving one reduction
-- (the elink hop) per arithmetic op. Same body as primBlobs False (rv64): unbox the
-- two pre-forced operands (fn.tor), run the 32-bit *w op, re-box (fn.databox a0).
-- Compares stay fn.elink (they end in a combi branch, handled below). opInfix already
-- guarantees both operands are WHNF boxes here, so the blob may run unconditionally.
primArith :: Bool -> String -> Maybe [MWord]
primArith rv32 op = fmap blob (lookup op tbl)
  where
    tbl = [ ("+","addw"), ("-","subw"), ("*","mulw")
          , ("quot","divw"), ("uquot","divuw"), ("rem","remw"), ("urem","remuw")
          , ("and","and"), ("or","or"), ("xor","xor")
          , ("shl","sllw"), ("shr","srlw"), ("ashr","sraw") ]
    -- fn.databox a0, a0 : box a0 on the heap, a0 <- the box pointer (rd=hp).
    -- fn.update  a0     : mem[vspine top] <- R[a0]|1 (the HARDWARE elink-tags
    --                     the stored value: a memoized re-walk of the Y-knot
    --                     REDIRECTS into the box instead of pushing it as a
    --                     link and re-running this blob), pop. Record-free
    --                     Turner update with the address carried on the spine.
    -- jr a0             : enter the box - an ordinary JALR; the box head then
    --                     threads the value to the consumer (the BOX dispatch).
    blob ins = [ (effSentinel, "fn.tor a0")
               , (effSentinel, "fn.tor a1")
               , (effSentinel, unW rv32 ins ++ " a0,a0,a1")
               , (effSentinel, "fn.databox a0,a0")
               , (effSentinel, "fn.update a0")             -- hw elink-tags the stored box
               , (effSentinel, "jr a0") ]

-- Immediate-arith prim (from Abstract.opInfix immOpR/immOpL): a UNARY op with a
-- compile-time constant baked into an RV immediate instruction ("addiw 5", "ori 12",
-- "slliw 3", ...). 4-word blob: force the single operand to WHNF (the constant is no
-- longer a separate spine operand pre-forced by opInfix), unbox, run the immediate
-- op, re-box. The constant never becomes a graph node nor a combinator argument.
primImm :: Bool -> String -> Maybe [MWord]
primImm rv32 s = case words s of
  [ins, k] | ins `elem` ["addiw","andi","ori","xori","slliw","srliw","sraiw"] ->
      Just [ (effSentinel, "fn.force")                    -- reduce the single operand to WHNF
           , (effSentinel, "fn.tor a0")
           , (effSentinel, unW rv32 ins ++ " a0,a0," ++ k)
           , (effSentinel, "fn.databox a0,a0")
           , (effSentinel, "fn.update a0")                 -- hw elink-tags the stored box
           , (effSentinel, "jr a0") ]
  _ -> Nothing

-- rv32: the *w ops ARE the base ops (payloads are 32-bit either way);
-- drop the w suffix so the rv32 gas accepts the mnemonic.
unW :: Bool -> String -> String
unW rv32 m = if rv32 && not (null m) && last m == 'w' then init m else m

-- no element repeats (arg-linearity test for the single-entry marker)
noDup :: Eq a => [a] -> Bool
noDup []     = True
noDup (x:xs) = x `notElem` xs && noDup xs

-- combinator: opcode[3:0]=0x2 (or 0xA if single-entry) | type[10:4] (7 bits T0..T64)
--   | arity[13:11] | args[31:14].  The single-entry bit (bit 3) extends the opcode:
--   when the seMark flag is on AND the combinator references each argument at most
--   once (noDup is = no shared arg), bit 3 is set so the reducer skips the WHNF
--   update for thunks headed by this combinator. SE combis are emitted as a raw
--   `.word` (gas would otherwise recompute the encoding without bit 3).
wCombi :: Bool -> Int -> Pat -> [Int] -> MWord
wCombi seM arity p is =
  let t    = getPatNum p
      args = take 6 (is ++ repeat 0)
      packed = foldr (.|.) 0 [ (a .&. 7) `shiftL` (14 + 3*k) | (a, k) <- zip args [0..] ]
      se    = seM && noDup is
      seBit = if se then 0x8 else 0
      w = 0x2 .|. seBit .|. ((t .&. 0x7f) `shiftL` 4) .|. (arity `shiftL` 11) .|. packed
      mn = "combi t=" ++ show t ++ " ar=" ++ show arity ++ " args=" ++ show args
             ++ "  (" ++ show p ++ ")"
  in (w, if se then "raw " ++ mn ++ " SE" else mn)

-- does an argument need its own literal data word (vs being a ptr to a block)?
needsLit :: Exp -> Bool
needsLit (Var _) = False    -- PTR to another block
needsLit _       = True     -- int / float / combi / Y / prim head

-- the data word(s) for a literal node; an int under boxInts becomes a 2-word box.
-- seM: emit single-entry combi opcodes (see wCombi); does not change word count.
litWordsOf :: Bool -> Bool -> Bool -> Exp -> [MWord]
litWordsOf _ _   bi (Lit (LInt n))    | bi = [wDataMarker, wDataPayload n]
litWordsOf _ _   bi (Lit (LDouble d)) | bi = [wDataMarker, wDataPayload (f32Bits d)]  -- binary32 float box
litWordsOf rv32 _   bi (Lit (LPrim op)) | bi, Just ws <- primImm rv32 op = ws    -- inline immediate-arith blob
litWordsOf rv32 _   bi (Lit (LPrim op)) | bi, Just ws <- primArith rv32 op = ws  -- inline arith blob
litWordsOf _ seM bi a                   = [litWord seM bi a]

-- #words the spine terminator occupies (a boxed bare-int head is 2 words).
termCount :: Bool -> Exp -> Int
termCount bi (Lit (LInt _))    | bi = 2
termCount bi (Lit (LDouble _)) | bi = 2                                         -- 2-word float box
termCount bi (Lit (LPrim op)) | bi, Just ws <- primImm False op = length ws    -- 4-word immediate blob
termCount bi (Lit (LPrim op)) | bi, Just ws <- primArith False op = length ws  -- 4-word inline blob
termCount _  _                   = 1

blockOf :: Exp -> Int
blockOf (Var i) | "PTR" `isPrefixOf` showIdent i = readInt (drop 3 (showIdent i))
blockOf e = error ("GenRomMem: expected PTR var, got " ++ show e)

-- the data word for a literal-arg / inline head node (seM: see wCombi/litWordsOf)
litWord :: Bool -> Bool -> Exp -> MWord
litWord _   _  (Lit (LInt n))     = wInt n
litWord _   _  (Lit (LPrim "Y"))  = wY
litWord _   bi (Lit (LPrim op))
  | "csrr " `isPrefixOf` op = wElinkSym ("_csrr_" ++ drop 5 op)     -- generic CSR read
  | "csrw " `isPrefixOf` op = wElinkSym ("_pm_csrw_" ++ drop 5 op)  -- generic CSR write
  | op == "seq"             = wElinkSym "_seq"  -- seq: force a0 then A returns a1 (blob; a bare fn.force has no continuation)
  | bi, Just pe <- primEff op = wElinkSym (fst pe)   -- prim -> fn.elink blob
  | Just se <- effSym op     = wEff se
  -- No fun encoding for this primitive (arithmetic lives in the RV32 blobs, so it
  -- must have matched primEff above under --bare).  Halt rather than emit junk.
  | ("error" `isPrefixOf` op || "raise" `isPrefixOf` op)                = wElinkSym "_error0"
  | otherwise                = error ("GenRomMem: primitive has no fun encoding: " ++ op)
litWord seM _ (Sc a p is)     = wCombi seM a p is
litWord _   _  (Morph s)      = wMorph s
-- A C FFI import has no fun runtime; halt the compilation (there is no error atom
-- to fall back to).  A float literal needs the boxed-int representation (handled
-- in litWordsOf under --bare); reaching here means it was requested without boxing.
litWord _   _  (Lit (LForImp nm _)) = error ("GenRomMem: foreign import not supported on the fun backend: " ++ nm)
litWord _   _  (Lit (LDouble _))    = error "GenRomMem: float literal requires the boxed (--bare) representation"
litWord _   _  e                  = error ("GenRomMem: bad literal " ++ show e)

-- 8-digit zero-padded hex
hex8 :: Int -> String
hex8 x = let s = showHex (x .&. 0xFFFFFFFF) "" in replicate (8 - length s) '0' ++ s

-- size of a block in words: #args pushes + terminator words + literal-arg words
blockSize :: Bool -> [Exp] -> Int
blockSize _  []          = 0
blockSize bi (hd : args) =
  length args + termCount bi hd
              + sum [ length (litWordsOf False False bi a) | a <- args, needsLit a ]  -- seM irrelevant to count

-- emit one block (head : args) given its base byte address and the block-base map.
-- Returns the words (with mnemonics) in address order.
emitBlock :: Bool -> Bool -> Bool -> (Int -> Int) -> Int -> [Exp] -> [MWord]
emitBlock rv32 seM bi baseOf bs (hd : args) =
  let na       = length args
      ntw      = length termWs
      litAddr w = bs + (na + ntw + w) * 4
      go []       _ = ([], [])
      go (a : as) w
        | needsLit a = let lw       = litWordsOf rv32 seM bi a
                           (ps, ls) = go as (w + length lw)
                       in (wPtr (litAddr w) : ps, lw ++ ls)         -- ptr to this lit's first word
        | otherwise  = let (ps, ls) = go as w
                       in (wPtr (baseOf (blockOf a)) : ps, ls)      -- ptr to another block
      (pushes, lits) = go (reverse args) 0
      -- the head (leftmost source node) terminates the spine; a pointer head is
      -- promoted to eptr (ptr | 1) so fetch resumes there. A bare-int head under
      -- boxInts is a 2-word box.
      termWs = case hd of
               Lit (LInt n)    | bi    -> [wDataMarker, wDataPayload n]
               Lit (LDouble d) | bi    -> [wDataMarker, wDataPayload (f32Bits d)]  -- binary32 float box
               Sc a p is              -> [wCombi seM a p is]
               Morph s                -> [wMorph s]
               Var _                  -> [wEptr (baseOf (blockOf hd))]
               Lit (LPrim "Y")        -> [wY]
               Lit (LPrim op)
                 | "csrr " `isPrefixOf` op -> [wElinkSym ("_csrr_" ++ drop 5 op)]    -- generic CSR read
                 | "csrw " `isPrefixOf` op -> [wElinkSym ("_pm_csrw_" ++ drop 5 op)] -- generic CSR write
                 | op == "seq"             -> [wElinkSym "_seq"]   -- seq: force a0 then A returns a1 (blob)
                 | bi, Just ws <- primImm rv32 op -> ws                    -- immediate-arith: INLINE blob
                 | bi, Just ws <- primArith rv32 op -> ws                  -- arith: INLINE blob (no fn.elink)
                 | bi, Just pe <- primEff op -> [wElinkSym (fst pe)]   -- compare/effect -> fn.elink blob
                 | Just se <- effSym op    -> [wEff se]
                 | ("error" `isPrefixOf` op || "raise" `isPrefixOf` op)               -> [wElinkSym "_error0"]
                 | otherwise               -> error ("GenRomMem: primitive has no fun encoding: " ++ op)
               Lit (LInt n)           -> [wInt n]   -- bare int head (CAF value), 29-bit
               Lit (LForImp nm _)     -> error ("GenRomMem: foreign import not supported on the fun backend: " ++ nm)
               e                      -> error ("GenRomMem: bad head " ++ show e)
  in pushes ++ termWs ++ lits
emitBlock _ _ _ _ _ [] = []

-- ---------------------------------------------------------------------------
-- traversal : identical addressing to GenRomOScala, collecting Applications
-- as atom lists ([Exp]) in heap-address order instead of building Scala text.
-- ---------------------------------------------------------------------------

-- returns (.mem machine-code text, .S assembly-listing text)
genRomMem :: String -> Bool -> Bool -> Bool -> Bool -> (Ident, [LDef]) -> (String, String)
genRomMem progName wrapIO boxInts seMark rv32 (mainName0, ldefs0) =
  let
    -- main :: IO () is a CPS action; to run it the entry must be `performIO main`
    -- (= main applied to id). Inject a synthetic root whose body is exactly that;
    -- primPerformIO's own combinator carries the identity continuation.
    (mainName, ldefs) =
      if wrapIO
      then let sm  = mkIdent "_funMain"
               pio = mkIdent "Primitives.primPerformIO"
           in (sm, (sm, App (Var pio) (Var mainName0)) : ldefs0)
      else (mainName0, ldefs0)
    ds = finalEtaApply $ inlineSingle ldefs
    dMap = M.fromList ds

    -- state: 1. fun counter; 2. addr/ptr counter; 3. comb counter; 4. seen map; 5. apps (reversed)
    dfs :: Ident -> State (Int, Int, Int, M.Map Exp, [[Exp]]) ()
    dfs n = do
      (i, ptr, combs, seen, r) <- get
      case M.lookup n seen of
        Just _ -> return ()
        Nothing -> do
          let e = findIdentIn n dMap
          put (i, ptr + 1, combs, M.insert n (ref ptr) seen, r)
          buildFunc (substv e)
          (i', ptr', combs', seen', r') <- get
          put (i + 1, ptr', combs', seen', r')
          mapM_ dfs $ freeVars e

    buildFunc :: Exp -> State (Int, Int, Int, M.Map Exp, [[Exp]]) ()
    buildFunc e =
      let
        -- state: 1. ptr counter; 2. comb counter; 3. current spine (in order); 4. apps (in order)
        build :: Exp -> State (Int, Int, [Exp], [[Exp]]) ()
        build ex = do
          (i, combs, s, as) <- get
          case ex of
            App f (App a1 a2) -> do
              put (i, combs, [], as)
              build (App a1 a2)
              (i', combs', s', as') <- get
              put (i' + 1, combs', Var (mkIdent ("PTR" ++ show i')) : s, as' ++ [s'])
              build f
            App f a -> do
              let combs' = case a of Sc _ _ _ -> combs + 1; _ -> combs
              put (i, combs', a : s, as)
              build f
            _ -> do
              let combs' = case ex of Sc _ _ _ -> combs + 1; _ -> combs
              put (i, combs', ex : s, as)
      in do
      (i, ptr, combs, seen, r) <- get
      let (_, (ptr', combs', spn, aps)) = runState (build e) (ptr, combs, [], [])
      put (i, ptr', combs', seen, r ++ (spn : aps))

    -- single run; `defs` (the final seen map) is used lazily by substv, exactly
    -- as in GenRomOScala (knot-tying via laziness).
    (_, (_, _, _, defs, apps)) = runState (dfs mainName) (0, 0, 0, M.empty, [])

    ref idx = Var $ mkIdent $ "PTR" ++ show idx
    findIdentIn n m = fromMaybe (errorMessage (getSLoc n) $ "No definition found for: " ++ showIdent n) $
                      M.lookup n m
    findIdent n = findIdentIn n defs
    substv aexp =
      case aexp of
        Var n -> findIdent n
        App f a -> App (substv f) (substv a)
        e -> e
    -- byte address where each block starts (block 0 = entry at 0)
    starts = scanl (\a b -> a + blockSize boxInts b * 4) 0 apps
    baseOf k = starts !! k
    blockWords = [ emitBlock rv32 seMark boxInts baseOf (baseOf k) blk | (k, blk) <- zip [0..] apps ]
    -- .mem is retired; the .S (asmText) is the only deliverable.
    memText = ""
    -- a function-entry block's address -> its source name (Fib.main, Fib.fib).
    funcAddr = [ (starts !! blockOf v, gasSym (showIdent n))
               | (n, v) <- M.toList defs
               , case v of { Var idn -> "PTR" `isPrefixOf` showIdent idn; _ -> False } ]
    nameOf a = lookup a funcAddr
    -- a reference's label: the target's function name, else L<addr>.
    lblOf a = maybe ("L" ++ show a) id (nameOf a)
    -- Only addresses referenced by a link/elink need an L<addr> label (function
    -- entries are always labelled by name).  ptr (low2=00) -> w; eptr -> w.&.~3.
    linkTargets =
      concatMap (\w -> case w .&. 3 of
                         0 -> [w]
                         1 -> [w .&. complement 3]
                         _ -> [])
                (concatMap (map fst) blockWords)
    -- assembler-ready listing for the `fun` binutils extension (gas syntax:
    -- `.text`/`.globl` headers, `#` comments, `.option arch, +xfun`, dot
    -- mnemonics, `.word` for int data).  Function entries are labelled by their
    -- source name (e.g. Fib.fib); other link targets get an `L<addr>:` label.
    asmText =
      "# fun assembly : " ++ progName ++ "  (entry @0)\n"
      ++ "\t.text\n"
      ++ concatMap (\nm -> "\t.globl\t" ++ nm ++ "\n") (sort (map snd funcAddr))
      -- `main` aliases the entry block so a fun program links with the shared
      -- SoC `startup_rv0.S` (`call main`) exactly like a C program does.
      ++ "\t.globl\tmain\n"
      ++ "\t.option arch, +xfun\n"
      ++ "main:\n"
      ++ unlines (concatMap asmBlock (zip3 ([0..]::[Int]) starts blockWords))
    asmBlock (k, bs, ws) =
      ("# --- block " ++ show k ++ " ---")
      : [ labelAt a ++ (if "raw " `isPrefixOf` mn then ".word 0x" ++ hex8 w ++ "\t# " ++ mn
                        else if w == effSentinel then mn
                        else asmOf lblOf w)
        | (i, (w, mn)) <- zip ([0..]::[Int]) ws, let a = bs + i*4 ]
    labelAt a = case nameOf a of
                  Just nm -> nm ++ ":\t"
                  Nothing | a `elem` linkTargets -> "L" ++ show a ++ ":\t"
                          | otherwise            -> "\t"
  in (memText, asmText)

-- Sanitize a Haskell function name into a gas-legal symbol.  gas symbols allow
-- [A-Za-z0-9_.$]; operator/qualified names like `Data.List.++` carry chars
-- (`+`, …) gas treats as operators, so each illegal char is escaped `$<hex>`.
-- The mapping is deterministic and injective, so labels and the fn.link/elink
-- references that name them stay consistent.
gasSym :: String -> String
gasSym s = guard (concatMap enc s)
  where
    ok c = c `elem` (['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9'] ++ "_.")
    enc c | ok c      = [c]
          | otherwise = '$' : pad (showHex (fromEnum c) "")
    pad [d] = ['0', d]
    pad ds  = ds
    -- a symbol must not start with `$` or a digit; prefix `_` if so.
    guard cs@(c:_) | c == '$' || (c >= '0' && c <= '9') = '_' : cs
    guard cs = cs

-- one word -> a line of `fun` assembly (gas).  `lbl` renders a ptr/eptr target
-- address to its label (function name or L<addr>).
--   ptr   -> fn.link  <label>                    (low2 = 00)
--   eptr  -> fn.elink <label>                    (low2 = 01)
--   combi -> fn.combi.t<type> <arity>, [<args>]  (low3 = 010)
--   int   -> .word    (a raw 29-bit int data word; the boxed --bare path never
--            hits this -- its ints/floats are databox payloads emitted verbatim)
-- Words with low2 = 11 are the custom graph ops (asmSys).
asmOf :: (Int -> String) -> Int -> String
asmOf lbl w =
  case w .&. 3 of
    0 -> "fn.link  " ++ lbl w
    1 -> "fn.elink " ++ lbl (w .&. complement 3)
    2 -> if w .&. 4 == 0
           then "fn.combi.t" ++ show ((w `shiftR` 4) .&. 0x7F)
                  ++ " " ++ show ((w `shiftR` 11) .&. 0x7) ++ ", ["
                  ++ intercalate "," [ show ((w `shiftR` (14 + 3*k)) .&. 0x7) | k <- [0..5] ]
                  ++ "]"
           else dotWord w ("int " ++ show (let v = (w `shiftR` 3) .&. 0x1FFFFFFF
                                           in if v >= 0x10000000 then v - 0x20000000 else v))
    _ -> asmSys w

-- low2 = 11 : a custom graph op.  These are the only fn.* words the encoder ever
-- produces here -- fn.y, the fn.box data marker, and the fn.cata/ana/para/hylo
-- recursion schemes -- and each is a real xfun mnemonic binutils re-assembles to
-- the identical word.  There are NO custom arithmetic/compare fn.* instructions
-- (that work is done by the RV32 blobs), so anything else is a generator bug:
-- halt loudly rather than emit a bogus word.
asmSys :: Int -> String
asmSys w
  | w == 0x0000005b            = "fn.y"
  | w == 0x0000605b            = "fn.box"
  | opc == opMorph && f3 <= 3  = "fn." ++ morphMnemonic f3            -- fn.cata/ana/para/hylo
  | otherwise = error ("GenRomMem.asmSys: unexpected fun word 0x" ++ hex8 w)
  where opc = w .&. 0x7F
        f3  = (w `shiftR` 12) .&. 0x7

-- a raw data word with an explanatory comment (only the databox payload uses this).
dotWord :: Int -> String -> String
dotWord w c = ".word 0x" ++ hex8 w ++ "\t# " ++ c

-- funct3 -> morphism scheme suffix (0=cata 1=ana 2=para 3=hylo); see wMorph.
morphMnemonic :: Int -> String
morphMnemonic 0 = "cata"
morphMnemonic 1 = "ana"
morphMnemonic 2 = "para"
morphMnemonic 3 = "hylo"
morphMnemonic n = error("morph" ++ show n)

-- IEEE-754 binary32 bit-pattern of a Double (round-to-nearest-even), as an Int.
-- A float literal boxes into a 1-word binary32 databox payload -- Main.floatBlobs
-- computes on the F datapath at single precision -- so the constant is narrowed
-- from the compiler's binary64 Double here.  Matches GHC's castFloatToWord32.
f32Bits :: Double -> Int
f32Bits d
  | isNaN d      = 0x7FC00000                       -- canonical quiet NaN
  | isInfinite d = sgn .|. 0x7F800000
  | am == 0      = sgn                              -- +/- 0.0
  | otherwise    = sgn .|. body
  where
    sgn = if d < 0 || isNegativeZero d then 0x80000000 else 0
    (am, e0) = decodeFloat (abs d)                  -- abs d = am * 2^e0, am in [2^52, 2^53)
    e2 = e0 + 52                                    -- unbiased exponent of the leading 1
    body
      | e2 > 127   = 0x7F800000                     -- overflow -> inf
      | e2 >= -126 =                                -- normal
          let q = roundShR am 29                    -- 53-bit mantissa -> 24-bit significand
          in if q >= 0x1000000                      -- rounding carried into a new exponent
             then if e2 + 1 > 127 then 0x7F800000 else ((e2 + 1 + 127) `shiftL` 23)
             else (((e2 + 127) `shiftL` 23) .|. (fromInteger q .&. 0x7FFFFF))
      | e2 >= -150 = fromInteger (roundShR am (negate (e0 + 149)))   -- subnormal (may round to min normal)
      | otherwise  = 0                              -- underflow -> +/- 0

-- m `shiftR` s, rounded to nearest even (s > 0 drops the low s bits).
-- Plain Integer arithmetic: mhs has no Bits Integer instance, and m >= 0 here
-- (it comes from decodeFloat (abs d)), so quot/rem are the shift/mask.
roundShR :: Integer -> Int -> Integer
roundShR m s
  | s <= 0    = m * (2 ^ negate s)
  | otherwise =
      let d    = 2 ^ s
          q    = m `quot` d
          r    = m `rem` d
          half = d `quot` 2
      in if r > half || (r == half && odd q) then q + 1 else q
