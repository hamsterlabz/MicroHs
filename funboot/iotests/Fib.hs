module Fib where

import Prelude()
import NanoPrelude

fib :: Int -> Int
fib n =
  if n <= 1
     then 1
     else fib (n - 1) + fib (n - 2)

-- Small main
main = fib 4

-- Large main
-- main = fib 20
