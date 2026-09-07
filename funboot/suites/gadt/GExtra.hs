-- GExtra.hs — extra prelude surface for the GADT suite under the KappaMutor
-- (NanoPrelude / Int-only) dialect.  Provides the bitwise primitives wired to
-- the hardware ALU opcodes, plus a handful of list helpers NanoPrelude lacks.
--
-- All monomorphic at Int (= W); no typeclasses, matching the dictionary-free
-- combinator subset the KappaMutor codegen accepts.
module GExtra(module GExtra) where

import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)

-- ---- bitwise primitives (hardware ALU opcodes) -------------------------
-- MicroHs Int primitive names: and / or / xor / shl / ashr.
-- (Int shiftR is the arithmetic ashr, which is exactly what the ALU "shr"
--  opcode computes.)

infixl 7 .&.
infixl 6 `xor`
infixl 5 .|.
infixl 8 `shiftL`, `shiftR`

xor :: Int -> Int -> Int
xor = primitive "xor"

(.&.) :: Int -> Int -> Int
(.&.) = primitive "and"

(.|.) :: Int -> Int -> Int
(.|.) = primitive "or"

shiftL :: Int -> Int -> Int
shiftL = primitive "shl"

shiftR :: Int -> Int -> Int
shiftR = primitive "shr"   -- LOGICAL (matches the C uint32 >>; at 32-bit boxed it must not sign-extend)

-- Unsigned remainder / quotient. The C side is uint32 (% and /); signed rem/quot
-- diverge once a value has bit 31 set (e.g. an LCG state), so gadt checksum
-- arithmetic must use these where the C is unsigned.
umod :: Int -> Int -> Int
umod = primitive "urem"

udiv :: Int -> Int -> Int
udiv = primitive "uquot"

-- Unsigned comparisons: W is the unsigned-32-bit checksum/key type, and the C
-- side compares uint32. Signed (<) diverges once a value has bit 31 set (LCG
-- keys), so the gadt suite uses these. Loop counters are non-negative, where
-- unsigned == signed, so this is safe everywhere.
infix 4 <, <=, >, >=
(<) :: Int -> Int -> Bool
(<) = primitive "u<"
(<=) :: Int -> Int -> Bool
(<=) = primitive "u<="
(>) :: Int -> Int -> Bool
(>) = primitive "u>"
(>=) :: Int -> Int -> Bool
(>=) = primitive "u>="
min :: Int -> Int -> Int
min a b = if a <= b then a else b
max :: Int -> Int -> Int
max a b = if a <= b then b else a

-- ---- list helpers not in NanoPrelude -----------------------------------

reverse :: forall a . [a] -> [a]
reverse = foldl (flip (:)) []

zipWith :: forall a b c . (a -> b -> c) -> [a] -> [b] -> [c]
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys
zipWith _ _ _           = []

take :: forall a . Int -> [a] -> [a]
take n _ | n <= 0 = []
take _ []         = []
take n (x:xs)     = x : take (n - 1) xs

drop :: forall a . Int -> [a] -> [a]
drop n xs | n <= 0 = xs
drop _ []          = []
drop n (_:xs)      = drop (n - 1) xs

splitAt :: forall a . Int -> [a] -> ([a], [a])
splitAt n xs = (take n xs, drop n xs)

last :: forall a . [a] -> a
last [x]    = x
last (_:xs) = last xs
last []     = primitive "error1"

even :: Int -> Bool
even x = (x .&. 1) == 0

odd :: Int -> Bool
odd x = (x .&. 1) /= 0

-- W = Int here, so fromIntegral is the identity (the sources use it to lift the
-- Int loop counter into the W checksum type).
fromIntegral :: Int -> Int
fromIntegral x = x

-- W -> FloatW, unsigned. Two exact steps then ONE rounding add, the same
-- sequence on both backends (the shim defines it identically over Word32),
-- so the binary32 result is bit-identical regardless of W's signedness.
wToD :: Int -> FloatW
wToD w = fromIntD (shiftR w 16) *. fromIntD 65536 +. fromIntD (w .&. 65535)
