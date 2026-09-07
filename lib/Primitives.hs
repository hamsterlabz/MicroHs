-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
module Primitives(module Primitives) where
import Prelude()              -- do not import Prelude
import Data.Bool_Type
--import Data.List_Type
import Data.Ordering_Type

-- These fixities are hardwired
-- infixr -1 ->
-- infixr -2 =>
infix   4 ~

-- Kinds
data Constraint
data Nat
data Symbol
data Type

-- Classes
-- Type equality as a constraint.
-- class a ~ b | a -> b, b -> a
-- class KnownNat in Data.TypeLits
-- class KnownSymbol in Data.TypeLits

-- Types
data AnyType
--data Char
newtype Char = Char Word
data Int
data FloatW
data IO a
data Word
data Ptr a
data ForeignPtr a
data FunPtr a
data IOArray a
-- (), (,), (,,), etc are built in to the compiler

primIntAdd :: Int -> Int -> Int
primIntAdd  = primitive "+"
primIntSub :: Int -> Int -> Int
primIntSub  = primitive "-"
primIntMul :: Int -> Int -> Int
primIntMul  = primitive "*"
primIntQuot :: Int -> Int -> Int
primIntQuot = primitive "quot"
primIntRem :: Int -> Int -> Int
primIntRem  = primitive "rem"
-- fun backend: the machine has one subtract instruction and no negate, so the
-- reversed and unary forms are that instruction (as primWordInv is xor).
primIntSubR :: Int -> Int -> Int
primIntSubR x y = primIntSub y x
primIntNeg :: Int -> Int
primIntNeg x = primIntSub 0 x

-- The numeric comparisons are the KappaMutor branch instructions
-- (fn_beq/bne/blt/ble/bgt/bge): a branch compares its two Int operands and
-- selects one of two target arguments.  The raw branch instructions take both
-- targets explicitly; the Bool-valued comparisons below select between the
-- False and True constructors, so a comparison used as a value yields a proper
-- Bool ADT (correct when shared, stored, or passed to a higher-order function).
-- An if/&&/||/case consumes that Bool by Scott-applying its own two targets.
primBranchEQ, primBranchNE, primBranchLT, primBranchLE, primBranchGT, primBranchGE
  :: Int -> Int -> a -> a -> a
primBranchEQ = primitive "=="
primBranchNE = primitive "/="
primBranchLT = primitive "<"
primBranchLE = primitive "<="
primBranchGT = primitive ">"
primBranchGE = primitive ">="

primIntEQ   :: Int -> Int -> Bool
primIntEQ x y = primBranchEQ x y False True
primIntNE   :: Int -> Int -> Bool
primIntNE x y = primBranchNE x y False True
primIntLT   :: Int -> Int -> Bool
primIntLT x y = primBranchLT x y False True
primIntLE   :: Int -> Int -> Bool
primIntLE x y = primBranchLE x y False True
primIntGT   :: Int -> Int -> Bool
primIntGT x y = primBranchGT x y False True
primIntGE   :: Int -> Int -> Bool
primIntGE x y = primBranchGE x y False True

primFloatWAdd :: FloatW -> FloatW -> FloatW
primFloatWAdd  = primitive "f+"
primFloatWSub :: FloatW -> FloatW -> FloatW
primFloatWSub  = primitive "f-"
primFloatWMul :: FloatW -> FloatW -> FloatW
primFloatWMul  = primitive "f*"
primFloatWDiv :: FloatW -> FloatW -> FloatW
primFloatWDiv = primitive "f/"
primFloatWNeg :: FloatW -> FloatW
primFloatWNeg = primitive "fneg"

