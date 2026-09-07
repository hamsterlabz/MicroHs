-- InsertSortMorphX.hs — insertion sort via Morphx merged-fmap.
-- The recursive ADT is Haskell's [W] (a direct ADT); the pattern
-- functor ListF is separate, no Functor instance.

module InsertSortMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data ListF r = NilF | ConsF W r

fmapList :: ([W] -> a) -> [W] -> ListF a
fmapList _ []     = NilF
fmapList f (x:xs) = ConsF x (f xs)

fmapListP :: ([W] -> ([W], a)) -> [W] -> ListF ([W], a)
fmapListP _ []     = NilF
fmapListP f (x:xs) = ConsF x (f xs)

insert :: W -> [W] -> [W]
insert x = para' fmapListP alg
  where
    alg :: ListF ([W], [W]) -> [W]
    alg NilF                  = [x]
    alg (ConsF y (ys, r))     = if x <= y then x : y : ys else y : r

isort :: [W] -> [W]
isort = cata' fmapList alg
  where
    alg :: ListF [W] -> [W]
    alg NilF        = []
    alg (ConsF v r) = insert v r

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
          sorted = isort xs
          h1     = head sorted
          h2     = last sorted
          s1     = sum sorted
          s2     = foldl (\a x -> a * 31 + x) 0 sorted
      in  acc `hashMix` h1 `hashMix` h2 `hashMix` s1 `hashMix` s2

main :: Int
main = bench 4
