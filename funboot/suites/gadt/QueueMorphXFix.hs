-- QueueMorphX.hs — Banker's queue over Morphx generic F-algebra.
--
-- Logical sequence of a queue is a list; the pattern functor we
-- expose is the same ListF used by ListMorphX, and queue ops lift
-- through qToFix / qFromFix.


module QueueMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data ListF r = NilF | ConsF W r

type Seq = Fix ListF

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

-- Build a Fix ListF from a queue.
qToFix :: Q -> Seq
qToFix q = ana fmap coalg (qToList q)
  where
    coalg []     = NilF
    coalg (x:xs) = ConsF x xs

-- Algebras --------------------------------------------------

foldrXorAlg :: Algebra ListF W
foldrXorAlg NilF        = 0
foldrXorAlg (ConsF v r) = v `xorW` r

foldlSumAlg :: Algebra ListF (W -> W)
foldlSumAlg NilF        = id
foldlSumAlg (ConsF v k) = \acc -> k (acc + v)

mapMul3plus1Alg :: Algebra ListF Seq
mapMul3plus1Alg NilF        = Fix NilF
mapMul3plus1Alg (ConsF v r) = Fix (ConsF (mul3plus1 v) r)

-- Product functor for zipsum.
data ListPairF r = NilP | ConsP W W r

pairUp :: Seq -> Seq -> Fix ListPairF
pairUp = curry (ana fmap coalg)
  where
    coalg (Fix NilF, _) = NilP
    coalg (Fix (ConsF _ _), Fix NilF) = NilP
    coalg (Fix (ConsF a as), Fix (ConsF b bs)) = ConsP a b (as, bs)

zipSumAddAlg, zipSumXorAlg :: Algebra ListPairF W
zipSumAddAlg NilP          = 0
zipSumAddAlg (ConsP a b r) = (a + b) + r
zipSumXorAlg NilP          = 0
zipSumXorAlg (ConsP a b r) = (a `xorW` b) + r

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
          qaFix  = qToFix qa
          qbFix  = qToFix qb
          qmFix  = cata fmap mapMul3plus1Alg qaFix
          sl     = cata fmap foldlSumAlg qmFix 0
          sr     = cata fmap foldrXorAlg qmFix
          ab     = pairUp qmFix qbFix
          za     = cata fmap zipSumAddAlg ab
          zx     = cata fmap zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor ListF where
  fmap _ NilF = NilF
  fmap f (ConsF a b) = ConsF a (f b)

instance Functor ListPairF where
  fmap _ NilP = NilP
  fmap f (ConsP a b c) = ConsP a b (f c)