primFloatWEQ :: FloatW -> FloatW -> Bool
primFloatWEQ = primitive "f=="
primFloatWNE :: FloatW -> FloatW -> Bool
primFloatWNE = primitive "f/="
primFloatWLT :: FloatW -> FloatW -> Bool
primFloatWLT = primitive "f<"
primFloatWLE :: FloatW -> FloatW -> Bool
primFloatWLE = primitive "f<="
primFloatWGT :: FloatW -> FloatW -> Bool
primFloatWGT = primitive "f>"
primFloatWGE :: FloatW -> FloatW -> Bool
primFloatWGE = primitive "f>="
primFloatWShow :: FloatW -> [Char]
primFloatWShow = primitive "fshow"
primFloatWRead :: [Char] -> FloatW
primFloatWRead = primitive "fread"
primFloatWFromInt :: Int -> FloatW
primFloatWFromInt = primitive "itof"

primWordAdd :: Word -> Word -> Word
primWordAdd  = primitive "+"
primWordSub :: Word -> Word -> Word
primWordSub  = primitive "-"
primWordMul :: Word -> Word -> Word
primWordMul  = primitive "*"
primWordQuot :: Word -> Word -> Word
primWordQuot = primitive "uquot"
primWordRem :: Word -> Word -> Word
primWordRem  = primitive "urem"
primWordAnd :: Word -> Word -> Word
primWordAnd  = primitive "and"
primWordOr :: Word -> Word -> Word
primWordOr  = primitive "or"
primWordXor :: Word -> Word -> Word
primWordXor  = primitive "xor"
primWordShl :: Word -> Int -> Word
primWordShl  = primitive "shl"
primWordShr :: Word -> Int -> Word
primWordShr  = primitive "shr"
primWordAshr :: Word -> Int -> Word
primWordAshr  = primitive "ashr"
primWordInv :: Word -> Word
primWordInv x = primWordXor x (primWordSub 0 1)   -- ~x = x `xor` all-ones (no fun NOT)
-- Representation casts.  Int, Word, Ptr, FunPtr and a raw float payload are all
-- ONE boxed machine word on the fun backend, so every cast between them is the
-- identity -- there is nothing for a machine primitive to do.
primWordToFloatWRaw :: Word -> FloatW
primWordToFloatWRaw = primUnsafeCoerce
primWordFromFloatWRaw :: FloatW -> Word
primWordFromFloatWRaw = primUnsafeCoerce

primIntAnd :: Int -> Int -> Int
primIntAnd  = primitive "and"
primIntOr :: Int -> Int -> Int
primIntOr  = primitive "or"
primIntXor :: Int -> Int -> Int
primIntXor  = primitive "xor"
primIntShl :: Int -> Int -> Int
primIntShl  = primitive "shl"
primIntShr :: Int -> Int -> Int
primIntShr  = primitive "ashr"
primIntInv :: Int -> Int
primIntInv x = primIntXor x (primIntSub 0 1)       -- ~x = x `xor` (-1)

primWordEQ  :: Word -> Word -> Bool
primWordEQ  = primitive "=="
primWordNE  :: Word -> Word -> Bool
primWordNE  = primitive "/="
primWordLT  :: Word -> Word -> Bool
primWordLT  = primitive "u<"
primWordLE   :: Word -> Word -> Bool
primWordLE   = primitive "u<="
primWordGT   :: Word -> Word -> Bool
primWordGT   = primitive "u>"
primWordGE   :: Word -> Word -> Bool
primWordGE   = primitive "u>="

primWordToInt :: Word -> Int
primWordToInt = primitive "I"
primIntToWord :: Int -> Word
primIntToWord = primitive "I"

-- Char is represented by Word
primCharEQ :: Char -> Char -> Bool
primCharEQ  = primitive "=="
primCharNE :: Char -> Char -> Bool
primCharNE  = primitive "/="
primCharLT :: Char -> Char -> Bool
primCharLT  = primitive "u<"
primCharLE :: Char -> Char -> Bool
primCharLE  = primitive "u<="
primCharGT :: Char -> Char -> Bool
primCharGT  = primitive "u>"
primCharGE :: Char -> Char -> Bool
primCharGE  = primitive "u>="

primFix    :: forall a . (a -> a) -> a
primFix    = primitive "Y"

