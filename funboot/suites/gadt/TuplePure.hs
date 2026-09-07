-- TuplePure.hs — Haskell translation of tuple_pure.c.
--
-- Tuples are fixed-shape, so "insertion" = construct, "deletion" =
-- project, "fold" = reduce the slots, "map" = transform each slot,
-- "zip" = pair two tuples slot-wise.  Every operation returns a
-- NEW triple — Haskell is pure by default, no mutation to disable.

module TuplePure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Triple = Triple W W W

dropFirst :: Triple -> Triple
dropFirst (Triple _ b c) = Triple 0 b c

-- f a (f b (f c z))
tFoldr :: (W -> W -> W) -> W -> Triple -> W
tFoldr f z (Triple a b c) = f a (f b (f c z))

-- f (f (f z a) b) c
tFoldl :: (W -> W -> W) -> W -> Triple -> W
tFoldl f z (Triple a b c) = f (f (f z a) b) c

tMap :: (W -> W) -> Triple -> Triple
tMap f (Triple a b c) = Triple (f a) (f b) (f c)

tZipWith :: (W -> W -> W) -> Triple -> Triple -> Triple
tZipWith f (Triple a1 b1 c1) (Triple a2 b2 c2) =
  Triple (f a1 a2) (f b1 b2) (f c1 c2)

-- Draw three LCG samples, return (Triple, new-state).
draw3 :: W -> (Triple, W)
draw3 s0 =
  let s1 = lcgNext s0
      s2 = lcgNext s1
      s3 = lcgNext s2
  in  (Triple s1 s2 s3, s3)

bench :: Int -> W
bench n = benchFold n step
  where
    step i acc =
      let seed     = 0xA1F32C97 + fromIntegral i
          (x, s1)  = draw3 seed
          (y, _ )  = draw3 (s1 + 0x5EE9D4B2)
          xm       = tMap mul3plus1 x
          sl       = tFoldl addW 0 xm
          sr       = tFoldr xorW 0 xm
          (Triple a b c) = dropFirst x
          pj       = a `xor` b `xor` c
          (Triple za zb zc) = tZipWith addW xm y
          (Triple xa xb xc) = tZipWith xorW xm y
          zaS      = za `xor` zb `xor` zc
          zxS      = xa `xor` xb `xor` xc
      in  acc `hashMix` sl `hashMix` sr `hashMix` pj `hashMix` zaS `hashMix` zxS

main :: Int
main = bench 4
