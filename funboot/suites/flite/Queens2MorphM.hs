-- Queens2MorphM.hs - Queens2 in the exp3_8m idiom.
--
-- `nqueens n = length (solve n (replicate n []))` conses every solution row
-- onto every solution list (`sol n row = map ((:) row) (solve n ...)`) and then
-- throws all of them away to take a length.  The catamorphism carries the
-- count, so no solution list is ever built -- the Mss pattern again.

module Queens2MorphM where

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

-- count the solutions instead of building them
countSolve n mask =
  if n == 0
    then 1::Int
    else sumMap (n - 1) (fill mask)

sumMap n rows =
  case rows of
    []            -> 0::Int
    (row : rest)  -> countSolve n (next row) + sumMap n rest

nqueens n = countSolve n (replicate n [])

main = nqueens 5
