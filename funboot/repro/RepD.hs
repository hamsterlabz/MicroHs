module RepD where
import Prelude()
import NanoPrelude

data F = A Int | B Int

-- two variables AND a literal-bearing nested pattern, as ClausifyN has
pick :: [F] -> Int
pick t = n + m where (A n : B 4 : A m : []) = t

main :: Int
main = pick (A 3 : B 4 : A 5 : [])
