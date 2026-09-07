module MicroHs.GenRomMem(genRomMem) where
import Prelude(); import MHSPrelude
import MicroHs.Lex(readInt)   -- dialect-safe decimal String->Int
import Data.List
import Data.Bits
import Numeric(showHex)
import qualified MicroHs.IdentMap as M
import Data.Maybe
import Data.Array
import MicroHs.Desugar(LDef)
import MicroHs.Exp
import MicroHs.Expr(Lit(..), errorMessage, HasLoc(..))
import MicroHs.Ident(Ident(..), showIdent, mkIdent, qualOf)
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
  -- 64-bit values live in a SIZE=2 databox (DATABOX_SIZE_SPEC); these are
  -- shared blobs rather than inline arith, since each one is a dozen words.
  "mk64"      -> Just ("_prim_mk64",  True)
  "lo64"      -> Just ("_prim_lo64",  True)
  "hi64"      -> Just ("_prim_hi64",  True)
  "or64"      -> Just ("_prim_or64",  True)
  "and64"     -> Just ("_prim_and64", True)
  "xor64"     -> Just ("_prim_xor64", True)
  _           -> Nothing
wEff :: (String, Bool) -> MWord
wEff (sym, isval) = (effSentinel, (if isval then "jal ra, " else "j ") ++ sym)

-- --rvfun-linux PC-reducer: a primitive/effect head is an fn.elink into its RV32
-- blob (low2=01). Emitted as the real `fn.elink <sym>` mnemonic; gas lowers it to
-- `.word sym+1` and the linker resolves the symbol.
wElinkSym :: String -> MWord
wElinkSym sym = (effSentinel, "fn.elink " ++ sym)

-- a link to a symbol rather than to an address in this image: the target lives
-- in another object and the linker fills the %hi/%lo in
externTag :: String
externTag = "XSYM:"

wLinkSym :: String -> MWord
wLinkSym sym = (effSentinel, "fn.link  " ++ sym)

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
  "fsin" -> Just ("_prim_fsin",True)
  "fcos" -> Just ("_prim_fcos",True)
  "itof" -> Just ("_prim_itof", True)
  "ftoi" -> Just ("_prim_ftoi", True)
  -- mutable arrays: every operation is arity 2 (argument + IO continuation),
  -- so each is an ordinary pm-gated blob. A.rd/A.alloc/A.copy/A.size produce a
  -- value; A.setn/A.setsl/A.wr are effects. See Main.arrBlobs.
  "bs=="    -> Just ("_pm_bs_eq",      True)
  "bscmp"   -> Just ("_pm_bs_cmp",     True)
  "catch"   -> Just ("_pm_catch",     True)
  "A.wrb"   -> Just ("_pm_bs_wr",     True)
  "A.rdb"   -> Just ("_pm_bs_rd",     True)
  "A.read"  -> Just ("_pm_arr_read",  True)
  "A.write" -> Just ("_pm_arr_write", True)
  "A.alloc" -> Just ("_pm_arr_alloc", True)
  "A.size"  -> Just ("_pm_arr_size",  True)
  "A.copy"  -> Just ("_pm_arr_copy",  True)
  "io.putb" -> Just ("_pm_putb", True)
  -- buffered stdout/file byte IO (standard Prelude System.IO): arity-2 (arg + k),
  -- same shape as io.putb. setfd latches the fd; putbf writes a byte to it.
  "io.setfd"-> Just ("_pm_setfd", True)
  "io.putbf"-> Just ("_pm_putbf", True)
  -- perf self-reporting uses the GENERIC csrr/csrw mechanism (see litWord +
  -- csrBlobs in Main.hs): a Haskell `primitive "csrr 0xNNN"` / `"csrw 0xNNN"`.
  _      -> Nothing

-- The rest of System.IO -- opening a file, reading a byte, walking argv -- has
-- blobs on -rv64g ONLY (MicroHs.FunBlobs64): the host is Linux, so each one is
-- a raw syscall.  On xfun these stay effect sentinels for the .mem reducer,
-- which is why they are a separate table rather than more of primEff: adding
-- them there would leave a --bare link asking for blobs that target has no
-- business providing.
--   arity 2 (an argument and the continuation) is pm-gated like io.putbf;
--   the arity-1 readers are CPS values reached with only the continuation on
--   the spine, so they are the blob itself, exactly as a csrr read is.
primEff64 :: String -> Maybe (String, Bool)
primEff64 op = case op of
  "io.pathc"  -> Just ("_pm_pathc",  True)
  "io.open"   -> Just ("_pm_open",   True)
  "io.close"  -> Just ("_pm_close",  True)
  "io.argsel" -> Just ("_pm_argsel", True)
  "io.getb"   -> Just ("_pm_getb",   True)
  "io.getbf"  -> Just ("_pm_getbf",  True)
  "io.argc"   -> Just ("_pm_argc",   True)
  "io.argrd"  -> Just ("_pm_argrd",  True)
  _           -> Nothing

