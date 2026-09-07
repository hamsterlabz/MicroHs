-- QueensAnaM.hs - the same anamorphism, Mendler style: the recursion is the
-- placeholder handed to the algebra, tied with Fix.

module QueensAnaM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

-- the blocked-set test: the list answers for itself, no notElem helper
free :: Int -> [Int] -> Bool
free x []       = True
free x (y : ys) = x /= y && free x ys

nsoln :: Int -> Int
nsoln nq = step nq [] [] []
  where
    qs = enumFromTo 1 nq

    step :: Int -> [Int] -> [Int] -> [Int] -> Int
    step = fix (\ rec n ->
                  \ cols -> \ d1 -> \ d2 ->
                    if n == 0
                      then 1::Int
                      else foldr (\ q acc ->
                                    if free q cols && free q d1 && free q d2
                                      then rec (n - 1) (q : cols)
                                               (map (\ x -> x + 1) (q : d1))
                                               (map (\ x -> x - 1) (q : d2))
                                           + acc
                                      else acc)
                                 0 qs)

main :: Int
main = nsoln 6
