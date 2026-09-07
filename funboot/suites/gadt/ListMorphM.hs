-- ListMorphM.hs — lists via Mendler-style open recursion.

module ListMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

foldrXor :: [W] -> W
foldrXor = mcata $ \rec xs -> case xs of
  []     -> 0
  (h:hs) -> h `xorW` rec hs

foldlSum :: [W] -> W -> W
foldlSum = mcata $ \rec xs acc -> case xs of
  []     -> acc
  (h:hs) -> rec hs (acc + h)

mapMul3plus1 :: [W] -> [W]
mapMul3plus1 = mcata $ \rec xs -> case xs of
  []     -> []
  (h:hs) -> mul3plus1 h : rec hs

zipSum :: (W -> W -> W) -> [W] -> [W] -> W
zipSum f = mcata2 $ \rec as bs -> case (as, bs) of
  (x:xs, y:ys) -> f x y + rec xs ys
  _            -> 0

draws :: Int -> W -> ([W], W)
draws n s0 = go n s0 []
  where
    go 0 s acc = (acc, s)
    go k s acc = let s' = lcgNext s in go (k - 1) s' (s' : acc)

listLen :: Int
listLen = 64

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let seed     = 0xA1F32C97 + fromIntegral i
          seed'    = 0x5EE9D4B2 + fromIntegral i
          (as0, _) = draws listLen seed
          (bs0, _) = draws listLen seed'
          as       = drop 4 as0
          bs       = bs0
          asM      = mapMul3plus1 as
          sumL     = foldlSum asM 0
          sumR     = foldrXor asM
          zAdd     = zipSum addW asM bs
          zXor     = zipSum xorW asM bs
      in  acc `hashMix` sumL `hashMix` sumR `hashMix` zAdd `hashMix` zXor

main :: Int
main = bench 4
