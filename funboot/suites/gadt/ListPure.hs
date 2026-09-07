-- ListPure.hs — Haskell translation of list_pure.c.
--
-- We use Haskell's built-in cons-list (which IS the path-copying
-- functional list — `(:)` allocates a fresh cell, the tail is
-- shared).  All operations are pure by construction.

module ListPure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

-- Insertion = (v :).  Deletion (drop-head) = `tail`.
-- foldl / foldr / map / zipWith come straight from the Prelude.

listZipSumWith :: (W -> W -> W) -> [W] -> [W] -> W
listZipSumWith f as bs = sum (zipWith f as bs)

-- Draw `n` LCG samples threading the seed; returns the list and
-- the final state.
draws :: Int -> W -> ([W], W)
draws n s0 = go n s0 []
  where
    go 0 s acc = (acc, s)
    go k s acc = let s' = lcgNext s in go (k - 1) s' (s' : acc)

listLen :: Int
listLen = 64

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let seed     = 0xA1F32C97 + fromIntegral i
          seed'    = 0x5EE9D4B2 + fromIntegral i
          (as0, _) = draws listLen seed
          (bs0, _) = draws listLen seed'
          -- "deletion": drop head four times
          as       = drop 4 as0
          bs       = bs0
          asM      = map mul3plus1 as
          sumL     = foldl addW 0 asM
          sumR     = foldr xorW 0 asM
          zAdd     = listZipSumWith addW asM bs
          zXor     = listZipSumWith xorW asM bs
      in  acc `hashMix` sumL `hashMix` sumR `hashMix` zAdd `hashMix` zXor

main :: Int
main = bench 4
