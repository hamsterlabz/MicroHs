module Fibonacci where

import Prelude()
import NanoPrelude

fib :: Int -> Int
fib n =
  if n <= 1
     then 1
     else fib (n - 2) + fib (n - 1)

fib5 :: Int
fib5 = fib (2 + 1 + (1 + 1))

-- 1 1 2 3 5 8 13 21 34
main :: Int
main = fib 11
