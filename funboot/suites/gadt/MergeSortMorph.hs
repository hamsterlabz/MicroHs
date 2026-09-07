-- MergeSortMorph.hs — merge sort as a hylomorphism over a
-- per-structure binary split-tree functor, with hand-written
-- hylo function (`msHylo`).  The split-tree never materialises:
-- the coalg unfolds and the alg merges in one pass.
--
--     F r = MEmpty | MLeaf W | MNode r r
--     coalg :: [W] -> F [W]      -- balanced split
--     alg   :: F [W] -> [W]      -- merge

module MergeSortMorph (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data MSF r = MEmpty | MLeaf W | MNode r r

data MSAlg r = MSAlg
  { msEmpty :: r
  , msLeaf  :: W -> r
  , msNode  :: r -> r -> r
  }

data MSCoalg s = MSCoalg
  { msStep :: s -> MSF s
  }

msHylo :: MSAlg r -> MSCoalg s -> s -> r
msHylo alg co s = case msStep co s of
  MEmpty       -> msEmpty alg
  MLeaf x      -> msLeaf alg x
  MNode ls rs  -> msNode alg (msHylo alg co ls) (msHylo alg co rs)

merge :: [W] -> [W] -> [W]
merge []     ys     = ys
merge xs@(_:_) [] = xs
merge (x:xs) (y:ys)
  | x <= y    = x : merge xs (y:ys)
  | otherwise = y : merge (x:xs) ys

splitCoalg :: MSCoalg [W]
splitCoalg = MSCoalg step
  where
    step []  = MEmpty
    step [x] = MLeaf x
    step xs  = let (l, r) = splitAt (length xs `div` 2) xs
               in  MNode l r

mergeAlg :: MSAlg [W]
mergeAlg = MSAlg [] (\x -> [x]) merge

msort :: [W] -> [W]
msort = msHylo mergeAlg splitCoalg

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
          sorted = msort xs
          h1     = head sorted
          h2     = last sorted
          s1     = sum sorted
          s2     = foldl (\a x -> a * 31 + x) 0 sorted
      in  acc `hashMix` h1 `hashMix` h2 `hashMix` s1 `hashMix` s2

main :: Int
main = bench 4
