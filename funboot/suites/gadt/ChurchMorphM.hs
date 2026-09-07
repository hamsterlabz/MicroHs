-- ChurchMorphM.hs — Peano arithmetic via Mendler-style.

module ChurchMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Nat = Z | S Nat

plus :: Nat -> Nat -> Nat
plus a0 b = mcata go a0
  where
    go _   Z     = b
    go rec (S n) = S (rec n)

times :: Nat -> Nat -> Nat
times a0 b = mcata go a0
  where
    go _   Z     = Z
    go rec (S n) = plus b (rec n)

exp_ :: Nat -> Nat -> Nat
exp_ a = mcata go
  where
    go _   Z     = S Z
    go rec (S n) = times a (rec n)

pred_ :: Nat -> Nat
pred_ Z     = Z
pred_ (S n) = n

intToNat :: Int -> Nat
intToNat 0 = Z
intToNat n = S (intToNat (n - 1))

natToInt :: Nat -> Int
natToInt n0 = mcata go n0
  where
    go _   Z     = (0::W)
    go rec (S n) = 1 + rec n

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    three = intToNat 3
    eight = intToNat 8
    step i acc =
      let a   = intToNat ((fromIntegral i `mod` 6) + 2)
          b   = intToNat ((fromIntegral i `mod` 4) + 3)
          e   = fromIntegral (natToInt (exp_ three eight))
          pn  = fromIntegral (natToInt (plus a b))
          tn  = fromIntegral (natToInt (times a b))
          dn  = fromIntegral (natToInt (pred_ a))
      in  acc `hashMix` e `hashMix` pn `hashMix` tn `hashMix` dn

main :: Int
main = bench 4
