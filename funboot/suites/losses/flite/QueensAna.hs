-- QueensAna.hs - Queens as an ANAMORPHISM carrying its constraint state,
-- consumed by a count (so: a hylomorphism).  Explicit style.
--
-- Queens.hs re-derives safety from scratch at every candidate:
--   safe x d (q:l) = x /= q && x /= q+d && x /= q-d && safe x (d+1) l
-- which walks the ENTIRE partial board, three comparisons per placed queen,
-- for every candidate at every node.  The board is a fold of the past; the
-- coalgebra can carry that knowledge forward instead.  Descending one row
-- shifts the two diagonal sets by one, so a candidate is tested against three
-- membership checks and nothing is re-derived.

module QueensAna where

import Prelude()
import NanoPrelude

-- the blocked-set test: the list answers for itself, no notElem helper
free :: Int -> [Int] -> Bool
free x []       = True
free x (y : ys) = x /= y && free x ys

nsoln :: Int -> Int
nsoln nq = go nq [] [] []
  where
    qs = enumFromTo 1 nq

    go :: Int -> [Int] -> [Int] -> [Int] -> Int
    go 0 _ _ _ = 1::Int
    go n cols d1 d2 =
      foldr (\ q acc ->
               if free q cols && free q d1 && free q d2
                 then go (n - 1) (q : cols)
                         (map (\ x -> x + 1) (q : d1))
                         (map (\ x -> x - 1) (q : d2))
                      + acc
                 else acc)
            0 qs

main :: Int
main = nsoln 6
