module TreeSum where

import Prelude()
import NanoPrelude

data Tree = Leaf | Node Tree Tree

mkTree :: Int -> Tree
mkTree n = if n == 0 then Leaf
                     else let m = n - 1 
                          in Node (mkTree m) (mkTree m)
                    
treeSum :: Tree -> Int
treeSum Leaf = 1
treeSum (Node l r) = treeSum l + treeSum r + 1

main :: Int
main = treeSum (mkTree 13)
