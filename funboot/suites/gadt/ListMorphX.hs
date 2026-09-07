-- ListMorphX.hs — list via Morphx merged-fmap variant.

module ListMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data List = Nil | Cons W List

-- Pattern functor (no Functor instance).
data ListF r = NilF | ConsF W r

-- Custom fmaps per ADT.
fmapList :: (List -> a) -> List -> ListF a
fmapList _ Nil         = NilF
fmapList f (Cons v r)  = ConsF v (f r)

fmapListE :: (a -> List) -> ListF a -> List
fmapListE _ NilF         = Nil
fmapListE f (ConsF v r)  = Cons v (f r)

-- Product functor for zip.
data PairList = PNil | PCons W W PairList
data ListPairF r = PNilF | PConsF W W r

fmapPair :: (PairList -> a) -> PairList -> ListPairF a
fmapPair _ PNil           = PNilF
fmapPair f (PCons a b r)  = PConsF a b (f r)

fmapPairE :: (a -> PairList) -> ListPairF a -> PairList
fmapPairE _ PNilF           = PNil
fmapPairE f (PConsF a b r)  = PCons a b (f r)

-- Build a list from a seed via anamorphism.
drawLcg :: Int -> W -> List
drawLcg n0 s0 = ana' fmapListE coalg (n0, s0)
  where
    coalg :: (Int, W) -> ListF (Int, W)
    coalg (0, _) = NilF
    coalg (k, s) = let s' = lcgNext s in ConsF s' (k - 1, s')

dropN :: Int -> List -> List
dropN 0 xs           = xs
dropN _ Nil          = Nil
dropN k (Cons _ r)   = dropN (k - 1) r

pairUp :: List -> List -> PairList
pairUp = curry (ana' fmapPairE coalg)
  where
    coalg :: (List, List) -> ListPairF (List, List)
    coalg (Nil, _) = PNilF
    coalg (Cons _ _, Nil) = PNilF
    coalg (Cons a as, Cons b bs) = PConsF a b (as, bs)

-- Algebras --------------------------------------------------

foldrXorAlg :: ListF W -> W
foldrXorAlg NilF        = 0
foldrXorAlg (ConsF v r) = v `xorW` r

foldlSumAlg :: ListF (W -> W) -> (W -> W)
foldlSumAlg NilF        = id
foldlSumAlg (ConsF v k) = \acc -> k (acc + v)

mapMul3plus1Alg :: ListF List -> List
mapMul3plus1Alg NilF        = Nil
mapMul3plus1Alg (ConsF v r) = Cons (mul3plus1 v) r

zipSumAddAlg, zipSumXorAlg :: ListPairF W -> W
zipSumAddAlg PNilF          = 0
zipSumAddAlg (PConsF a b r) = (a + b) + r
zipSumXorAlg PNilF          = 0
zipSumXorAlg (PConsF a b r) = (a `xorW` b) + r

listLen :: Int
listLen = 64

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          asFull = drawLcg listLen sa
          bs     = drawLcg listLen sb
          as     = dropN 4 asFull
          asM    = cata' fmapList mapMul3plus1Alg as
          sl     = cata' fmapList foldlSumAlg asM 0
          sr     = cata' fmapList foldrXorAlg asM
          ab     = pairUp asM bs
          za     = cata' fmapPair zipSumAddAlg ab
          zx     = cata' fmapPair zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