-- Arithmetic prims inlined IN-PLACE as their 4-word blob, so the spine head/arg is
-- the blob itself rather than an fn.elink into a shared blob -- saving one reduction
-- (the elink hop) per arithmetic op. Same body as primBlobs False (rv64): unbox the
-- two pre-forced operands (fn.tor), run the 32-bit *w op, re-box (fn.databox a0).
-- Compares stay fn.elink (they end in a combi branch, handled below). opInfix already
-- guarantees both operands are WHNF boxes here, so the blob may run unconditionally.
fusedArith :: [String]
fusedArith = [ "addw","subw","mulw","divw","divuw","remw","remuw"
             , "and","or","xor","sllw","srlw","sraw" ]

primArith :: Bool -> String -> Maybe [MWord]
primArith rv32 op = fmap blob (lookup op tbl)
  where
    tbl = [ ("+","addw"), ("-","subw"), ("*","mulw")
          , ("quot","divw"), ("uquot","divuw"), ("rem","remw"), ("urem","remuw")
          , ("and","and"), ("or","or"), ("xor","xor")
          , ("shl","sllw"), ("shr","srlw"), ("ashr","sraw") ]
    -- fn.databox a0 (NO destination register): the box is written IN PLACE
    -- over the cell the spine top points at -- the knot fn.y tied for this
    -- redex -- then the knot and the continuation are popped and the fetch
    -- resumes in the continuation.  It replaces three steps: allocate a box
    -- at hp, store elink(box) into the knot (fn.update), and jump through
    -- that indirection into the box (jr).  Two words of heap and a chased
    -- pointer per arithmetic op, gone; the redex root fn.y updated points at
    -- the knot, so a sharer reads a real box rather than a link to one.
    -- FUSED: the ALU op and the box are one instruction.  fn.<op> carries
    -- RV32's own funct3/funct7 under opcode 0x2b, so the core's existing ALU
    -- decode computes it and the reduce unit boxes the result into the knot:
    -- three instructions per arithmetic redex, no register writeback.
    -- The M-extension ops fuse too.  div/rem already leave through the
    -- divider's result mux, and a fused mul holds stage 2 for one cycle so
    -- the registered product is a plain register read when the box issues.
    blob ins
      | ins `elem` fusedArith =
                 [ (effSentinel, "fn.tor a0")
                 , (effSentinel, "fn.tor a1")
                 , (effSentinel, "fn." ++ unW rv32 ins ++ " a0, a1") ]
      | otherwise =
                 [ (effSentinel, "fn.tor a0")
                 , (effSentinel, "fn.tor a1")
                 , (effSentinel, unW rv32 ins ++ " a0,a0,a1")
                 , (effSentinel, "fn.databox a0") ]

-- Immediate-arith prim (from Abstract.opInfix immOpR/immOpL): a UNARY op with a
-- compile-time constant baked into an RV immediate instruction ("addiw 5", "ori 12",
-- "slliw 3", ...). 4-word blob: force the single operand to WHNF (the constant is no
-- longer a separate spine operand pre-forced by opInfix), unbox, run the immediate
-- op, re-box. The constant never becomes a graph node nor a combinator argument.
primImm :: Bool -> String -> Maybe [MWord]
primImm rv32 s = case words s of
  [ins, k] | ins `elem` ["addiw","andi","ori","xori","slliw","srliw","sraiw"] ->
      -- No fn.force: opInfix emits the operand FIRST (`op a b` becomes
      -- Y (b (a op)) and `var op K` becomes Y (var op_K)), so the single
      -- operand is already WHNF when the blob runs -- forcing it again is a
      -- no-op reduction.  FUSED IMMEDIATE: op and box in one instruction,
      -- as the binary form is.  fn.<op>i carries RV32I's funct3 and
      -- immediate layout under custom-0, so the constant stays out of the
      -- graph AND the result needs no second instruction to box it.
      Just [ (effSentinel, "fn.tor a0")
           , (effSentinel, "fn." ++ unW rv32 ins ++ " a0, " ++ k) ]
  _ -> Nothing

-- rv32: the *w ops ARE the base ops (payloads are 32-bit either way);
-- drop the w suffix so the rv32 gas accepts the mnemonic.
unW :: Bool -> String -> String
unW rv32 m = if rv32 && not (null m) && last m == 'w' then init m else m

-- no element repeats (arg-linearity test for the single-entry marker)
noDup :: [Int] -> Bool
noDup = goND 0
  where
    -- selectors are 0..7, so "seen" fits in a word and the whole test is one
    -- pass.  It used to be a notElem against the rest of the list for every
    -- element, run for every combinator the backend emits.
    goND :: Int -> [Int] -> Bool
    goND _    []       = True
    goND seen (y : ys)
      | y < 0 || y > 62 = y `notElem` ys && goND seen ys
      | otherwise       = (seen .&. b) == 0 && goND (seen .|. b) ys
      where b = 1 `shiftL` y

