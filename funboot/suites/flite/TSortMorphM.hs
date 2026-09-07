-- TSortMorphM.hs - treeSort from fun-bmarks src/sorting/sorting.fn, which is
-- the morphism form of a sort:
--   treeSort = compose readTree mkTree
--   mkTree   = foldr to_tree Tip          -- catamorphism over the list
--   readTree tr = ... concat (readTree l) (Cons x (readTree r))  -- over the tree
-- Insertion sort's O(n^2) list re-walk becomes a fold into a search tree and a
-- fold back out.

module TSortMorphM where

import Prelude()
import NanoPrelude

data Tree = Branch Int Tree Tree | Tip

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

toTree :: Int -> Tree -> Tree
toTree x = fix (\ rec tr ->
                  case tr of
                    Tip            -> Branch x Tip Tip
                    Branch y l r   -> if x <= y
                                        then Branch y (rec l) r
                                        else Branch y l (rec r))

mkTree :: [Int] -> Tree
mkTree = fix (\ rec xs ->
                case xs of
                  []       -> Tip
                  (y : ys) -> toTree y (rec ys))

readTree :: Tree -> [Int]
readTree = fix (\ rec tr ->
                  case tr of
                    Tip          -> []
                    Branch x l r -> rec l ++ (x : rec r))

l2 :: [Int]
l2 = [87,61,88,51,6,98,31,44,33,7,8,100,5,3,71,19,22,55,66,34,25,24,90,52,21,54,26,45,20,75,77,35,63,16,4,65,74,60,13,81,1,36,99,97,62,42,83,39,79,30,89,29,76,84,53,95,9,10,57,23,69,94,2,67,27,91,50,38,86,56,58,46,47,28,96,14,18,64,41,92,85,72,17,15,37,70,93,12,80,43,11,48,59,68,40,49,82,32,78,73]

main :: Int
main = sum (readTree (mkTree l2))
