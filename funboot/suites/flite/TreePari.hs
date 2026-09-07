module TreePari where

import Prelude()
import NanoPrelude
{-# LAZY pariWhere #-}


data Parity = Odd | Even

data Tree = Leaf | Node Tree Tree

xor :: Parity -> Parity -> Parity
xor a b = case (a, b) of
  (Odd, Odd) -> Even
  (Even, Odd) -> Odd
  (Odd, Even) -> Odd
  (Even, Even) -> Even

pariWhere :: (Tree -> Bool) -> Tree -> Parity
pariWhere p Leaf = if p Leaf then Odd else Even
pariWhere p n@(Node l r) = 
  let k = xor (pariWhere p l) (pariWhere p r)
      h = if p n then Odd else Even
  in xor k h
  
mkTree :: Int -> Tree
mkTree n = if n == 0 then Leaf
                     else let m = n - 1 
                          in Node (mkTree m) (mkTree m)

withTwoLeaf :: Tree -> Bool
withTwoLeaf (Node Leaf Leaf) = True
withTwoLeaf _ = False

peek :: Parity -> Int
peek Even = 42
peek _ = 0

main :: Int
main = peek (pariWhere withTwoLeaf (mkTree 10))