-- combinator: opcode[3:0]=0x2 (or 0xA if single-entry) | type[10:4] (7 bits T0..T64)
--   | arity[13:11] | args[31:14].  The single-entry bit (bit 3) extends the opcode:
--   when the seMark flag is on AND the combinator references each argument at most
--   once (noDup is = no shared arg), bit 3 is set so the reducer skips the WHNF
--   update for thunks headed by this combinator. SE combis are emitted as a raw
--   `.word` (gas would otherwise recompute the encoding without bit 3).
-- The combi word has room for an arity of 7, six argument slots, and argument
-- indices 0..6 (index 7 is the pattern ROM's ABSENT marker).  Overflowing any of
-- them used to be silent: the arity ran into the first argument field, extra
-- slots were dropped by `take 6`, and an index of 7 read back as "no argument".
-- The result was a graph that reduced to a two-cell cycle instead of an answer,
-- which is not something a program can be debugged out of.  Refuse instead.
wCombi :: Bool -> Bool -> Int -> Pat -> [Int] -> MWord
wCombi seM r64 arity p is
  | arity > 7 =
      error ("GenRomMem: combinator does not fit the fun word: arity " ++ show arity
             ++ " > 7 (pattern " ++ show p ++ ", args " ++ show is ++ ")")
  | length is > 6 =
      error ("GenRomMem: combinator does not fit the fun word: " ++ show (length is)
             ++ " argument slots > 6 (pattern " ++ show p ++ ", args " ++ show is ++ ")")
  | any (> 6) is =
      error ("GenRomMem: combinator does not fit the fun word: argument index "
             ++ show (maximum is) ++ " > 6, and 7 is the ROM's absent marker (pattern "
             ++ show p ++ ", args " ++ show is ++ ")")
wCombi seM r64 arity p is =
  -- the pattern number is what the whole word is built around, and deriving it
  -- is not free, so it is derived ONCE here rather than in a guard as well
  let t    = getPatNum p
      -- checked through the value the word is built from, so it is actually
      -- forced; as a bare binding it would never be looked at
      tok  = if t > 64
             then error ("GenRomMem: combinator does not fit the fun word: pattern number "
                         ++ show t ++ " > 64; the decoder implements 65 types, 0..64 ("
                         ++ show p ++ ", arity " ++ show arity ++ ", args " ++ show is ++ ")")
             else t
      args = take 6 (is ++ repeat 0)
      packed = foldr (.|.) 0 [ (a .&. 7) `shiftL` (14 + 3*k) | (a, k) <- zip args [0..] ]
      -- The single-entry mark makes the word RAW, and asmBlock emits a raw
      -- word as a literal .word.  On this target the graph is code, so a bare
      -- word is not executable and the program dies on it.  Until the runtime
      -- carries the mark, --single-entry is simply not applied here.
      se    = seM && not r64 && noDup is
      seBit = if se then 0x8 else 0
      w = 0x2 .|. seBit .|. ((tok .&. 0x7f) `shiftL` 4) .|. (arity `shiftL` 11) .|. packed
      mn = "combi t=" ++ show t ++ " ar=" ++ show arity ++ " args=" ++ show args
             ++ "  (" ++ show p ++ ")"
  in (w, if se then "raw " ++ mn ++ " SE" else mn)

-- does an argument need its own literal data word (vs being a ptr to a block)?
needsLit :: Exp -> Bool
needsLit (Var _) = False    -- PTR to another block
needsLit _       = True     -- int / float / combi / Y / prim head

-- the data word(s) for a literal node; an int under boxInts becomes a 2-word box.
-- seM: emit single-entry combi opcodes (see wCombi); does not change word count.
litWordsOf :: Bool -> Bool -> Bool -> Bool -> Exp -> [MWord]
litWordsOf _ _   bi _ (Lit (LInt n))    | bi = [wDataMarker, wDataPayload n]
litWordsOf _ _   bi _ (Lit (LDouble d)) | bi = [wDataMarker, wDataPayload (f32Bits d)]  -- binary32 float box
litWordsOf rv32 _   bi _ (Lit (LPrim op)) | bi, Just ws <- primImm rv32 op = ws    -- inline immediate-arith blob
litWordsOf rv32 _   bi _ (Lit (LPrim op)) | bi, Just ws <- primArith rv32 op = ws  -- inline arith blob
litWordsOf _ seM bi r64 a               = [litWord seM bi r64 a]

-- #words the spine terminator occupies (a boxed bare-int head is 2 words).
termCount :: Bool -> Exp -> Int
termCount bi (Lit (LInt _))    | bi = 2
termCount bi (Lit (LDouble _)) | bi = 2                                         -- 2-word float box
termCount bi (Lit (LPrim op)) | bi, Just ws <- primImm False op = length ws    -- 4-word immediate blob
termCount bi (Lit (LPrim op)) | bi, Just ws <- primArith False op = length ws  -- 4-word inline blob
termCount _  _                   = 1

-- an extern: a definition another object owns.  It stays a Var so that
-- needsLit, blockSize and the spine logic keep treating it as a pointer; only
-- the word it finally becomes differs, a symbol rather than an address.
externSym :: Exp -> Maybe String
externSym (Var i) | externTag `isPrefixOf` showIdent i = Just (drop (length externTag) (showIdent i))
externSym _ = Nothing

blockOf :: Exp -> Int
blockOf (Var i) | "PTR" `isPrefixOf` showIdent i = readInt (drop 3 (showIdent i))
blockOf e = error ("GenRomMem: expected PTR var, got " ++ show e)

-- A primitive the fun runtime does not provide becomes a NAMED halt stub (the
-- same treatment as a foreign import; see ffiText).  These are the host C
-- runtime's services -- heap serialization, host time, dynamic symbols -- and
-- the fun backend has no host to provide them: the program IS the graph.
-- Returning the stub symbol rather than failing the compile keeps the whole
-- set visible in one build, and a call that was assumed unreachable reports
-- which primitive it was.
unimpSym :: Bool -> String -> Maybe String
unimpSym bi op
  | op == "Y"                                          = Nothing
  | "csrr " `isPrefixOf` op                            = Nothing
  | "csrw " `isPrefixOf` op                            = Nothing
  | op == "seq"                                        = Nothing
  | bi, isJust (primEff op)                            = Nothing
  -- inlined in place by primImm/primArith, so it HAS an implementation and
  -- must not also be declared unimplemented: x + 1 was emitting a halt stub
  -- and its name string beside the addiw that actually does the work
  | bi, isJust (primImm False op)                      = Nothing
  | bi, isJust (primArith False op)                    = Nothing
  | isJust (effSym op)                                 = Nothing
  | "error" `isPrefixOf` op || "raise" `isPrefixOf` op = Nothing
  | otherwise                                          = Just ("_unimpprim_" ++ gasSym op)

-- the data word for a literal-arg / inline head node (seM: see wCombi/litWordsOf)
litWord :: Bool -> Bool -> Bool -> Exp -> MWord
litWord _   _  _   (Lit (LInt n))     = wInt n
litWord _   _  _   (Lit (LPrim "Y"))  = wY
litWord _   bi r64 (Lit (LPrim op))
  | "csrr " `isPrefixOf` op = wElinkSym ("_csrr_" ++ drop 5 op)     -- generic CSR read
  | "csrw " `isPrefixOf` op = wElinkSym ("_pm_csrw_" ++ drop 5 op)  -- generic CSR write
  | op == "seq"             = wElinkSym "_seq"  -- seq: force a0 then A returns a1 (blob; a bare fn.force has no continuation)
  | bi, Just pe <- primEff op = wElinkSym (fst pe)   -- prim -> fn.elink blob
  | r64, Just pe <- primEff64 op = wElinkSym (fst pe)  -- file/argv blob (rv64g)
  | Just se <- effSym op     = wEff se
  -- No fun encoding for this primitive (arithmetic lives in the RV32 blobs, so it
  -- must have matched primEff above under --bare).  Halt rather than emit junk.
  | "raise" `isPrefixOf` op = wElinkSym "_raise"
  | "error" `isPrefixOf` op = wElinkSym "_error0"
  | Just sym <- unimpSym bi op = wElinkSym sym
litWord seM _ r64 (Sc a p is) = wCombi seM r64 a p is
litWord _   _  _  (Morph s)   = wMorph s
-- A C FFI import has no fun runtime -- the program IS the graph, with no C side
-- to call into -- so it becomes a named stub that halts (emitted by ffiText
-- below).  A float literal needs the boxed-int representation (handled in
-- litWordsOf under --bare); reaching here means it was requested without boxing.
litWord _   _  _ (Lit (LForImp nm _)) = wElinkSym ("_unimpfi_" ++ gasSym nm)
litWord _   _  _ (Lit (LDouble _))    = error "GenRomMem: float literal requires the boxed (--bare) representation"
litWord _   _  _ e                = error ("GenRomMem: bad literal " ++ show e)

-- 8-digit zero-padded hex
hex8 :: Int -> String
hex8 x = let s = showHex (x .&. 0xFFFFFFFF) "" in replicate (8 - length s) '0' ++ s

-- size of a block in words: #args pushes + terminator words + literal-arg words
blockSize :: Bool -> [Exp] -> Int
blockSize _  []          = 0
blockSize bi (hd : args) =
  length args + termCount bi hd
              + sum [ litWordCount bi a | a <- args, needsLit a ]

-- How many words a literal argument occupies.  blockSize only needs the
-- COUNT, but it used to get it by building the words with litWordsOf and
-- measuring the list -- which runs litWord, and so wCombi and getPatNum, for
-- every combinator argument in the program, purely to learn the answer is 1.
-- emitBlock then builds the very same words again to emit them.  Under GHC
-- that duplication is invisible; at 116k reductions per byte of output it is
-- not.  rv32/seM/r64 cannot change a count, so they are not taken.
litWordCount :: Bool -> Exp -> Int
litWordCount bi (Lit (LInt _))    | bi = 2   -- marker + payload
litWordCount bi (Lit (LDouble _)) | bi = 2
litWordCount bi (Lit (LPrim op))
  | bi, Just ws <- primImm False op   = length ws
  | bi, Just ws <- primArith False op = length ws
litWordCount _ _ = 1

-- emit one block (head : args) given its base byte address and the block-base map.
-- Returns the words (with mnemonics) in address order.
emitBlock :: Bool -> Bool -> Bool -> Bool -> (Int -> Int) -> Int -> [Exp] -> [MWord]
emitBlock rv32 seM bi r64 baseOf bs (hd : args) =
  let na       = length args
      ntw      = length termWs
      litAddr w = bs + (na + ntw + w) * 4
      go []       _ = ([], [])
      go (a : as) w
        | needsLit a = let lw       = litWordsOf rv32 seM bi r64 a
                           (ps, ls) = go as (w + length lw)
                       in (wPtr (litAddr w) : ps, lw ++ ls)         -- ptr to this lit's first word
        | Just sym <- externSym a
                     = let (ps, ls) = go as w
                       in (wLinkSym sym : ps, ls)                   -- link to another OBJECT
        | otherwise  = let (ps, ls) = go as w
                       in (wPtr (baseOf (blockOf a)) : ps, ls)      -- ptr to another block
      (pushes, lits) = go (reverse args) 0
      -- the head (leftmost source node) terminates the spine; a pointer head is
      -- promoted to eptr (ptr | 1) so fetch resumes there. A bare-int head under
      -- boxInts is a 2-word box.
      termWs = case hd of
               Lit (LInt n)    | bi    -> [wDataMarker, wDataPayload n]
               Lit (LDouble d) | bi    -> [wDataMarker, wDataPayload (f32Bits d)]  -- binary32 float box
               Sc a p is              -> [wCombi seM r64 a p is]
               Morph s                -> [wMorph s]
               _ | Just sym <- externSym hd -> [wElinkSym sym]
               Var _                  -> [wEptr (baseOf (blockOf hd))]
               Lit (LPrim "Y")        -> [wY]
               Lit (LPrim op)
                 | "csrr " `isPrefixOf` op -> [wElinkSym ("_csrr_" ++ drop 5 op)]    -- generic CSR read
                 | "csrw " `isPrefixOf` op -> [wElinkSym ("_pm_csrw_" ++ drop 5 op)] -- generic CSR write
                 | op == "seq"             -> [wElinkSym "_seq"]   -- seq: force a0 then A returns a1 (blob)
                 | bi, Just ws <- primImm rv32 op -> ws                    -- immediate-arith: INLINE blob
                 | bi, Just ws <- primArith rv32 op -> ws                  -- arith: INLINE blob (no fn.elink)
                 | bi, Just pe <- primEff op -> [wElinkSym (fst pe)]   -- compare/effect -> fn.elink blob
                 | r64, Just pe <- primEff64 op -> [wElinkSym (fst pe)]  -- file/argv blob (rv64g)
                 | Just se <- effSym op    -> [wEff se]
                 | "raise" `isPrefixOf` op -> [wElinkSym "_raise"]
                 | "error" `isPrefixOf` op -> [wElinkSym "_error0"]
                 | Just sym <- unimpSym bi op -> [wElinkSym sym]
               Lit (LInt n)           -> [wInt n]   -- bare int head (CAF value), 29-bit
               Lit (LForImp nm _)     -> [wElinkSym ("_unimpfi_" ++ gasSym nm)]
               e                      -> error ("GenRomMem: bad head " ++ show e)
  in pushes ++ termWs ++ lits
emitBlock _ _ _ _ _ _ [] = []

-- ---------------------------------------------------------------------------
-- traversal : identical addressing to GenRomOScala, collecting Applications
-- as atom lists ([Exp]) in heap-address order instead of building Scala text.
-- ---------------------------------------------------------------------------

-- returns (.mem machine-code text, .S assembly-listing text)
genRomMem :: String -> Bool -> Bool -> Bool -> Bool -> Bool -> Maybe Ident -> (Ident, [LDef]) -> (String, String)
genRomMem progName wrapIO0 boxInts seMark rv32 rv64g libMod (mainName0, ldefs0) =
  let
    -- Separate compilation.  With -c this object holds THIS module's
    -- definitions and nothing else; a reference to another module is emitted
    -- as an undefined symbol and the linker resolves it, which is what a .c
    -- file does.  fn_link already goes through %hi/%lo, so an external target
    -- needs no new relocation -- the macro was always link-time addressed.
    -- The synthetic entry wrapper carries no module qualifier, so name it
    -- local explicitly; it belongs to whichever object defines main.
    isLocal n = case libMod of
                  Nothing -> True
                  Just mn -> qualOf n == mn || n == mainName
    -- The entry glue -- the performIO wrapper and the `main` alias the startup
    -- code calls -- belongs to whichever object defines main, exactly as crt0
    -- finds main in whatever .o defined it.  Every other object is a library.
    ownsMain = case libMod of
                 Nothing -> True
                 Just _  -> any ((== mainName0) . fst) ldefs0
    wrapIO = wrapIO0 && ownsMain
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
        Nothing | not (isLocal n) ->
          -- another module owns it: record it as an external symbol and do NOT
          -- walk into it, so its graph stays in ITS object
          put (i, ptr, combs, M.insert n (Var (mkIdent (externTag ++ gasSym (showIdent n)))) seen, r)
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
    -- Roots: the entry for a program, every definition this module owns for a
    -- library object -- an exported name has no other way in.
    -- The entry goes FIRST so it is block 0, which is what `main` labels.
    roots = case libMod of
              Nothing -> [mainName]
              Just _  -> (if ownsMain then [mainName] else [])
                         ++ [ i | (i, _) <- ldefs, isLocal i, i /= mainName ]
    (_, (_, _, _, defs, apps)) = runState (mapM_ dfs roots) (0, 0, 0, M.empty, [])

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
    --
    -- Everything below is keyed by address, and a program the size of the
    -- compiler has hundreds of thousands of them, so each of these has to be
    -- a lookup and not a scan.  They used to be `starts !! k`, `lookup a
    -- funcAddr` and `a `elem` linkTargets` -- an O(n) walk inside a loop that
    -- runs once per emitted word, which is quadratic and is the whole reason
    -- this backend was slower than the C one, which lays out no addresses at
    -- all and so has none of these lookups to do.
    starts = scanl (\a b -> a + blockSize boxInts b * 4) 0 apps
    nblk   = length apps
    startsA = listArray (0, nblk) starts :: Array Int Int
    baseOf k = startsA ! k
    blockWords = [ emitBlock rv32 seMark boxInts rv64g baseOf b blk
                 | (b, blk) <- zip starts apps ]
    -- .mem is retired; the .S (asmText) is the only deliverable.
    memText = ""
    -- a function-entry block's address -> its source name (Fib.main, Fib.fib).
    funcAddr = [ (baseOf (blockOf v), gasSym (showIdent n))
               | (n, v) <- M.toList defs
               , case v of { Var idn -> "PTR" `isPrefixOf` showIdent idn; _ -> False } ]
    -- one word per address in the image: the function name that starts there
    -- (empty when none), and whether any link/elink names it.
    -- Labels are SPARSE -- a name here, a link target there -- so they are held
    -- in search trees sized by the number of labels, not in arrays sized by the
    -- program's address space.  Building an array over every word cost a cons
    -- per word of the whole image before the first line could be printed;
    -- these cost one pass over the labels and answer in log time.
    nameTree = fromSorted (dedupFst (sortOn fst funcAddr))
    tgtTree  = fromSorted [ (a, ()) | a <- sortUniq linkTargets ]
    nameOf a = atLookup a nameTree
    isLinkTarget a = isJust (atLookup a tgtTree)
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
      ++ (if ownsMain then "\t.globl\tmain\n" else "")
      ++ "\t.option arch, +xfun\n"

      ++ unlines (concatMap asmBlock (zip3 ([0..]::[Int]) starts blockWords))
      ++ ffiText
    -- Every foreign import, and every primitive with no fun encoding, gets a
    -- named stub: it loads a pointer to its own name and jumps to the shared
    -- halt (Main.haltBlobs), so a call that was assumed unreachable reports
    -- WHAT it was instead of running off into the graph.  Anything the fun
    -- runtime must really provide is implemented as a blob and never gets here.
    -- dedup by GROUPING the sorted list, not with nub: nub is quadratic and
    -- compares strings, and this list carries every primitive in every
    -- definition of the program.  After sort the duplicates are already
    -- adjacent, so the two are the same answer -- but nub is what stalled the
    -- compiler when it was itself running as a graph.
    -- Only the definitions the program can actually REACH.  The blocks come
    -- from the walk out of main, but this list used to be taken from every
    -- definition handed to the backend -- so `main = return ()` emitted a stub
    -- for acos, asin, calloc, free and every other foreign import in the
    -- library, none of which it can call.
    reach = [ d | d@(i, _) <- ds, isJust (M.lookup i defs) ]
    ffiNames = map head (group (sort ([ ("_unimpfi_" ++ gasSym nm, nm) | (_, e) <- reach, nm <- forImpsOf e ]
                       ++ [ (sym, op) | (_, e) <- reach, op <- primsOf e
                          , Just sym <- [unimpSym boxInts op] ])))
    ffiText
      | null ffiNames = ""
      | otherwise =
          "\n# --- unimplemented foreign-import / primitive stubs ---\n"
          ++ concatMap stub ffiNames
      where
        -- WEAK.  The stub is a FALLBACK, not a decision.  An image that never
        -- calls the import still links and halts if it does -- which the RTL
        -- path relies on, since a thin image references _unimpfi_exp and
        -- friends for library code it never runs.  But a library linked
        -- alongside can DEFINE the symbol for real and the linker takes the
        -- strong one, which is how funboot/rv64g/sdlfun.S provides sdl_open
        -- and funmath.S provides sqrt.  Without .weak those collide.
        stub (sym, nm) =
          "\t.balign 4\n\t.weak " ++ sym ++ "\n" ++ sym ++ ":\n"
          ++ "\tla a0, " ++ sym ++ "$name\n"
          ++ "\ttail _unimpfi_halt\n"   -- a graph outgrows a jal, on both widths
          ++ sym ++ "$name:\n\t.asciz \"" ++ nm ++ "\"\n\t.balign 4" ++ fill ++ "\n"
        -- in a code section GAS pads an alignment with whole NOPs, and when the
        -- remainder is not a multiple of the instruction width -- which is what
        -- a string leaves -- it silently emits nothing, so the next label lands
        -- at an odd address.  rv64g has no compressed instructions to fall back
        -- on, so name the fill.
        fill = if rv64g then ", 0" else ""

    forImpsOf :: Exp -> [String]
    forImpsOf (Lit (LForImp nm _)) = [nm]
    forImpsOf (App f a)            = forImpsOf f ++ forImpsOf a
    forImpsOf (Lam _ e)            = forImpsOf e
    forImpsOf _                    = []

    primsOf :: Exp -> [String]
    primsOf (Lit (LPrim op)) = [op]
    primsOf (App f a)        = primsOf f ++ primsOf a
    primsOf (Lam _ e)        = primsOf e
    primsOf _                = []
    -- One section per definition, so the linker can drop the ones the program
    -- never reaches -- -ffunction-sections, and dead code stripping becomes
    -- --gc-sections.  A definition's body blocks follow its entry and stay in
    -- its section, so a kept function keeps all of itself.
    sectionAt a = case nameOf a of
                    Just nm -> ["\t.section\t.text." ++ nm ++ ",\"ax\",@progbits"]
                    Nothing -> []
    asmBlock (k, bs, ws) =
      sectionAt bs
      ++ (if ownsMain && k == 0 then ["main:"] else [])
      -- ALIGN EVERY BLOCK to 32 bytes: a combinator header is a run of up
      -- to six fn.links plus its combi word (<= 28 bytes), and the fetch
      -- gathers the run from one 64-byte h-cache line.  Packed back-to-back,
      -- whether a header straddles a line boundary is placement luck -- the
      -- old gc-poll blobs happened to pad Braun's hot blocks favourably, and
      -- deleting them cost +3k cycles of unattributed extra-fetch stall.  At
      -- 32-byte starts a header can never straddle.  Labels are symbolic in
      -- this route, so the assembler carries the alignment.
      ++ ("\t.p2align 4")
      : ("# --- block " ++ show k ++ " ---")
      : [ labelAt a ++ (if "raw " `isPrefixOf` mn then ".word 0x" ++ hex8 w ++ "\t# " ++ mn
                        else if w == effSentinel then (if rv64g then macroise mn else mn)
                        else asmOf rv64g lblOf w)
                    ++ boxBody prev
        | (i, ((w, mn), prev)) <- zip ([0..]::[Int]) (zip ws (0 : map fst ws))
        , let a = bs + i*4 ]
    -- rv64g: a box is the marker cell and the payload at cell+4, and fn.tor
    -- reads that slot.  A macro expansion cannot keep it, so fn_box is only
    -- the jump over the payload and the body comes after the payload word.
    boxBody prev | rv64g && prev == 0x605b = "\n\tfn_box_body"
                 | otherwise               = ""
    labelAt a = case nameOf a of
                  Just nm -> nm ++ ":\t"
                  Nothing | isLinkTarget a       -> "L" ++ show a ++ ":\t"
                          | otherwise            -> "\t"
  in (memText, asmText)

-- A search tree built from a SORTED association list.  Construction splits at
-- the middle so the tree is balanced by construction, and lookup is log in the
-- number of entries -- which for labels is far smaller than the address space
-- an array would have to span.
data AddrTree a = ATip | ABin Int a (AddrTree a) (AddrTree a)

fromSorted :: forall a . [(Int, a)] -> AddrTree a
fromSorted [] = ATip
fromSorted xs =
  case splitAt (length xs `quot` 2) xs of
    (l, (k, v) : r) -> ABin k v (fromSorted l) (fromSorted r)
    (l, [])         -> fromSorted l

atLookup :: forall a . Int -> AddrTree a -> Maybe a
atLookup _ ATip = Nothing
atLookup k (ABin k' v l r)
  | k == k'   = Just v
  | k <  k'   = atLookup k l
  | otherwise = atLookup k r

-- keep the first entry for each address (names win over later duplicates)
dedupFst :: forall a . [(Int, a)] -> [(Int, a)]
dedupFst ((a, v) : rest) = (a, v) : dedupFst (dropWhile ((== a) . fst) rest)
dedupFst []              = []

-- sort and drop duplicates: the target list has one entry per reference, and
-- many references name the same cell.
sortUniq :: [Int] -> [Int]
sortUniq = uniq . sort
  where uniq (x:y:r) | x == y = uniq (y:r)
        uniq (x:r)            = x : uniq r
        uniq []               = []

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
          | otherwise = '$' : pad (map lc (showHex (fromEnum c) ""))
    -- showHex's case is the host library's business -- GHC gives a-f, mhs
    -- gives A-F -- and the mangled name must not depend on which compiler
    -- built the compiler.  Pinned here so a self-compiled mhs emits the same
    -- symbol as a GHC-built one.
    lc c = if c >= 'A' && c <= 'F' then toEnum (fromEnum c + 32) else c
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
-- On a stock RV64GC host there is no xfun extension, so the same word is
-- rendered as a MACRO invocation instead of an instruction (funboot/rv64g).
-- The structure of the emitted assembly is otherwise identical, which is what
-- keeps the linker layout the same as the rvfun backend's: one cell per word,
-- the same labels, the same block boundaries.
-- the effect-sentinel words carry a ready-made mnemonic; on RV64GC the same
-- mnemonic names a macro instead of an instruction
macroise :: String -> String
macroise m = case m of
               'f':'n':'.':r -> "fn_" ++ r
               -- entering a box: on the rvfun machine that is an ordinary JALR
               -- because every cell is a fun word, but here it has to go
               -- through the dispatch that tells a compiled block from a cell
               -- the runtime allocated.
               "jr a0"       -> "fn_go a0"
               _             -> m

asmOf :: Bool -> (Int -> String) -> Int -> String
asmOf rv64g lbl w =
  case w .&. 3 of
    0 -> mnem "fn.link  " "fn_link  " ++ lbl w
    1 -> mnem "fn.elink " "fn_elink " ++ lbl (w .&. complement 3)
    2 -> if w .&. 4 == 0
           then if rv64g
                  then "fn_combi_t" ++ show ((w `shiftR` 4) .&. 0x7F)
                         ++ " " ++ show ((w `shiftR` 11) .&. 0x7) ++ ", "
                         ++ intercalate "," [ show ((w `shiftR` (14 + 3*k)) .&. 0x7) | k <- [0..5] ]
                  else "fn.combi.t" ++ show ((w `shiftR` 4) .&. 0x7F)
                         ++ " " ++ show ((w `shiftR` 11) .&. 0x7) ++ ", ["
                         ++ intercalate "," [ show ((w `shiftR` (14 + 3*k)) .&. 0x7) | k <- [0..5] ]
                         ++ "]"
           else dotWord w ("int " ++ show (let v = (w `shiftR` 3) .&. 0x1FFFFFFF
                                           in if v >= 0x10000000 then v - 0x20000000 else v))
    _ -> asmSys rv64g w
  where mnem fun mac = if rv64g then mac else fun

-- low2 = 11 : a custom graph op.  These are the only fn.* words the encoder ever
-- produces here -- fn.y, the fn.box data marker, and the fn.cata/ana/para/hylo
-- recursion schemes -- and each is a real xfun mnemonic binutils re-assembles to
-- the identical word.  There are NO custom arithmetic/compare fn.* instructions
-- (that work is done by the RV32 blobs), so anything else is a generator bug:
-- halt loudly rather than emit a bogus word.
asmSys :: Bool -> Int -> String
asmSys rv64g w
  | w == 0x0000005b            = if rv64g then "fn_y" else "fn.y"
  | w == 0x0000605b            = if rv64g then "fn_box" else "fn.box"
  | opc == opMorph && f3 <= 3  = (if rv64g then "fn_" else "fn.") ++ morphMnemonic f3
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
