-- HeapSortMorphXFix.hs — heap sort via Morphx Fix-based.
-- Input list ana'd into Fix ListF, build/drain phases use the
-- textbook Fix-based morphisms, output cata'd back to [W].


module HeapSortMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data Heap = HE | HN W Heap Heap

mergeH :: Heap -> Heap -> Heap
mergeH HE h = h
mergeH h@(HN _ _ _) HE = h
mergeH ha@(HN a la ra) hb@(HN b lb rb)
  | a <= b    = HN a (mergeH ra hb) la
  | otherwise = HN b (mergeH ha rb) lb

insertH :: W -> Heap -> Heap
insertH x = mergeH (HN x HE HE)

data ListF r = NilF | ConsF W r

fromList :: [W] -> Fix ListF
fromList = ana fmap coalg
  where
    coalg :: [W] -> ListF [W]
    coalg []     = NilF
    coalg (x:xs) = ConsF x xs

toList :: Fix ListF -> [W]
toList = cata fmap alg
  where
    alg :: ListF [W] -> [W]
    alg NilF        = []
    alg (ConsF v r) = v : r

build :: Fix ListF -> Heap
build = cata fmap alg
  where
    alg :: ListF Heap -> Heap
    alg NilF        = HE
    alg (ConsF x h) = insertH x h

drain :: Heap -> Fix ListF
drain = ana fmap coalg
  where
    coalg :: Heap -> ListF Heap
    coalg HE         = NilF
    coalg (HN x l r) = ConsF x (mergeH l r)

hsort :: [W] -> [W]
hsort = toList . drain . build . fromList

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
          sorted = hsort xs
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

