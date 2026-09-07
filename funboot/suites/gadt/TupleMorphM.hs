-- TupleMorphM.hs — 3-tuple via Mendler-style.  Triple is
-- non-recursive, so mcata degenerates to slot-apply; included for
-- the matrix.

module TupleMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Triple = Triple W W W

lcg2 :: W -> (W, W)
lcg2 s = let s' = lcgNext s in (s', s')

genTriple :: W -> Triple
genTriple s0 =
  let (a, s1) = lcg2 s0
      (b, s2) = lcg2 s1
      (c, _ ) = lcg2 s2
  in  Triple a b c

foldrXor :: Triple -> W
foldrXor (Triple a b c) = a `xorW` (b `xorW` (c `xorW` 0))

foldlSum :: Triple -> W -> W
foldlSum (Triple a b c) acc = ((acc + a) + b) + c

mapMul3plus1 :: Triple -> Triple
mapMul3plus1 (Triple a b c) = Triple (mul3plus1 a) (mul3plus1 b) (mul3plus1 c)

zipSum :: (W -> W -> W) -> Triple -> Triple -> W
zipSum f (Triple a1 b1 c1) (Triple a2 b2 c2) =
  (f a1 a2 `xorW` (f b1 b2 `xorW` (f c1 c2 `xorW` 0)))

dropFirstXor :: Triple -> W
dropFirstXor (Triple _ b c) = 0 `xorW` b `xorW` c

bench :: Int -> W
bench n = benchFold n step
  where
    step i acc =
      let seed = 0xA1F32C97 + fromIntegral i
          x    = genTriple seed
          y    = genTriple (seed + 0x5EE9D4B2)
          pj   = dropFirstXor x
          xm   = mapMul3plus1 x
          sl   = foldlSum xm 0
          sr   = foldrXor xm
          za   = zipSum addW xm y
          zx   = zipSum xorW xm y
      in  acc `hashMix` sl `hashMix` sr `hashMix` pj `hashMix` za `hashMix` zx

main :: Int
main = bench 4