primSeq    :: forall a b . a -> b -> b
primSeq    = primitive "seq"

--primEqual  :: forall a . a -> a -> Bool
--primEqual  = primitive "equal"

-- Works for Int, Char, String
primStringCompare :: forall a . [Char] -> [Char] -> Ordering
primStringCompare  = primitive "scmp"
-- fun backend: three-way compares from the branch primitives + LT/EQ/GT (no
-- icmp/ucmp primitive: fun has no Ordering-returning compare instruction).
primBranchULT :: forall a . Word -> Word -> a -> a -> a
primBranchULT  = primitive "u<"
primBranchUEQ :: forall a . Word -> Word -> a -> a -> a
primBranchUEQ  = primitive "=="
primIntCompare :: forall a . Int -> Int -> Ordering
primIntCompare x y = primBranchLT x y (primBranchEQ x y GT EQ) LT
primCharCompare :: forall a . Char -> Char -> Ordering
primCharCompare x y = primIntCompare (primOrd x) (primOrd y)
primWordCompare :: forall a . Word -> Word -> Ordering
primWordCompare x y = primBranchULT x y (primBranchUEQ x y GT EQ) LT

primStringEQ  :: [Char] -> [Char] -> Bool
primStringEQ  = primitive "sequal"

-- fun backend: Char is an Int; ord/chr are the identity coercion (= I).
primChr :: Int -> Char
primChr = primitive "I"
primOrd :: Char -> Int
primOrd = primitive "I"

primUnsafeCoerce :: forall a b . a -> b
primUnsafeCoerce = primitive "I"

-- fun backend: the IO monad is CPS — IO a = (a -> r) -> r — bridged with
-- unsafeCoerce (= I) since `data IO a` is abstract. >>=/>>/return/performIO are
-- pure combinators; effect leaves (io.putb, io.getb, file ops) are mediated
-- riscv-as-atoms. CPS sequences for free (no seq, no world-forcing).
primBind         :: forall a b . IO a -> (a -> IO b) -> IO b
primBind m k      = primUnsafeCoerce (\ c -> primUnsafeCoerce m (\ a -> primUnsafeCoerce (k a) c))
primThen         :: forall a b . IO a -> IO b -> IO b
primThen m n      = primUnsafeCoerce (\ c -> primUnsafeCoerce m (\ _ -> primUnsafeCoerce n c))
primReturn       :: forall a . a -> IO a
primReturn x      = primUnsafeCoerce (\ k -> k x)
-- fun backend: no global arg-ref primitive — a fresh 1-cell array. [] isn't in
-- scope here (Data.List_Type would cycle), so init with a coerced placeholder;
-- a mediated helper populates real argv later.
primGetArgRef    :: IO (IOArray [[Char]])
primGetArgRef     = primArrAlloc 1 (primUnsafeCoerce (0 :: Int))
primPerformIO    :: forall a . IO a -> a
primPerformIO m   = primUnsafeCoerce m (\ a -> a)

