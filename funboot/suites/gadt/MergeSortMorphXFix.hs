-- MergeSortMorphXFix.hs — merge sort via Morphx Fix-based
-- hylomorphism.  Uses the standard Functor instance + the
-- textbook Milewski form:
--
--     hylo alg coalg = alg . fmap (hylo alg coalg) . coalg


module MergeSortMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data MSF r = MEmpty | MLeaf W | MNode r r

merge :: [W] -> [W] -> [W]
merge []     ys     = ys
merge xs@(_:_) [] = xs
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

splitCoalg :: [W] -> MSF [W]
splitCoalg []  = MEmpty
splitCoalg [x] = MLeaf x
splitCoalg xs  = let (l, r) = splitAt (length xs `div` 2) xs
                 in  MNode l r

mergeAlg :: MSF [W] -> [W]
mergeAlg MEmpty      = []
mergeAlg (MLeaf x)   = [x]
mergeAlg (MNode l r) = merge l r

msort :: [W] -> [W]
msort = hylo fmap mergeAlg splitCoalg

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

instance Functor MSF where
  fmap _ MEmpty = MEmpty
  fmap _ (MLeaf a) = MLeaf a
  fmap f (MNode a b) = MNode (f a) (f b)

