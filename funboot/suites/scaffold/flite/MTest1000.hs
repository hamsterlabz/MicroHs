module MTest1000 where

import Prelude()
import NanoPrelude

sumTo :: Int -> Int
sumTo n = if n == 0 then 0 else n + sumTo (n - 1)

main = sumTo 1000
