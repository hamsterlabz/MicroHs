module V3 where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
-- only the HEAD var, bare tail
p2 :: [F] -> [F]
p2 s = x : []  where (x : B 40 : s2) = s
main :: Int
main = lenS (p2 (A 97 : B 40 : A 5 : []))
