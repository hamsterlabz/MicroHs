module RepI where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
st :: [F] -> [F]
st s = s
-- recursion and literal, but only ONE variable taken from the binding
p2 :: [Int] -> [F] -> [F]
p2 []     s = s
p2 (41:t) s = p2 t s'  where (x : B 40 : s') = st s
p2 (c:t)  s = p2 t (A c : s)
main :: Int
main = lenS (p2 (41 : []) (A 97 : B 40 : []))
