-- ChurchPure.hs — Church/Peano numerals via direct ADT recursion.
-- Based on the nofib `exp3_8` benchmark: every operation pattern-
-- matches on the constructors and recurses explicitly.
--
--   data Nat = Z | S Nat
--   plus  Z     b = b
--   plus  (S a) b = S (plus a b)
--   times Z     _ = Z
--   times (S a) b = plus b (times a b)
--   exp   _     Z     = S Z
--   exp   a     (S b) = times a (exp a b)
--
-- exp 3 8 = 6561 (S-of-S-of-... 6561 deep), as in the nofib test.

module ChurchPure (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Nat = Z | S Nat

plus :: Nat -> Nat -> Nat
plus Z     b = b
plus (S a) b = S (plus a b)

times :: Nat -> Nat -> Nat
times Z     _ = Z
times (S a) b = plus b (times a b)

exp_ :: Nat -> Nat -> Nat
exp_ _ Z     = S Z
exp_ a (S b) = times a (exp_ a b)

pred_ :: Nat -> Nat
pred_ Z     = Z
pred_ (S n) = n

intToNat :: Int -> Nat
intToNat 0 = Z
intToNat n = S (intToNat (n - 1))

natToInt :: Nat -> Int
natToInt Z     = 0
natToInt (S n) = 1 + natToInt n

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    three  = intToNat 3
    eight  = intToNat 8
    step i acc =
      let a   = intToNat ((fromIntegral i `mod` 6) + 2)
          b   = intToNat ((fromIntegral i `mod` 4) + 3)
          e   = fromIntegral (natToInt (exp_ three eight))   -- 6561
          pn  = fromIntegral (natToInt (plus a b))
          tn  = fromIntegral (natToInt (times a b))
          dn  = fromIntegral (natToInt (pred_ a))
      in  acc `hashMix` e `hashMix` pn `hashMix` tn `hashMix` dn

main :: Int
main = bench 4
