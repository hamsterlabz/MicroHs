module W2 where
import Prelude()
import NanoPrelude
f :: [Int] -> Int
f (41:t) = 7
f c      = 9
main :: Int
main = f (41 : [])
