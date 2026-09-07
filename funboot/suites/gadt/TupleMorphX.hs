-- TupleMorphX.hs — Triple via Morphx merged-fmap variant.
-- Direct ADT; pattern functor has no Functor instance — the
-- custom fmap functions are the entire bridge.

module TupleMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Triple = Triple W W W

-- Pattern functor (no Functor instance — the recursive position
-- is phantom here, since Triple is non-recursive).
data TripleF r = TripleF W W W

-- Custom fmaps for the (degenerate) recursive position.
fmapTriple :: (Triple -> a) -> Triple -> TripleF a
fmapTriple _ (Triple a b c) = TripleF a b c

fmapTripleE :: (a -> Triple) -> TripleF a -> Triple
fmapTripleE _ (TripleF a b c) = Triple a b c

fmapTripleP :: (Triple -> (Triple, a)) -> Triple -> TripleF (Triple, a)
fmapTripleP _ (Triple a b c) = TripleF a b c

-- Product functor for zip.
data TriplePair = TriplePair W W W W W W
data TriplePairF r = TriplePairF W W W W W W

fmapPair :: (TriplePair -> a) -> TriplePair -> TriplePairF a
fmapPair _ (TriplePair a1 b1 c1 a2 b2 c2) = TriplePairF a1 b1 c1 a2 b2 c2

-- Build a triple from a seed via anamorphism.
fromSeed :: W -> Triple
fromSeed = ana' fmapTripleE coalg
  where
    coalg :: W -> TripleF W
    coalg s = let s1 = lcgNext s
                  s2 = lcgNext s1
                  s3 = lcgNext s2
              in  TripleF s1 s2 s3

-- Algebras --------------------------------------------------

foldrXorAlg :: TripleF W -> W
foldrXorAlg (TripleF a b c) = a `xorW` (b `xorW` c)

foldlSumAlg :: TripleF (W -> W) -> (W -> W)
foldlSumAlg (TripleF a b c) = \z -> (((z + a) + b) + c)

mapMul3plus1Alg :: TripleF Triple -> Triple
mapMul3plus1Alg (TripleF a b c) =
  Triple (mul3plus1 a) (mul3plus1 b) (mul3plus1 c)

dropFirstXorAlg :: TripleF (Triple, W) -> W
dropFirstXorAlg (TripleF _ b c) = b `xorW` c

zipSumXorAddAlg :: TriplePairF W -> W
zipSumXorAddAlg (TriplePairF a1 b1 c1 a2 b2 c2) =
  (a1 + a2) `xorW` (b1 + b2) `xorW` (c1 + c2)

zipSumXorXorAlg :: TriplePairF W -> W
zipSumXorXorAlg (TriplePairF a1 b1 c1 a2 b2 c2) =
  (a1 `xorW` a2) `xorW` (b1 `xorW` b2) `xorW` (c1 `xorW` c2)

pairUp :: Triple -> Triple -> TriplePair
pairUp (Triple a1 b1 c1) (Triple a2 b2 c2) = TriplePair a1 b1 c1 a2 b2 c2

bench :: Int -> W
bench n = benchFold n step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          x      = fromSeed sa
          y      = fromSeed sb
          pj     = para' fmapTripleP dropFirstXorAlg x
          xm     = cata' fmapTriple mapMul3plus1Alg x
          sl     = cata' fmapTriple foldlSumAlg xm 0
          sr     = cata' fmapTriple foldrXorAlg xm
          xy     = pairUp xm y
          za     = cata' fmapPair zipSumXorAddAlg xy
          zx     = cata' fmapPair zipSumXorXorAlg xy
      in  acc `hashMix` sl `hashMix` sr `hashMix` pj `hashMix` za `hashMix` zx

main :: Int
main = bench 4
