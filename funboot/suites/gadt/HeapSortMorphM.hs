-- HeapSortMorphM.hs — heap sort via Mendler-style.
-- Build phase: mcata on [W] inserting into a skew heap.
-- Drain phase: mcata on Heap emitting the min and recursing
-- on the merged children.

module HeapSortMorphM (bench) where
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

build :: [W] -> Heap
build = mcata $ \rec xs -> case xs of
  []     -> HE
  (x:rest) -> insertH x (rec rest)

drainList :: Heap -> [W]
drainList = mcata $ \rec h -> case h of
  HE        -> []
  HN x l r  -> x : rec (mergeH l r)

hsort :: [W] -> [W]
hsort = drainList . build

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
