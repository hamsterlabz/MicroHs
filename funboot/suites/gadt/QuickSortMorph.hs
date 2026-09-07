-- QuickSortMorph.hs — quicksort as a hylomorphism over a
-- per-structure partition-tree functor.
--
--     F r = QEmpty | QPivot W r r
--     coalg :: [W] -> F [W]     -- pick pivot, partition
--     alg   :: F [W] -> [W]     -- concat l ++ [p] ++ r

module QuickSortMorph (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data QSF r = QEmpty | QPivot W r r

data QSAlg r = QSAlg
  { qsEmpty :: r
  , qsPivot :: W -> r -> r -> r
  }

data QSCoalg s = QSCoalg
  { qsStep :: s -> QSF s
  }

qsHylo :: QSAlg r -> QSCoalg s -> s -> r
qsHylo alg co s = case qsStep co s of
  QEmpty       -> qsEmpty alg
  QPivot p l r -> qsPivot alg p (qsHylo alg co l) (qsHylo alg co r)

partitionCoalg :: QSCoalg [W]
partitionCoalg = QSCoalg step
  where
    step []     = QEmpty
    step (p:xs) = QPivot p [x | x <- xs, x < p] [x | x <- xs, x >= p]

concatAlg :: QSAlg [W]
concatAlg = QSAlg [] (\p l r -> l ++ [p] ++ r)

qsort :: [W] -> [W]
qsort = qsHylo concatAlg partitionCoalg

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
