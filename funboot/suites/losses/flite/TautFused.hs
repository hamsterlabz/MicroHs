-- TautFused.hs - Taut fully restructured.
--
-- Taut.hs is  and (map (flip eval p) (substs p))  with
--   substs p = map (zip vs) (bools (length vs))
-- so it BUILDS all 2^n boolean lists, then zips each into an environment list,
-- then evaluates each.  Build immediately followed by consume: the environments
-- never need to exist.  Assign one variable per level and evaluate at the leaf.

module TautFused where

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

neq x y = x /= y

rmdups []       = []
rmdups (x : xs) = x : rmdups (filter (neq x) xs)

-- one variable assigned per level, evaluated at the leaf; no bools list, no
-- substitution list.  && short-circuits, so a counterexample stops the walk.
isTaut p = go (rmdups (vars p)) []
  where
    go []       env = eval env p
    go (v : vs) env = go vs ((v, False) : env) && go vs ((v, True) : env)

names = [0::Int, 1, 2, 3, 4, 5]
imp v = Implies (Var (42::Int)) (Var v)
testProp = Implies
             (foldr1 And (map imp names))
             (Implies (Var (42::Int)) (foldr1 And (map Var names)))
main = if isTaut testProp then 1::Int else 0
