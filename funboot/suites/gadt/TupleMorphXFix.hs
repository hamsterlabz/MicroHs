-- TupleMorphX.hs — recursion-scheme variant using the generalized
-- F-algebra library Morphx.  The Triple's pattern functor has NO
-- recursive position, so cata is degenerate (`alg . unFix`) — but
-- the same generic Morphx.cata is used.


module TupleMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

-- Triple functor: F r = W × W × W   (no recursive `r` — phantom).
data TripleF r = TripleF W W W

type Triple = Fix TripleF

mkTriple :: W -> W -> W -> Triple
mkTriple a b c = Fix (TripleF a b c)

-- Product functor for zip.
data TriplePairF r = TriplePairF W W W W W W

-- Build a triple from a seed (3 LCG samples).
fromSeed :: W -> Triple
fromSeed = ana fmap coalg
  where
    coalg s = let s1 = lcgNext s
                  s2 = lcgNext s1
                  s3 = lcgNext s2
              in  TripleF s1 s2 s3

-- Algebras ------------------------------------------------

-- foldr (right-associated XOR over slots).
foldrXorAlg :: Algebra TripleF W
foldrXorAlg (TripleF a b c) = a `xorW` (b `xorW` c)

-- foldl (CPS — left-associated SUM via continuation).
foldlSumAlg :: Algebra TripleF (W -> W)
foldlSumAlg (TripleF a b c) = \z -> (((z + a) + b) + c)

-- Map: structure-preserving cata returning a fresh Triple.
mapMul3plus1Alg :: Algebra TripleF Triple
mapMul3plus1Alg (TripleF a b c) =
  Fix (TripleF (mul3plus1 a) (mul3plus1 b) (mul3plus1 c))

-- "Drop slot 0": xor of slot b and slot c via paramorphism.
dropFirstXorAlg :: TripleF (Triple, W) -> W
dropFirstXorAlg (TripleF _ b c) = b `xorW` c

-- Zipsum via product cata.
zipSumXorAddAlg :: Algebra TriplePairF W
zipSumXorAddAlg (TriplePairF a1 b1 c1 a2 b2 c2) =
  (a1 + a2) `xorW` (b1 + b2) `xorW` (c1 + c2)

zipSumXorXorAlg :: Algebra TriplePairF W
zipSumXorXorAlg (TriplePairF a1 b1 c1 a2 b2 c2) =
  (a1 `xorW` a2) `xorW` (b1 `xorW` b2) `xorW` (c1 `xorW` c2)

pairUp :: Triple -> Triple -> Fix TriplePairF
pairUp x y = case (unFix x, unFix y) of
  (TripleF a1 b1 c1, TripleF a2 b2 c2) ->
    Fix (TriplePairF a1 b1 c1 a2 b2 c2)

bench :: Int -> W
bench n = benchFold n step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          x      = fromSeed sa
          y      = fromSeed sb
          pj     = para fmap dropFirstXorAlg x
          xm     = cata fmap mapMul3plus1Alg x
          sl     = cata fmap foldlSumAlg xm 0
          sr     = cata fmap foldrXorAlg xm
          xy     = pairUp xm y
          za     = cata fmap zipSumXorAddAlg xy
          zx     = cata fmap zipSumXorXorAlg xy
      in  acc `hashMix` sl `hashMix` sr `hashMix` pj `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor TripleF where
  fmap _ (TripleF a b c) = TripleF a b c

instance Functor TriplePairF where
  fmap _ (TriplePairF a b c d e f) = TriplePairF a b c d e f

