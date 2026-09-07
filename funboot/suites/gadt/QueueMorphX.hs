-- QueueMorphX.hs — Banker's queue via Morphx merged-fmap variant.

module QueueMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Seq = Nil | Cons W Seq
data ListF r = NilF | ConsF W r

fmapSeq :: (Seq -> a) -> Seq -> ListF a
fmapSeq _ Nil        = NilF
fmapSeq f (Cons v r) = ConsF v (f r)

fmapSeqE :: (a -> Seq) -> ListF a -> Seq
fmapSeqE _ NilF        = Nil
fmapSeqE f (ConsF v r) = Cons v (f r)

-- Banker's queue (storage).
data Q = Q [W] Int [W] Int

qEmpty :: Q
qEmpty = Q [] 0 [] 0

qBalance :: Q -> Q
qBalance q@(Q f fl r rl)
  | fl >= rl  = q
  | otherwise = Q (f ++ reverse r) (fl + rl) [] 0

qSnoc :: Q -> W -> Q
qSnoc (Q f fl r rl) v = qBalance (Q f fl (v : r) (rl + 1))

qFromList :: [W] -> Q
qFromList = foldl qSnoc qEmpty

qToList :: Q -> [W]
qToList (Q f _ r _) = f ++ reverse r

qToSeq :: Q -> Seq
qToSeq q = ana' fmapSeqE coalg (qToList q)
  where
    coalg :: [W] -> ListF [W]
    coalg []     = NilF
    coalg (x:xs) = ConsF x xs

-- Product pair sequence for zipsum.
data PairSeq = PNil | PCons W W PairSeq
data ListPairF r = PNilF | PConsF W W r

fmapPair :: (PairSeq -> a) -> PairSeq -> ListPairF a
fmapPair _ PNil          = PNilF
fmapPair f (PCons a b r) = PConsF a b (f r)

fmapPairE :: (a -> PairSeq) -> ListPairF a -> PairSeq
fmapPairE _ PNilF          = PNil
fmapPairE f (PConsF a b r) = PCons a b (f r)

pairUp :: Seq -> Seq -> PairSeq
pairUp = curry (ana' fmapPairE coalg)
  where
    coalg :: (Seq, Seq) -> ListPairF (Seq, Seq)
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

mapMul3plus1Alg :: ListF Seq -> Seq
mapMul3plus1Alg NilF        = Nil
mapMul3plus1Alg (ConsF v r) = Cons (mul3plus1 v) r

zipSumAddAlg, zipSumXorAlg :: ListPairF W -> W
zipSumAddAlg PNilF          = 0
zipSumAddAlg (PConsF a b r) = (a + b) + r
zipSumXorAlg PNilF          = 0
zipSumXorAlg (PConsF a b r) = (a `xorW` b) + r

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
          qaSeq  = qToSeq qa
          qbSeq  = qToSeq qb
          qmSeq  = cata' fmapSeq mapMul3plus1Alg qaSeq
          sl     = cata' fmapSeq foldlSumAlg qmSeq 0
          sr     = cata' fmapSeq foldrXorAlg qmSeq
          ab     = pairUp qmSeq qbSeq
          za     = cata' fmapPair zipSumAddAlg ab
          zx     = cata' fmapPair zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
