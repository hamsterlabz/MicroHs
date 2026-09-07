-- QueueMorphM.hs — Banker's queue via Mendler-style.
-- Recursion lives on qToList q :: [W]; the queue itself is a
-- 4-tuple so navigation isn't recursive.

module QueueMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Q = Q [W] Int [W] Int

qEmpty :: Q
qEmpty = Q [] 0 [] 0

qBalance :: Q -> Q
qBalance q@(Q f fl r rl)
  | fl >= rl  = q
  | otherwise = Q (f ++ reverse r) (fl + rl) [] 0

qSnoc :: Q -> W -> Q
qSnoc (Q f fl r rl) v = qBalance (Q f fl (v : r) (rl + 1))

qToList :: Q -> [W]
qToList (Q f _ r _) = f ++ reverse r

qFromList :: [W] -> Q
qFromList = foldl qSnoc qEmpty

foldrXor :: Q -> W
foldrXor q = mcata go (qToList q)
  where
    go _   [] = (0::W)
    go rec (x:xs) = x `xorW` rec xs

foldlSum :: Q -> W -> W
foldlSum q acc0 = mcata go (qToList q) acc0
  where
    go _   []     acc = acc
    go rec (x:xs) acc = rec xs (acc + x)

mapMul3plus1 :: Q -> Q
mapMul3plus1 q = qFromList (mcata go (qToList q))
  where
    go _   []     = []
    go rec (x:xs) = mul3plus1 x : rec xs

zipSum :: (W -> W -> W) -> Q -> Q -> W
zipSum f qa qb = mcata2 go (qToList qa) (qToList qb)
  where
    go _   []     _      = (0::W)
    go _   (_:_)  []     = (0::W)
    go rec (x:xs) (y:ys) = f x y + rec xs ys

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

qLen :: Int
qLen = 32

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          qa     = qFromList (vals qLen sa)
          qb     = qFromList (vals qLen sb)
          qm     = mapMul3plus1 qa
          sl     = foldlSum qm 0
          sr     = foldrXor qm
          za     = zipSum addW qm qb
          zx     = zipSum xorW qm qb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
