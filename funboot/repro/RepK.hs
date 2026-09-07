module RepK where
import Prelude()
import NanoPrelude
data F = A Int | B Int
lenS :: [F] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs
st :: [F] -> [F]
st s = s
-- nested CONSTRUCTOR but no literal
p2 :: [Int] -> [F] -> [F]
p2 (41:t) s = x : s'  where (x : B y : s') = st s
p2 (c:t)  s = s
main :: Int
main = lenS (p2 (41 : []) (A 97 : B 40 : []))
