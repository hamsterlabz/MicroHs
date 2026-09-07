-- MSortNaive.hs - mergesort from fun-bmarks src/sorting/sorting.fn:
--   split xs n = Pair (take n xs) (drop n xs)
--   mergesort xs = ... (split xs (/ (length xs) 2)) ...
-- length, take and drop each walk the list: THREE traversals per level.

module MSortNaive where

import Prelude()
import NanoPrelude

take :: Int -> [Int] -> [Int]
take _ []       = []
take n (x : xs) = if n == 0 then [] else x : take (n - 1) xs

drop :: Int -> [Int] -> [Int]
drop _ []           = []
drop n xt@(_ : xs)  = if n == 0 then xt else drop (n - 1) xs

merge :: [Int] -> [Int] -> [Int]
merge [] ys = ys
merge (x : xs) [] = x : xs
merge (x : xs) (y : ys) = if x <= y
                            then x : merge xs (y : ys)
                            else y : merge (x : xs) ys

msort :: [Int] -> [Int]
msort []  = []
msort [x] = [x]
msort xs  = let n = length xs `div` 2
            in  merge (msort (take n xs)) (msort (drop n xs))

l2 :: [Int]
l2 = [87,61,88,51,6,98,31,44,33,7,8,100,5,3,71,19,22,55,66,34,25,24,90,52,21,54,26,45,20,75,77,35,63,16,4,65,74,60,13,81,1,36,99,97,62,42,83,39,79,30,89,29,76,84,53,95,9,10,57,23,69,94,2,67,27,91,50,38,86,56,58,46,47,28,96,14,18,64,41,92,85,72,17,15,37,70,93,12,80,43,11,48,59,68,40,49,82,32,78,73]

main :: Int
main = sum (msort l2)
