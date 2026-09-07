module RepL where
import Prelude()
import NanoPrelude

-- an irrefutable pattern with a LITERAL element and two variables
pick :: [Int] -> Int
pick s = x + len s'  where (x : 40 : s') = s

len :: [Int] -> Int
len []     = 0
len (_:xs) = 1 + len xs

main :: Int
main = pick (7 : 40 : 5 : [])
