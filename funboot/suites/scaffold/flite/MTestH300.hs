module MTestH300 where

import Prelude()
import NanoPrelude

mklist :: Int -> [Int]
mklist n = if n == 0 then [] else n : mklist (n - 1)

len :: [Int] -> Int
len [] = 0
len (_ : xs) = 1 + len xs

main = len (mklist 300)
