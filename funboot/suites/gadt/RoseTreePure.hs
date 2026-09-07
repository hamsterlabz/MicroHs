-- RoseTreePure.hs — Haskell translation of rosetree_pure.c.
--
-- A rose tree node has a value + an arbitrary-arity list of
-- children.  Path-copying mutation; subtrees are shared.

module RoseTreePure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Rose = Rose W [Rose]

roseInsertChild :: Rose -> W -> Rose
roseInsertChild (Rose v ks) v' = Rose v (Rose v' [] : ks)

roseDeleteFirstChild :: Rose -> Rose
roseDeleteFirstChild (Rose v [])     = Rose v []
roseDeleteFirstChild (Rose v (_:ks)) = Rose v ks

roseFoldl :: (W -> W -> W) -> W -> Rose -> W
roseFoldl f z (Rose v ks) = foldl (roseFoldl f) (f z v) ks

roseFoldr :: (W -> W -> W) -> W -> Rose -> W
roseFoldr f z (Rose v ks) = f v (foldr (flip (roseFoldr f)) z ks)

roseMap :: (W -> W) -> Rose -> Rose
roseMap f (Rose v ks) = Rose (f v) (map (roseMap f) ks)

roseZipSumWith :: (W -> W -> W) -> Rose -> Rose -> W
roseZipSumWith f (Rose va ka) (Rose vb kb) =
  f va vb + sum (zipWith (roseZipSumWith f) ka kb)

insertCount :: Int
insertCount = 16

-- Build a fixed-length value stream from an LCG.
vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta0    = Rose (lcgNext sa) []
          tb0    = Rose (lcgNext sb) []
          ta1    = foldl roseInsertChild ta0 (vals insertCount sa)
          tb     = foldl roseInsertChild tb0 (vals insertCount sb)
          -- Drop first two children twice (a small "delete" workload).
          ta     = roseDeleteFirstChild (roseDeleteFirstChild ta1)
          tm     = roseMap mul3plus1 ta
          sl     = roseFoldl addW 0 tm
          sr     = roseFoldr xorW 0 tm
          za     = roseZipSumWith addW tm tb
          zx     = roseZipSumWith xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
