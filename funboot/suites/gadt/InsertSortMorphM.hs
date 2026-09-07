-- InsertSortMorphM.hs — insertion sort via Mendler-style.
-- insert is paramorphic in spirit: it needs to splice the
-- original tail through.  Open-recursion expresses this
-- directly — the `rec` recurses on the tail.

module InsertSortMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

insert :: W -> [W] -> [W]
insert x = mcata go
  where
    go _   []       = [x]
    go rec (y:rest)
      | x <= y    = x : y : rest
      | otherwise = y : rec rest

isort :: [W] -> [W]
isort = mcata $ \rec xs -> case xs of
  []     -> []
  (x:rest) -> insert x (rec rest)

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
