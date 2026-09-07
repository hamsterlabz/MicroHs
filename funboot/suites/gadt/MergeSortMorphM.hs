-- MergeSortMorphM.hs — merge sort as a Mendler-style hylo on
-- [W].  The split-tree functor is implicit: the algorithm
-- pattern-matches the seed, recurses on each half, merges.

module MergeSortMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

merge :: [W] -> [W] -> [W]
merge []     ys     = ys
merge xs@(_:_) [] = xs
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

msort :: [W] -> [W]
msort = mhylo $ \rec xs -> case xs of
  []   -> []
  [x]  -> [x]
  _    -> let (l, r) = splitAt (length xs `div` 2) xs
          in  merge (rec l) (rec r)

drawLcg :: Int -> W -> [W]
drawLcg 0 _ = []
drawLcg n s = let s' = lcgNext s in s' : drawLcg (n - 1) s'

listLen :: Int
listLen = 64

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          xs     = drawLcg listLen sa
          sorted = msort xs
          h1     = head sorted
          h2     = last sorted
          s1     = sum sorted
          s2     = foldl (\a x -> a * 31 + x) 0 sorted
      in  acc `hashMix` h1 `hashMix` h2 `hashMix` s1 `hashMix` s2

main :: Int
main = bench 4
