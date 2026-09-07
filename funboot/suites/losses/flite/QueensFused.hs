-- QueensFused.hs - Queens fully restructured.
--
-- Queens.hs is  length (gen nq nq)  where gen builds, level by level, the list
-- of ALL partial boards and then the whole list is thrown away to take a
-- length.  Walking the search depth-first and carrying the count means no
-- board list is ever materialised -- only the current board exists.

module QueensFused where

import Prelude()
import NanoPrelude

safe x d [] = True
safe x d (q : l) =
  (x /= q) && (x /= q + d) && (x /= q - d) && safe x (d + 1) l

nsoln :: Int -> Int
nsoln nq = go nq []
  where
    qs = enumFromTo 1 nq          -- built once
    go 0 _ = 1::Int
    go n b = foldr (\ q acc -> if safe q 1 b then go (n - 1) (q : b) + acc else acc) 0 qs

main = nsoln 6
