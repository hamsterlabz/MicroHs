-- ChurchMorphXBB.hs — Church / Boehm-Berarducci encoding of Nat.
--
-- The data type IS its own catamorphism — no pattern functor, no
-- Fix, no project / embed.  A Nat is a polymorphic fold:
--
--     newtype Nat = Nat { foldNat :: forall r. r -> (r -> r) -> r }
--
-- Constructing `S (S Z)` allocates two closures; the fold is the
-- value itself, applied to the algebra components (z, s).  Every
-- recursion scheme reduces to function application.

{-# LANGUAGE RankNTypes #-}

module ChurchMorphXBB (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

-- The recursive type IS the catamorphism.
newtype Nat = Nat { foldNat :: forall r. r -> (r -> r) -> r }

zero :: Nat
zero = Nat (\z _ -> z)

suc :: Nat -> Nat
suc n = Nat (\z s -> s (foldNat n z s))

-- Peano operations: pure cata-applications.
plus :: Nat -> Nat -> Nat
plus a b = Nat (\z s -> foldNat a (foldNat b z s) s)

times :: Nat -> Nat -> Nat
times a b = Nat (\z s -> foldNat a z (\r -> foldNat b r s))

exp_ :: Nat -> Nat -> Nat
exp_ a b = foldNat b (suc zero) (times a)

-- pred via Church-style "scott encoding" trick: pair (n, n+1),
-- iterate (\(a, b) -> (b, suc b)) n times, take the first slot.
pred_ :: Nat -> Nat
pred_ n = fst (foldNat n (zero, zero) step)
  where step (_, b) = (b, suc b)

-- Conversions ----------------------------------------------

intToNat :: Int -> Nat
intToNat 0 = zero
intToNat n = suc (intToNat (n - 1))

natToInt :: Nat -> Int
natToInt n = foldNat n (0::W) (+ 1)

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
