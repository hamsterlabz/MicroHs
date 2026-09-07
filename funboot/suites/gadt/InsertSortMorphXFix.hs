-- InsertSortMorphXFix.hs — insertion sort via Morphx Fix-based.
-- The input [W] is anamorphism'd into Fix ListF, sorted, then
-- catamorphism'd back to [W].


module InsertSortMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data ListF r = NilF | ConsF W r

type FixList = Fix ListF

fromList :: [W] -> FixList
fromList = ana fmap coalg
  where
    coalg :: [W] -> ListF [W]
    coalg []     = NilF
    coalg (x:xs) = ConsF x xs

toList :: FixList -> [W]
toList = cata fmap alg
  where
    alg :: ListF [W] -> [W]
    alg NilF        = []
    alg (ConsF v r) = v : r

insert :: W -> FixList -> FixList
insert x = para fmap alg
  where
    alg :: ListF (FixList, FixList) -> FixList
    alg NilF                  = Fix (ConsF x (Fix NilF))
    alg (ConsF y (ys, r))     =
      if x <= y then Fix (ConsF x (Fix (ConsF y ys)))
                else Fix (ConsF y r)

isort :: FixList -> FixList
isort = cata fmap alg
  where
    alg :: ListF FixList -> FixList
    alg NilF        = Fix NilF
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
          sorted = toList (isort (fromList xs))
          h1     = head sorted
          h2     = last sorted
          s1     = sum sorted
          s2     = foldl (\a x -> a * 31 + x) 0 sorted
      in  acc `hashMix` h1 `hashMix` h2 `hashMix` s1 `hashMix` s2

main :: Int
main = bench 4

instance Functor ListF where
  fmap _ NilF = NilF
  fmap f (ConsF a b) = ConsF a (f b)

