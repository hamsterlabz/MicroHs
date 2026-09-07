module List where

import Prelude()
import NanoPrelude

head :: [Int] -> Int
head [] = 0
head (a : ls) = a

tail :: [Int] -> [Int]
tail [] = []
tail (a : ls) = ls

main :: Int
--main = head (tail [1,2,3])
main = head [1,2,3]
