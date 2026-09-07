-- ListMorphX.hs — list catamorphism / anamorphism over the
-- generic Morphx F-algebra library.  Pattern functor ListF
-- derives Functor; every recursive op routes through Morphx.cata /
-- Morphx.ana with `fmap` passed explicitly.


module ListMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data ListF r = NilF | ConsF W r

type List = Fix ListF

-- Anamorphism: build a list of N LCG samples from a seed.
drawLcg :: Int -> W -> List
drawLcg n0 s0 = ana fmap coalg (n0, s0)
  where
    coalg (0, _) = NilF
    coalg (k, s) = let s' = lcgNext s in ConsF s' (k - 1, s')

-- Drop n head cells — direct destructor, not a morphism.
dropFix :: Int -> List -> List
dropFix 0 xs = xs
dropFix k (Fix NilF)        = Fix NilF
dropFix k (Fix (ConsF _ r)) = dropFix (k - 1) r

-- Algebras --------------------------------------------------

foldrXorAlg :: Algebra ListF W
foldrXorAlg NilF        = 0
foldrXorAlg (ConsF v r) = v `xorW` r

foldlSumAlg :: Algebra ListF (W -> W)
foldlSumAlg NilF        = id
foldlSumAlg (ConsF v k) = \acc -> k (acc + v)

mapMul3plus1Alg :: Algebra ListF List
mapMul3plus1Alg NilF        = Fix NilF
mapMul3plus1Alg (ConsF v r) = Fix (ConsF (mul3plus1 v) r)

-- Product functor for zip.
data ListPairF r = NilP | ConsP W W r

pairUp :: List -> List -> Fix ListPairF
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
          as     = dropFix 4 asFull
          asM    = cata fmap mapMul3plus1Alg as
          sl     = cata fmap foldlSumAlg asM 0
          sr     = cata fmap foldrXorAlg asM
          ab     = pairUp asM bs
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

