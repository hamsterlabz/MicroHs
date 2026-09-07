-- QSortMorphM.hs - quickSort2 from the same file, which is the morphism form:
--   partition p = foldr (select p) (Pair Nil Nil)
-- ONE catamorphism over xs producing the pair, instead of two filter passes.

module QSortMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

-- one pass, algebra carries the pair
partition :: (Int -> Bool) -> [Int] -> ([Int], [Int])
partition p = fix (\ rec xs ->
                     case xs of
                       []       -> ([], [])
                       (y : ys) -> case rec ys of
                                     (ts, fs) -> if p y
                                                   then (y : ts, fs)
                                                   else (ts, y : fs))

qsort :: [Int] -> [Int]
qsort = fix (\ rec xs ->
               case xs of
                 []       -> []
                 (y : ys) -> case partition (\ a -> a <= y) ys of
                               (lo, hi) -> rec lo ++ (y : rec hi))

l2 :: [Int]
l2 = [87,61,88,51,6,98,31,44,33,7,8,100,5,3,71,19,22,55,66,34,25,24,90,52,21,54,26,45,20,75,77,35,63,16,4,65,74,60,13,81,1,36,99,97,62,42,83,39,79,30,89,29,76,84,53,95,9,10,57,23,69,94,2,67,27,91,50,38,86,56,58,46,47,28,96,14,18,64,41,92,85,72,17,15,37,70,93,12,80,43,11,48,59,68,40,49,82,32,78,73]

main :: Int
main = sum (qsort l2)
