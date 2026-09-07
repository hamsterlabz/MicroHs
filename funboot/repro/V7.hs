module V7 where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
-- two clauses, NO literal in the argument pattern
p2 :: [Int] -> [F] -> [F]
p2 (c:t) s = x : s2  where (x : B 40 : s2) = s
p2 []    s = s
main :: Int
main = lenS (p2 (41 : []) (A 97 : B 40 : A 5 : []))
