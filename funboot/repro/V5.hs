module V5 where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
-- both vars, OPEN tail, literal inside a constructor
p2 :: [F] -> [F]
p2 s = x : s2  where (x : B 40 : s2) = s
main :: Int
main = lenS (p2 (A 97 : B 40 : A 5 : []))
