module Taut where

import Prelude()
import NanoPrelude

data Exp a
  = And (Exp a) (Exp a)
  | Const Bool
  | Implies (Exp a) (Exp a)
  | Not (Exp a)
  | Var a

find x s = fromJust $ lookup x s

eval s (Const b)       = b
eval s (Var x)         = find x s
eval s (Not p)         = if eval s p then False    else True
eval s (And p q)       = if eval s p then eval s q else False
eval s (Implies p q)   = if eval s p then eval s q else True

vars (Const b)         = []
vars (Var x)           = [x]
vars (Not p)           = vars p
vars (And p q)         = (vars p) ++ (vars q)
vars (Implies p q)     = (vars p) ++ (vars q)

con x xs = x : xs

bools n = if n == 0
            then [[]]
            else let m = n - (1::Int)
                 in  (map (con False) (bools m)) ++
                     (map (con True ) (bools m))

neq x y = x /= y

rmdups []         = []
rmdups (x : xs) = x : rmdups (filter (neq x) xs)

substs p = let vs = rmdups (vars p)
           in  map (zip vs) (bools (length vs))

isTaut p = and (map (flip eval p) (substs p))

-- Small main
names = [0::Int, 1, 2, 3, 4, 5] -- "abcdef"
imp v = Implies (Var (42::Int)) (Var v)
testProp = Implies
             (foldr1 And (map imp names))
             (Implies (Var (42::Int)) (foldr1 And (map Var names)))
main = if isTaut testProp then 1::Int else 0

{-
-- Large main
-- (Reduceron/Heron input: names "abcdefghijklmnop" + 'q'; vars coded
--  as Ints a..p = 0..15, q = 42 - a pure renaming)
names = [0::Int,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
imp v = Implies (Var (42::Int)) (Var v)
testProp = Implies
             (foldr1 And (map imp names))
             (Implies (Var (42::Int)) (foldr1 And (map Var names)))
-- main = if isTaut testProp then 1::Int else 0
-}
