-- NQueensMorphM.hs - NQueens in the exp3_8m idiom.
--
-- Two things in  gen n = [ q:b | b <- gen (n-1), q <- enumFromTo 1 nq, safe q 1 b ]:
--   * enumFromTo 1 nq does not depend on b, but the comprehension rebuilds it
--     for every b it visits.  Named once outside.
--   * nsoln = length (gen nq) conses a fresh board for every solution and then
--     throws them all away to count them.  The last level folds into the count
--     directly, so those boards are never built.

module NQueensMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

nsoln :: Int -> Int
nsoln nq = countLast (gen (nq - 1))
 where
  qs :: [Int]
  qs = enumFromTo 1 nq          -- built once, not once per board

  safe :: Int -> Int -> [Int] -> Bool
  safe x = fix (\ rec d ->
                  \ l -> case l of
                           []      -> True
                           (q : t) -> x /= q && x /= q+d && x /= q-d && rec (d+1) t)

  gen :: Int -> [[Int]]
  gen = fix (\ rec n ->
               if n == 0
                 then [[]]
                 else concatMap (\ b -> foldr (\ q acc -> if safe q 1 b
                                                            then (q : b) : acc
                                                            else acc) [] qs)
                                (rec (n - 1)))

  -- the final level is counted, not built
  countq :: [Int] -> Int
  countq b = foldr (\ q a -> if safe q 1 b then a + 1 else a) 0 qs

  countLast :: [[Int]] -> Int
  countLast = fix (\ rec bs ->
                     case bs of
                       []       -> 0
                       (b : bt) -> countq b + rec bt)

bench :: Int
bench = nsoln 5

main :: Int
main = bench
