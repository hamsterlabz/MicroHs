-- ChurchMorph.hs — Church/Peano numerals via per-structure
-- catamorphism (the morph style: a hand-written `cataNat` and
-- algebra records, all specialised to Nat).
--
-- Operations are expressed as F-algebras over Nat:
--
--   plus  a b = cata (NatAlg b S)         a
--   times a b = cata (NatAlg Z (plus b))  a
--   exp   a   = cata (NatAlg (S Z) (times a))
--
-- pred uses a paramorphism (needs the original sub-Nat).

module ChurchMorph (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Nat = Z | S Nat

-- F-algebra for Nat: separate seed (Z case) + step (S case).
data NatAlg r = NatAlg
  { naZ :: r
  , naS :: r -> r
  }

cataNat :: NatAlg r -> Nat -> r
cataNat alg Z     = naZ alg
cataNat alg (S n) = naS alg (cataNat alg n)

-- Paramorphism over Nat: algebra also receives the original
-- predecessor subterm.
data NatPara r = NatPara
  { npZ :: r
  , npS :: Nat -> r -> r
  }

paraNat :: NatPara r -> Nat -> r
paraNat alg Z     = npZ alg
paraNat alg (S n) = npS alg n (paraNat alg n)

-- Operations -----------------------------------------------

plus :: Nat -> Nat -> Nat
plus a b = cataNat (NatAlg b S) a

times :: Nat -> Nat -> Nat
times a b = cataNat (NatAlg Z (plus b)) a

exp_ :: Nat -> Nat -> Nat
exp_ a = cataNat (NatAlg (S Z) (times a))

-- pred via paramorphism: the S-step ignores the recursive
-- result and returns the original subterm.
pred_ :: Nat -> Nat
pred_ = paraNat (NatPara Z (\sub _ -> sub))

-- Conversions ---------------------------------------------

intToNat :: Int -> Nat
intToNat 0 = Z
intToNat n = S (intToNat (n - 1))

natToIntAlg :: NatAlg Int
natToIntAlg = NatAlg (0::Int) (+ 1)

natToInt :: Nat -> Int
natToInt = cataNat natToIntAlg

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
