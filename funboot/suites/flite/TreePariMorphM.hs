-- TreePariMorphM.hs - TreePari in the exp3_8m idiom.
-- Same duplication as TreeSum: `Node (mkTree m) (mkTree m)` builds the subtree
-- twice at every level.  pariWhere already names its two recursive calls on
-- DIFFERENT children, so there is nothing to share there.

module TreePariMorphM where

import Prelude()
import NanoPrelude

data Parity = Odd | Even
data Tree = Leaf | Node Tree Tree

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

xor :: Parity -> Parity -> Parity
xor a b = case (a, b) of
  (Odd, Odd) -> Even
  (Even, Odd) -> Odd
  (Odd, Even) -> Odd
  (Even, Even) -> Even

pariWhere :: (Tree -> Bool) -> Tree -> Parity
pariWhere p = fix (\ rec t ->
                     case t of
                       Leaf     -> if p Leaf then Odd else Even
                       Node l r -> let k = xor (rec l) (rec r)
                                       h = if p (Node l r) then Odd else Even
                                   in  xor k h)

mkTree :: Int -> Tree
mkTree = fix (\ rec n ->
                if n == 0
                  then Leaf
                  else let t = rec (n - 1)
                       in  Node t t)

withTwoLeaf :: Tree -> Bool
withTwoLeaf (Node Leaf Leaf) = True
withTwoLeaf _ = False

peek :: Parity -> Int
peek Even = 42
peek _ = 0

main :: Int
main = peek (pariWhere withTwoLeaf (mkTree 10))
