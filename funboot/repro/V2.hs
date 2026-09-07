module V2 where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
-- both vars, CLOSED tail
p2 :: [F] -> [F]
p2 s = x : y : []  where (x : B 40 : y : []) = s
main :: Int
main = lenS (p2 (A 97 : B 40 : A 5 : []))
