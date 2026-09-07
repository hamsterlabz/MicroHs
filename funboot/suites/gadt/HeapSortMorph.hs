-- HeapSortMorph.hs — heap sort with per-structure cata for the
-- build phase (over [W]) and per-structure anamorphism for the
-- drain phase (over Heap).

module HeapSortMorph (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Heap = HE | HN W Heap Heap

mergeH :: Heap -> Heap -> Heap
mergeH HE h = h
mergeH h@(HN _ _ _) HE = h
mergeH ha@(HN a la ra) hb@(HN b lb rb)
  | a <= b    = HN a (mergeH ra hb) la
  | otherwise = HN b (mergeH ha rb) lb

insertH :: W -> Heap -> Heap
insertH x = mergeH (HN x HE HE)

-- Build phase: cata over [W].
data ListAlg r = ListAlg { laNil :: r, laCons :: W -> r -> r }

cataList :: ListAlg r -> [W] -> r
cataList alg []     = laNil alg
cataList alg (x:xs) = laCons alg x (cataList alg xs)

build :: [W] -> Heap
build = cataList (ListAlg HE insertH)

-- Drain phase: anamorphism over Heap.
data HeapCoStep s = StopH | EmitH W s

data HeapCoalg s = HeapCoalg { hcStep :: s -> HeapCoStep s }

drainList :: HeapCoalg s -> s -> [W]
drainList co s = case hcStep co s of
  StopH        -> []
  EmitH x s'   -> x : drainList co s'

extractCoalg :: HeapCoalg Heap
extractCoalg = HeapCoalg step
  where
    step HE          = StopH
    step (HN x l r)  = EmitH x (mergeH l r)

hsort :: [W] -> [W]
hsort = drainList extractCoalg . build

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
