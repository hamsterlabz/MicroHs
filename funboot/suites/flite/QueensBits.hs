-- QueensBits.hs - Queens as a hylomorphism: a fold nested inside an unfold.
--
--   solve  unfolds the next search level from the constraint state (coalgebra)
--   scan   folds over the set of candidate columns, summing the counts (algebra)
--
-- The search tree is never materialised.  Queens.hs instead re-derives safety
-- per candidate, walking the whole partial board:
--   safe x d (q:l) = x /= q && x /= q+d && x /= q-d && safe x (d+1) l
--
-- The representation of the state decides everything.  Carrying it as three
-- LISTS was measured WORSE than re-deriving it (60,261 vs 48,190): three
-- membership walks plus two map-shifts beat one fused walk.  The state wants
-- O(1) test and O(1) shift -- bitmasks, on the ALU opcodes the fun ISA already
-- has.  GExtra already binds them under the conventional Data.Bits names.

module QueensBits where

import Prelude()
import NanoPrelude
import GExtra ((.&.), (.|.), xor, shiftL, shiftR)

nsoln :: Int -> Int
nsoln nq = solve 0 0 0
  where
    full :: Int
    full = shiftL 1 nq - 1

    -- coalgebra: unfold one row of the search from the state
    solve :: Int -> Int -> Int -> Int
    solve cols d1 d2 =
      if cols == full
        then 1::Int
        else scan (full .&. (full `xor` (cols .|. d1 .|. d2)))
      where
        -- algebra: fold the candidate columns of this row into a count
        scan avail =
          if avail == 0
            then 0::Int
            else let b = avail .&. (0 - avail)          -- lowest free column
                 in  solve (cols .|. b)
                           (full .&. shiftL (d1 .|. b) 1)
                           (shiftR (d2 .|. b) 1)
                     + scan (avail `xor` b)

main :: Int
main = nsoln 6
