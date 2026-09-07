module V6 where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
-- single clause, literal in the ARGUMENT pattern
p2 :: [Int] -> [F] -> [F]
p2 (41:t) s = x : s2  where (x : B 40 : s2) = s
main :: Int
main = lenS (p2 (41 : []) (A 97 : B 40 : A 5 : []))
