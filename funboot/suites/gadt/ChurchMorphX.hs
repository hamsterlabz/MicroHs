-- ChurchMorphX.hs — Church/Peano numerals via the generic Morphx
-- library, with a custom per-ADT `fmap` instead of project/embed.
--
--   data Nat    = Z | S Nat            -- the recursive ADT (direct, no Fix)
--   data NatF r = ZF | SF r            -- the pattern functor (no Functor instance!)
--
--   fmapNat :: (Nat -> a) -> Nat -> NatF a   -- combines project + structural fmap
--
--   cata' fmapNat alg = alg . fmapNat (cata' fmapNat alg)

module ChurchMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

-- Direct recursive ADT.
data Nat = Z | S Nat

-- Pattern functor — no Functor instance; we provide a custom
-- fmap below.
data NatF r = ZF | SF r

-- The per-ADT fmap (cata-direction): projects one layer of Nat
-- into NatF and applies the recursive function to the recursive
-- position in one step.
fmapNat :: (Nat -> a) -> Nat -> NatF a
fmapNat _ Z     = ZF
fmapNat f (S n) = SF (f n)

-- The per-ADT fmap (ana-direction): builds one layer of Nat from
-- a NatF whose recursive positions are seeds.
fmapNatE :: (a -> Nat) -> NatF a -> Nat
fmapNatE _ ZF     = Z
fmapNatE f (SF k) = S (f k)

-- The per-ADT fmap (para-direction): same as cata-direction but
-- paired with the subterm.
fmapNatP :: (Nat -> (Nat, a)) -> Nat -> NatF (Nat, a)
fmapNatP _ Z     = ZF
fmapNatP f (S n) = SF (f n)

-- Operations as F-algebras --------------------------------

plus :: Nat -> Nat -> Nat
plus a b = cata' fmapNat alg a
  where
    alg :: NatF Nat -> Nat
    alg ZF     = b
    alg (SF r) = S r

times :: Nat -> Nat -> Nat
times a b = cata' fmapNat alg a
  where
    alg :: NatF Nat -> Nat
    alg ZF     = Z
    alg (SF r) = plus b r

exp_ :: Nat -> Nat -> Nat
exp_ a b = cata' fmapNat alg b
  where
    alg :: NatF Nat -> Nat
    alg ZF     = S Z
    alg (SF r) = times a r

pred_ :: Nat -> Nat
pred_ = para' fmapNatP alg
  where
    alg :: NatF (Nat, Nat) -> Nat
    alg ZF              = Z
    alg (SF (sub, _r))  = sub

-- Conversions ---------------------------------------------

intToNat :: Int -> Nat
intToNat = ana' fmapNatE coalg
  where
    coalg :: Int -> NatF Int
    coalg 0 = ZF
    coalg n = SF (n - 1)

natToInt :: Nat -> Int
natToInt = cata' fmapNat alg
  where
    alg :: NatF Int -> Int
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
