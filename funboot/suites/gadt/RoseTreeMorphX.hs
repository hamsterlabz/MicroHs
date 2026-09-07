-- RoseTreeMorphX.hs — rose tree via Morphx merged-fmap variant.

module RoseTreeMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Rose = Rose W [Rose]
data RoseF r = RoseF W [r]

fmapRose :: (Rose -> a) -> Rose -> RoseF a
fmapRose f (Rose v ks) = RoseF v (goMap ks)
  where
    goMap []     = []
    goMap (x:xs) = f x : goMap xs
{-# INLINE fmapRose #-}

fmapRoseE :: (a -> Rose) -> RoseF a -> Rose
fmapRoseE f (RoseF v ks) = Rose v (goMap ks)
  where
    goMap []     = []
    goMap (x:xs) = f x : goMap xs
{-# INLINE fmapRoseE #-}

roseInsertChild :: Rose -> W -> Rose
roseInsertChild (Rose v ks) v' = Rose v (Rose v' [] : ks)

roseDeleteFirstChild :: Rose -> Rose
roseDeleteFirstChild t@(Rose _ []) = t
roseDeleteFirstChild (Rose v (_:ks)) = Rose v ks

-- Product pair rose for zipsum.
data RosePair = RosePair W W [RosePair]
data RosePairF r = RosePairF W W [r]

fmapRPair :: (RosePair -> a) -> RosePair -> RosePairF a
fmapRPair f (RosePair a b ks) = RosePairF a b (goMap ks)
  where
    goMap []     = []
    goMap (x:xs) = f x : goMap xs
{-# INLINE fmapRPair #-}

fmapRPairE :: (a -> RosePair) -> RosePairF a -> RosePair
fmapRPairE f (RosePairF a b ks) = RosePair a b (goMap ks)
  where
    goMap []     = []
    goMap (x:xs) = f x : goMap xs
{-# INLINE fmapRPairE #-}

-- Plain Functor over RosePairF (not merged) — used by hylo' to skip
-- materialising the intermediate RosePair tree.
fmapRPairF :: (a -> b) -> RosePairF a -> RosePairF b
fmapRPairF f (RosePairF a b ks) = RosePairF a b (goMap ks)
  where
    goMap []     = []
    goMap (x:xs) = f x : goMap xs
{-# INLINE fmapRPairF #-}

pairCoalg :: (Rose, Rose) -> RosePairF (Rose, Rose)
pairCoalg (Rose va kas, Rose vb kbs) = RosePairF va vb (zipKids kas kbs)
  where
    zipKids []     _      = []
    zipKids (_:_)  []     = []
    zipKids (a:as) (b:bs) = (a, b) : zipKids as bs
{-# INLINE pairCoalg #-}

pairUp :: Rose -> Rose -> RosePair
pairUp = curry (ana' fmapRPairE pairCoalg)

-- Algebras --------------------------------------------------

foldrXorAlg :: RoseF W -> W
foldrXorAlg (RoseF v rs) = foldrXorList v rs
  where foldrXorList z []     = z
        foldrXorList z (x:xs) = x `xorW` foldrXorList z xs
{-# INLINE foldrXorAlg #-}

-- η-expand so GHC sees the case under the binder; otherwise the
-- closure is built around `RoseF v ks` and the destructuring case
-- is delayed past the lambda, leaving a residual RoseF allocation
-- per node.
foldlSumAlg :: RoseF (W -> W) -> W -> W
foldlSumAlg (RoseF v ks) acc = foldlList (acc + v) ks
  where foldlList z []      = z
        foldlList z (k:ks_) = foldlList (k z) ks_
{-# INLINE foldlSumAlg #-}

mapMul3plus1Alg :: RoseF Rose -> Rose
mapMul3plus1Alg (RoseF v ks) = Rose (mul3plus1 v) ks
{-# INLINE mapMul3plus1Alg #-}

zipSumAddAlg, zipSumXorAlg :: RosePairF W -> W
zipSumAddAlg (RosePairF va vb rs) = sumList ((va + vb) : rs)
  where sumList [] = (0::W)
        sumList (x:xs) = x + sumList xs
{-# INLINE zipSumAddAlg #-}
zipSumXorAlg (RosePairF va vb rs) = sumList ((va `xorW` vb) : rs)
  where sumList [] = (0::W)
        sumList (x:xs) = x + sumList xs
{-# INLINE zipSumXorAlg #-}

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

insertCount :: Int
insertCount = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta0    = foldl roseInsertChild (Rose (lcgNext sa) []) (vals insertCount sa)
          tb     = foldl roseInsertChild (Rose (lcgNext sb) []) (vals insertCount sb)
          ta     = roseDeleteFirstChild (roseDeleteFirstChild ta0)
          tm     = cata' fmapRose mapMul3plus1Alg ta
          sl     = cata' fmapRose foldlSumAlg tm 0
          sr     = cata' fmapRose foldrXorAlg tm
          za     = hylo' fmapRPairF zipSumAddAlg pairCoalg (tm, tb)
          zx     = hylo' fmapRPairF zipSumXorAlg pairCoalg (tm, tb)
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
