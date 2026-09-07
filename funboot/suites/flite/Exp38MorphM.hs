-- Exp38MorphM.hs - port of fun-bmarks src/exp3_8_morph/exp3_8m.fn
--
-- The path the original `main` actually takes: powMM / mulMM / addMM, built on
--   nats z f = Fix (\s n -> n z (\a -> f (s a)))
-- which is a Mendler catamorphism over Nat -- `s` is the recursive placeholder
-- and the knot is Fix, not a self-referential binding.

module Exp38MorphM where

import Prelude()
import NanoPrelude

data Nat = Succ Nat | Zero

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

-- nats z f = Fix (\s n -> case n of Zero -> z ; Succ a -> f (s a))
nats :: forall a . a -> (a -> a) -> Nat -> a
nats z f = fix (\ s n -> case n of
                           Zero   -> z
                           Succ a -> f (s a))

addMM :: Nat -> Nat -> Nat
addMM x y = nats y Succ x

mulMM :: Nat -> Nat -> Nat
mulMM x y = nats Zero (addMM y) x

powMM :: Nat -> Nat -> Nat
powMM x y = nats (Succ Zero) (mulMM x) y

toIntM :: Nat -> Int
toIntM = nats 0 (\ a -> a + 1)

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
main = toIntM (powMM n3 n8)