-- Deep forcing is a service of the C runtime's graph walk; the fun backend has
-- no host to walk the graph.  It does not need one: Control.DeepSeq defines the
-- container instances structurally (rnf = rnf1 -> liftRnf), so this default is
-- reached only for ATOMIC types -- Int, Char, Word, Double -- whose WHNF already
-- IS their normal form.  Forcing to WHNF is therefore exact here, and both
-- variants agree because an atom cannot carry an error inside it.
-- Forcing is NOT safe to do blindly here: if the value is a function, its WHNF
-- is an under-applied combinator, which the machine reports as NORMAL_FORM and
-- redirects to the NF_ADDR epilogue -- a terminal state, not a value.  Every use
-- of these in the compiler is a space/GC hint ("makes execution slower, but
-- speeds up GC"), so not forcing is semantically safe; the container instances
-- in Control.DeepSeq do the real structural work anyway.
primRnfErr       :: forall a . a -> ()
primRnfErr      _ = ()

primRnfNoErr     :: forall a . a -> ()
primRnfNoErr    _ = ()

primNewCAStringLen :: [Char] -> IO (Ptr Char, Int)
primNewCAStringLen = primitive "newCAStringLen"

primPeekCAString :: Ptr Char -> IO [Char]
primPeekCAString = primitive "peekCAString"

primPeekCAStringLen :: Ptr Char -> Int -> IO [Char]
primPeekCAStringLen = primitive "peekCAStringLen"

primWordToPtr :: forall a . Word -> Ptr a
primWordToPtr = primUnsafeCoerce

primPtrToWord :: forall a . Ptr a -> Word
primPtrToWord = primUnsafeCoerce

primIntToPtr :: forall a . Int -> Ptr a
primIntToPtr = primUnsafeCoerce

primPtrToInt :: forall a . Ptr a -> Int
primPtrToInt = primUnsafeCoerce

primFunPtrToWord :: forall a . FunPtr a -> Word
primFunPtrToWord = primUnsafeCoerce

primIntToFunPtr :: forall a . Int -> FunPtr a
primIntToFunPtr = primUnsafeCoerce

primFunPtrToPtr :: forall a b . FunPtr a -> Ptr b
primFunPtrToPtr = primUnsafeCoerce

primPtrToFunPtr :: forall a b . Ptr a -> FunPtr b
primPtrToFunPtr = primUnsafeCoerce

-- Size in bits of Word/Int.
-- Will get constant folded on first use.
_wordSize :: Int
_wordSize = loop (primWordInv (0::Word)) (0::Int)
  where
    loop :: Word -> Int -> Int
    loop w n = if w `primWordEQ` (0::Word) then n else loop (primWordShr w (1::Int)) (n `primIntAdd` (1::Int))

-- Is this Windows?
foreign import ccall "iswindows" c_iswindows :: IO Int
_isWindows :: Bool
_isWindows = primPerformIO c_iswindows `primIntEQ` 1

-- Mutable arrays on the fun machine.  A primitive call is gated on arity 2
-- (the reducer's fn.seq gate: one argument plus the IO continuation), so the
-- three- and four-argument operations are sequenced in IO out of arity-2
-- pieces -- the same shape as io.setfd/io.putbf, which latch an fd and then
-- use it.  An IOArray handle is a boxed Int: the address of the array header
-- in the heap arena (the header word holds the element count), so slot
-- addressing is ordinary Int arithmetic and array identity is Int equality.
--
-- ORDERING: every argument a blob FORCES is forced before the latch it belongs
-- to, and the blob that consumes a latch forces nothing.  A nested array
-- operation inside a forced thunk therefore completes before the latch is
-- written, and nothing can run between that write and its use.

-- The atoms take their arguments AND the continuation DIRECTLY.  A bare effect
-- atom used as a value is ONE shared graph node, and composing that node with
-- primBind re-walks it -- the same rule System.Environment's argcK follows, and
-- the shape System.IO's c_putb uses.
-- The array primitives take the array and an INDEX, which is what the C
-- runtime provides and what a cell heap can express -- there are no addresses
-- to compute there.  The fun runtime does the address arithmetic inside its
-- blobs instead, so one API serves both backends.
--
-- The atoms take their arguments AND the continuation DIRECTLY.  A bare effect
-- atom used as a value is ONE shared graph node, and composing that node with
-- primBind re-walks it -- the same rule System.Environment's argcK follows.
prim_arr_alloc :: forall a b . Int -> a -> (IOArray a -> b) -> b
prim_arr_alloc  = primitive "A.alloc"
prim_arr_copy  :: forall a b . IOArray a -> (IOArray a -> b) -> b
prim_arr_copy   = primitive "A.copy"
prim_arr_size  :: forall a b . IOArray a -> (Int -> b) -> b
prim_arr_size   = primitive "A.size"
prim_arr_read  :: forall a b . IOArray a -> Int -> (a -> b) -> b
prim_arr_read   = primitive "A.read"
-- the last argument is the continuation ALREADY APPLIED to (): the blob just
-- enters it, the same shape the other effect atoms use
prim_arr_write :: forall a b . IOArray a -> Int -> a -> b -> b
prim_arr_write  = primitive "A.write"

-- Raw byte access, for ByteString.  The generic array stores an unforced NODE
-- per element, so comparing two arenas word by word would compare pointers,
-- not bytes -- equal bytes built separately are different nodes.  These store
-- and load the VALUE, which is what makes bs==/bscmp a plain word loop.
prim_bs_wr :: forall a b . IOArray a -> Int -> a -> b -> b
prim_bs_wr  = primitive "A.wrb"
prim_bs_rd :: forall a b . IOArray a -> Int -> (a -> b) -> b
prim_bs_rd  = primitive "A.rdb"

primBSWriteByte :: forall a . IOArray a -> Int -> a -> IO ()
primBSWriteByte a i v = primUnsafeCoerce (\ c -> prim_bs_wr a i v (c ()))
primBSReadByte  :: forall a . IOArray a -> Int -> IO a
primBSReadByte a i = primUnsafeCoerce (\ c -> prim_bs_rd a i c)

-- Packed ByteString comparison.  Identifier comparison is the compiler's
-- hottest operation by far -- Ident carries a Text, Text is a ByteString, and
-- every map lookup compares them -- so these are runtime blobs that walk the
-- arena in RISC-V rather than a list walk through the graph.
primBSeqA  :: forall a . IOArray a -> IOArray a -> Bool
primBSeqA   = primitive "bs=="
primBScmpA :: forall a . IOArray a -> IOArray a -> Ordering
primBScmpA  = primitive "bscmp"

primArrAlloc :: forall a . Int -> a -> IO (IOArray a)
primArrAlloc n a = primUnsafeCoerce (\ c -> prim_arr_alloc n a c)

primArrCopy :: forall a . IOArray a -> IO (IOArray a)
primArrCopy a = primUnsafeCoerce (\ c -> prim_arr_copy a c)

primArrSize :: forall a . IOArray a -> IO Int
primArrSize a = primUnsafeCoerce (\ c -> prim_arr_size a c)

primArrRead :: forall a . IOArray a -> Int -> IO a
primArrRead a i = primUnsafeCoerce (\ c -> prim_arr_read a i c)

primArrWrite :: forall a . IOArray a -> Int -> a -> IO ()
primArrWrite a i v = primUnsafeCoerce (\ c -> prim_arr_write a i v (c ()))

-- Not referentially transparent: handles are addresses, so identity is Int equality
primArrEQ :: forall a . IOArray a -> IOArray a -> Bool
primArrEQ x y = primIntEQ (primUnsafeCoerce x) (primUnsafeCoerce y)

-- fun backend: ForeignPtr = Ptr = an fd/handle; these are identity/no-ops (the
-- heap bumps, no finalizers, no GC needed in the fun runtime).
primGC :: IO ()
primGC = primReturn ()

primForeignPtrToPtr :: ForeignPtr a -> Ptr a
primForeignPtrToPtr = primUnsafeCoerce

primNewForeignPtr :: Ptr a -> IO (ForeignPtr a)
primNewForeignPtr p = primReturn (primUnsafeCoerce p)

primAddFinalizer :: FunPtr (Ptr a -> IO ()) -> ForeignPtr a -> IO ()
primAddFinalizer _ _ = primReturn ()


-- 64-bit values, held in a SIZE=2 fn.databox (low word at +4, high at +8).
data W64
primMk64 :: Int -> Int -> W64
primMk64 = primitive "mk64"
primLo64 :: W64 -> Int
primLo64 = primitive "lo64"
primHi64 :: W64 -> Int
primHi64 = primitive "hi64"
primOr64 :: W64 -> W64 -> W64
primOr64 = primitive "or64"
primAnd64 :: W64 -> W64 -> W64
primAnd64 = primitive "and64"
primXor64 :: W64 -> W64 -> W64
primXor64 = primitive "xor64"
