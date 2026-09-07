-- Exp38Pure.hs - port of fun-bmarks src/exp3_8/exp3_8.fn
--
-- Wu is untyped and Scott-encoded, so `x y (\a -> ...)` IS the case on x:
--   adds x y = x y (\a -> Succ (adds a y))
-- reads as  case x of Zero -> y ; Succ a -> Succ (adds a y).
-- Naive recursion throughout, exactly as the original.

module Exp38Pure where

import Prelude()
import NanoPrelude

data Nat = Succ Nat | Zero

adds :: Nat -> Nat -> Nat
adds Zero     y = y
adds (Succ a) y = Succ (adds a y)

muls :: Nat -> Nat -> Nat
muls _ Zero     = Zero
muls x (Succ a) = adds (muls x a) x

pows :: Nat -> Nat -> Nat
pows _ Zero     = Succ Zero
pows x (Succ a) = muls x (pows x a)

toInt :: Nat -> Int
toInt Zero     = 0
toInt (Succ a) = 1 + toInt a

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
main = toInt (pows n3 n8)
