-- TreeSumMorphM.hs - TreeSum in the exp3_8m idiom.
--
-- TreeSum.hs writes the recursive call twice: `Node (mkTree m) (mkTree m)`.
-- Two occurrences are two graph nodes, so the whole subtree is built twice at
-- every level and mkTree costs 2^n.  Naming it once makes it one node.

module TreeSumMorphM where

import Prelude()
import NanoPrelude

data Tree = Leaf | Node Tree Tree

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

mkTree :: Int -> Tree
mkTree = fix (\ rec n ->
                if n == 0
                  then Leaf
                  else let t = rec (n - 1)
                       in  Node t t)

treeSum :: Tree -> Int
treeSum = fix (\ rec t ->
                 case t of
                   Leaf     -> 1
                   Node l r -> rec l + rec r + 1)

main :: Int
main = treeSum (mkTree 13)
