-- TautMorphM.hs - Taut written in the exp3_8m idiom: each recursion is a
-- Mendler catamorphism tied with Fix, so the recursive result is NAMED by the
-- algebra and therefore shared.
--
-- Taut.hs writes `bools m` twice in the same expression:
--     (map (con False) (bools m)) ++ (map (con True) (bools m))
-- Two occurrences are two graph nodes, so the whole subtree is built twice at
-- every level -- 2^n work for an n-deep recursion.  In the Mendler form the
-- algebra binds the recursive result once and uses it twice, which is the same
-- thing mulMM does by folding instead of re-walking.

module TautMorphM where

import Prelude()
import NanoPrelude

data Exp a
  = And (Exp a) (Exp a)
  | Const Bool
  | Implies (Exp a) (Exp a)
  | Not (Exp a)
  | Var a

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

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

-- the recursive result is bound ONCE by the algebra
bools :: Int -> [[Bool]]
bools = fix (\ rec n ->
               if n == 0
                 then [[]]
                 else let bs = rec (n - (1::Int))
                      in  map (con False) bs ++ map (con True) bs)

neq x y = x /= y

rmdups = fix (\ rec xs ->
                case xs of
                  []       -> []
                  (y : ys) -> y : rec (filter (neq y) ys))

substs p = let vs = rmdups (vars p)
           in  map (zip vs) (bools (length vs))

isTaut p = and (map (flip eval p) (substs p))

names = [0::Int, 1, 2, 3, 4, 5]
imp v = Implies (Var (42::Int)) (Var v)
testProp = Implies
             (foldr1 And (map imp names))
             (Implies (Var (42::Int)) (foldr1 And (map Var names)))
main = if isTaut testProp then 1::Int else 0
