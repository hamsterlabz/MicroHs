-- PerfDemoMorphM.hs - fib in the exp3_8m idiom.
--
-- `fib (n-1) + fib (n-2)` names the recursion TWICE on overlapping arguments,
-- so the call tree is phi^n.  The Mendler algebra carries the pair
-- (fib n, fib (n-1)) and rotates it one step per level: a single linear pass.

module PerfDemoMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

fibPair :: Int -> (Int, Int)
fibPair = fix (\ rec n ->
                 if n <= 1
                   then (1, 1)
                   else case rec (n - 1) of
                          (a, b) -> (a + b, a))

fib :: Int -> Int
fib n = case fibPair n of
          (a, _) -> a

main :: Int
main = fib 15
