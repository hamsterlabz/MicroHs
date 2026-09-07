-- ChurchMorphXFix.hs — Church/Peano numerals via the generic Morphx
-- library, using the Fix-of-functor representation.  This is the
-- original textbook Milewski form: every Nat value carries an
-- explicit `Fix`/`unFix` wrapping at each recursive node.
--
-- Slower than the project/embed variant (ChurchMorphX.hs) because
-- the Fix newtype's wrap/unwrap obstructs GHC's specialiser at the
-- recursive call sites — pays its cost at every S-node.


module ChurchMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data NatF r = ZF | SF r

type Nat = Fix NatF

z :: Nat
z = Fix ZF

s :: Nat -> Nat
s n = Fix (SF n)

plus :: Nat -> Nat -> Nat
plus a b = cata fmap alg a
  where
    alg :: Algebra NatF Nat
    alg ZF     = b
    alg (SF r) = Fix (SF r)

times :: Nat -> Nat -> Nat
times a b = cata fmap alg a
  where
    alg :: Algebra NatF Nat
    alg ZF     = z
    alg (SF r) = plus b r

exp_ :: Nat -> Nat -> Nat
exp_ a b = cata fmap alg b
  where
    alg :: Algebra NatF Nat
    alg ZF     = s z
    alg (SF r) = times a r

pred_ :: Nat -> Nat
pred_ = para fmap alg
  where
    alg :: NatF (Nat, Nat) -> Nat
    alg ZF              = z
    alg (SF (sub, _r))  = sub

intToNat :: Int -> Nat
intToNat 0 = z
intToNat n = s (intToNat (n - 1))

natToInt :: Nat -> Int
natToInt = cata fmap alg
  where
    alg :: Algebra NatF Int
    alg ZF     = 0
    alg (SF r) = 1 + r

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

instance Functor NatF where
  fmap _ ZF = ZF
  fmap f (SF a) = SF (f a)

