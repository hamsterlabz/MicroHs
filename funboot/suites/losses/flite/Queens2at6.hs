-- Queens2at6.hs - Queens2's algorithm at Queens' board size, so the two
-- formulations of the SAME problem can be compared.  Queens re-derives safety
-- by walking the whole partial board per candidate; Queens2 unfolds a mask that
-- already encodes which columns are attacked, shifting it one row at a time.
module Queens2at6 where

import Prelude()
import NanoPrelude

one p [] = []
one p (x : xs) = if p x then [x] else one p xs

l = 0::Int
r = 1::Int
d = 2::Int

eq x y = x == y

left  xs = map (one (eq l)) (tail xs)
right xs = [] : map (one (eq r)) xs
down  xs = map (one (eq d)) xs

merge [] ys = []
merge (x : xs) [] = x : xs
merge (x : xs) (y : ys) = (x ++ y) : merge xs ys

next mask = merge (merge (down mask) (left mask)) (right mask)

fill [] = []
fill (x : xs) = (lrd x xs) ++ (map ((:) x) (fill xs))

lrd [] ys = [[l,r,d] : ys]
lrd (x : xs) ys = []

solve n mask =
  if n == 0
    then [[]]
    else concatMap (sol (n - 1)) (fill mask)

sol n row = map ((:) row) (solve n (next row))

nqueens n = length (solve n (replicate n []))

-- Small main
main = nqueens 6

-- Large main
-- main = nqueens 11
