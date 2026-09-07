-- QueuePure.hs — Banker's queue (Okasaki §6.2).
--
-- Canonical workload (4 hashMix outputs): build / map / foldl /
-- foldr / zipsum.  Matches queue_pure / queue_ninja / queue_morph
-- (C) and QueueMorph (Hs) exactly.  Full surface (snoc/uncons/
-- lookup/member/filter/partition/split/concat/reverse/rotate/
-- scan/unfold) stays defined but is NOT in the hot loop.

module QueuePure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Q = Q { qFront :: [W], qFlen :: Int
           , qRear  :: [W], qRlen :: Int }

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

qMap :: (W -> W) -> Q -> Q
qMap f q = qFromList (map f (qToList q))

qZipSumWith :: (W -> W -> W) -> Q -> Q -> W
qZipSumWith f qa qb = sum (zipWith f (qToList qa) (qToList qb))

qLen :: Int
qLen = 32

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          qa     = qFromList (vals qLen sa)
          qb     = qFromList (vals qLen sb)
          qm     = qMap mul3plus1 qa
          sl     = foldl addW 0 (qToList qm)
          sr     = foldr xorW 0 (qToList qm)
          za     = qZipSumWith addW qm qb
          zx     = qZipSumWith xorW qm qb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
