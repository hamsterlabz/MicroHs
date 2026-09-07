-- The same fold written both ways: explicit (functor, algebra) and Mendler.
module CataFTest where

import Prelude()
import NanoPrelude

-- explicit style: a functor that maps the recursion over one layer, and an
-- algebra that consumes that layer
fmapL :: ([Int] -> Int) -> [Int] -> [Int]
fmapL rec xs = case xs of
                 []       -> []
                 (a : as) -> a : [rec as]

algL :: [Int] -> Int
algL ys = case ys of
            []       -> 0
            (a : bs) -> case bs of
                          []      -> a
                          (r : _) -> a + r

main :: Int
main = cataF fmapL algL (enumFromTo 1 200)
