-- QuickSortMorphXFix.hs — quicksort via Morphx Fix-based
-- hylomorphism (textbook Milewski form, Functor typeclass).


module QuickSortMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data QSF r = QEmpty | QPivot W r r

partitionCoalg :: [W] -> QSF [W]
partitionCoalg []     = QEmpty
partitionCoalg (p:xs) = QPivot p [x | x <- xs, x < p] [x | x <- xs, x >= p]

concatAlg :: QSF [W] -> [W]
concatAlg QEmpty         = []
concatAlg (QPivot p l r) = l ++ [p] ++ r

qsort :: [W] -> [W]
qsort = hylo fmap concatAlg partitionCoalg

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
          sorted = qsort xs
          h1     = head sorted
          h2     = last sorted
          s1     = sum sorted
          s2     = foldl (\a x -> a * 31 + x) 0 sorted
      in  acc `hashMix` h1 `hashMix` h2 `hashMix` s1 `hashMix` s2

main :: Int
main = bench 4

instance Functor QSF where
  fmap _ QEmpty = QEmpty
  fmap f (QPivot a b c) = QPivot a (f b) (f c)

