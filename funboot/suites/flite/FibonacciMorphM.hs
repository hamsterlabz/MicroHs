-- FibonacciMorphM.hs - same as FibMorphM; Fibonacci.hs writes the two calls in
-- the other order (fib (n-2) + fib (n-1)), which changes nothing.

module FibonacciMorphM where

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
main = fib 11
