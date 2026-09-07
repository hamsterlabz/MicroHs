-- InsertSortMorph.hs — insertion sort via per-list cata + para
-- records.  `insert` is a paramorphism (it needs the original
-- tail to skip past it); `isort` is then a catamorphism.

module InsertSortMorph (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data ListAlg r = ListAlg { laNil :: r, laCons :: W -> r -> r }
data ListPara r = ListPara { lpNil :: r, lpCons :: W -> [W] -> r -> r }

cataList :: ListAlg r -> [W] -> r
cataList alg []     = laNil alg
cataList alg (x:xs) = laCons alg x (cataList alg xs)

paraList :: ListPara r -> [W] -> r
paraList alg []     = lpNil alg
paraList alg (x:xs) = lpCons alg x xs (paraList alg xs)

insert :: W -> [W] -> [W]
insert x = paraList (ListPara [x] step)
  where
    step y ys r = if x <= y then x : y : ys else y : r

isort :: [W] -> [W]
isort = cataList (ListAlg [] (\v r -> insert v r))

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
