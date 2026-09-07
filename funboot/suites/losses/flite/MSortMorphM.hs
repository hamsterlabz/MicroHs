-- MSortMorphM.hs - the reference's morphism form:
--   mergeSort = compose merge_lists (runsplit Nil)
-- runsplit is an unfold that cuts the list into ascending runs in ONE pass;
-- merge_lists is a catamorphism folding those runs with merge.  No length, no
-- take, no drop.

module MSortMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

reverse :: [Int] -> [Int]
reverse = rev []
  where rev acc []       = acc
        rev acc (x : xs) = rev (x : acc) xs

merge :: [Int] -> [Int] -> [Int]
merge = fix (\ rec xs ->
               \ ys -> case xs of
                         []       -> ys
                         (x : xt) -> case ys of
                                       []       -> x : xt
                                       (y : yt) -> if x <= y
                                                     then x : rec xt (y : yt)
                                                     else y : rec (x : xt) yt)

-- one pass: cut into maximal ascending runs
runsplit :: [Int] -> [Int] -> [[Int]]
runsplit = fix (\ rec rl ->
                  \ xl -> case xl of
                            []       -> case rl of
                                          [] -> []
                                          _  -> [reverse rl]
                            (x : xs) -> case rl of
                                          []      -> rec [x] xs
                                          (r : _) -> if r <= x
                                                       then rec (x : rl) xs
                                                       else reverse rl : rec [x] xs)

-- catamorphism over the list of runs
mergeLists :: [[Int]] -> [Int]
mergeLists = fix (\ rec rs ->
                    case rs of
                      []       -> []
                      (x : xt) -> merge x (rec xt))

msort :: [Int] -> [Int]
msort xs = mergeLists (runsplit [] xs)

l2 :: [Int]
l2 = [87,61,88,51,6,98,31,44,33,7,8,100,5,3,71,19,22,55,66,34,25,24,90,52,21,54,26,45,20,75,77,35,63,16,4,65,74,60,13,81,1,36,99,97,62,42,83,39,79,30,89,29,76,84,53,95,9,10,57,23,69,94,2,67,27,91,50,38,86,56,58,46,47,28,96,14,18,64,41,92,85,72,17,15,37,70,93,12,80,43,11,48,59,68,40,49,82,32,78,73]

main :: Int
main = sum (msort l2)
