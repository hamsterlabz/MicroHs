-- Exp38MorphC.hs - the OTHER half of exp3_8m.fn: the functor catamorphism
--   cata f alg x = alg (f (cata f alg) x)
--   fmap_p f n   = n Zero (\a -> Succ (f a))
--   natC z next  = (cata fmap_p) (\b -> b z (\a -> next a))
-- Wu is untyped, so fmap_p can put a non-Nat under Succ; the typed equivalent
-- names that one layer NatF, which is what Succ-of-a-result means.

module Exp38MorphC where

import Prelude()
import NanoPrelude

data Nat  = Succ Nat | Zero
data NatF a = SuccF a | ZeroF

-- fmap_p: project one layer and apply f at the recursive position
fmapP :: forall a . (Nat -> a) -> Nat -> NatF a
fmapP f n = case n of
              Zero   -> ZeroF
              Succ a -> SuccF (f a)

-- cata f alg x = alg (f (cata f alg) x)
cata :: forall a . ((Nat -> a) -> Nat -> NatF a) -> (NatF a -> a) -> Nat -> a
cata f alg x = alg (f (cata f alg) x)

natC :: forall a . a -> (a -> a) -> Nat -> a
natC z next = cata fmapP (\ b -> case b of
                                   ZeroF   -> z
                                   SuccF a -> next a)

addM :: Nat -> Nat -> Nat
addM x y = natC y Succ x

mulM :: Nat -> Nat -> Nat
mulM x y = natC Zero (addM y) x

powM :: Nat -> Nat -> Nat
powM x y = natC (Succ Zero) (mulM x) y

toIntM :: Nat -> Int
toIntM = natC 0 (\ a -> a + 1)

n1 :: Nat
n1 = Succ Zero
n2 :: Nat
n2 = Succ n1
n3 :: Nat
n3 = Succ n2
n4 :: Nat
n4 = Succ n3
n5 :: Nat
n5 = Succ n4
n6 :: Nat
n6 = Succ n5
n7 :: Nat
n7 = Succ n6
n8 :: Nat
n8 = Succ n7

main :: Int
main = toIntM (powM n3 n8)
