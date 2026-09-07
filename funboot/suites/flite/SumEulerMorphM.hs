-- SumEulerMorphM.hs - SumEuler in the exp3_8m idiom.
--
-- Two materialise-then-discard pipelines, the Mss pattern:
--   euler n = length (filter (relprime n) [1 .. n-1])   -- builds [1..n-1],
--                                                       -- then a filtered copy,
--                                                       -- then counts it
--   main    = sum (totients 1 30)                       -- builds a list to sum
-- Each becomes one catamorphism whose algebra carries the count / the sum, so
-- neither list is ever built.

module SumEulerMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

hcf :: Int -> Int -> Int
hcf x 0 = x
hcf x y = hcf y (x `mod` y)

relprime :: Int -> Int -> Bool
relprime x y = hcf x y == 1

-- count the relprimes in [lo .. hi] without building either list
countRel :: Int -> Int -> Int -> Int -> Int
countRel n = fix (\ rec acc ->
                    \ i -> \ hi ->
                             if i > hi
                               then acc
                               else rec (if relprime n i then acc + 1 else acc)
                                        (i + 1) hi)

euler :: Int -> Int
euler n = countRel n 0 1 (n - 1)

-- sum euler over [lo .. hi] without building the list
sumTot :: Int -> Int -> Int -> Int
sumTot = fix (\ rec acc ->
                \ lo -> \ hi ->
                          if lo > hi
                            then acc
                            else rec (acc + euler lo) (lo + 1) hi)

main :: Int
main = sumTot 0 1 30
