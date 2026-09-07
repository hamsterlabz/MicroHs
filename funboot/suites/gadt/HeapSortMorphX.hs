-- HeapSortMorphX.hs — heap sort via Morphx merged-fmap variant.
-- Build = generic `cata' fmapList` over [W]; drain = generic
-- `ana' fmapListE` over Heap.

module HeapSortMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
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

-- List pattern functor + merged fmaps (cata and ana directions).
data ListF r = NilF | ConsF W r

fmapList :: ([W] -> a) -> [W] -> ListF a
fmapList _ []     = NilF
fmapList f (x:xs) = ConsF x (f xs)

fmapListE :: (a -> [W]) -> ListF a -> [W]
fmapListE _ NilF        = []
fmapListE f (ConsF x s) = x : f s

build :: [W] -> Heap
build = cata' fmapList alg
  where
    alg :: ListF Heap -> Heap
    alg NilF        = HE
    alg (ConsF x h) = insertH x h

drain :: Heap -> [W]
drain = ana' fmapListE coalg
  where
    coalg :: Heap -> ListF Heap
    coalg HE         = NilF
    coalg (HN x l r) = ConsF x (mergeH l r)

hsort :: [W] -> [W]
hsort = drain . build

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
