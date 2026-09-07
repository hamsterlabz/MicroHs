module RepH where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
st :: [F] -> [F]
st s = s
-- recursion, but no literal in the pattern
p2 :: [Int] -> [F] -> [F]
p2 []     s = s
p2 (41:t) s = p2 t (x:s')  where (x : y : s') = st s
p2 (c:t)  s = p2 t (A c : s)
main :: Int
main = lenS (p2 (41 : []) (A 97 : B 40 : []))
