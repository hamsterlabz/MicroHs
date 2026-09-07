module RepC where
import Prelude()
import NanoPrelude

data F = A Int | B Int

-- TWO variables bound by one irrefutable pattern: mhs shares the scrutinee
pick :: [F] -> Int
pick t = n + m where (A n : B m : []) = t

main :: Int
main = pick (A 3 : B 4 : [])
