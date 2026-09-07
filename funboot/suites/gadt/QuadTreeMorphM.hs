-- QuadTreeMorphM.hs — quadtree via Mendler-style.

module QuadTreeMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data QT = QtEmpty | QtNode W QT QT QT QT

qtDepth :: Int
qtDepth = 4

qtInsert :: QT -> W -> Int -> W -> QT
qtInsert _ _ 0 v = QtNode v QtEmpty QtEmpty QtEmpty QtEmpty
qtInsert t addr dl v =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
      (va, ka, kb, kc, kd) = case t of
        QtNode v0 a b c d -> (v0, a, b, c, d)
        QtEmpty           -> ((0::W), QtEmpty, QtEmpty, QtEmpty, QtEmpty)
      kid = case q of 0 -> ka; 1 -> kb; 2 -> kc; _ -> kd
      nk  = qtInsert kid addr (dl - 1) v
  in  case q of
        0 -> QtNode va nk kb kc kd
        1 -> QtNode va ka nk kc kd
        2 -> QtNode va ka kb nk kd
        _ -> QtNode va ka kb kc nk

qtDelete :: QT -> W -> Int -> QT
qtDelete QtEmpty _ _ = QtEmpty
qtDelete (QtNode _ a b c d) _ 0 = QtNode 0 a b c d
qtDelete t addr dl =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
      (va, ka, kb, kc, kd) = case t of
        QtNode v0 a b c d_ -> (v0, a, b, c, d_)
        QtEmpty            -> ((0::W), QtEmpty, QtEmpty, QtEmpty, QtEmpty)
      kid = case q of 0 -> ka; 1 -> kb; 2 -> kc; _ -> kd
      nk  = qtDelete kid addr (dl - 1)
  in  case q of
        0 -> QtNode va nk kb kc kd
        1 -> QtNode va ka nk kc kd
        2 -> QtNode va ka kb nk kd
        _ -> QtNode va ka kb kc nk

foldrXor :: QT -> W
foldrXor = mcata $ \rec t -> case t of
  QtEmpty          -> 0
  QtNode v a b c d -> v `xorW` rec a `xorW` rec b `xorW` rec c `xorW` rec d

foldlSum :: QT -> W -> W
foldlSum = mcata $ \rec t acc -> case t of
  QtEmpty          -> acc
  QtNode v a b c d -> rec d (rec c (rec b (rec a (acc + v))))

mapMul3plus1 :: QT -> QT
mapMul3plus1 = mcata $ \rec t -> case t of
  QtEmpty          -> QtEmpty
  QtNode v a b c d -> QtNode (mul3plus1 v) (rec a) (rec b) (rec c) (rec d)

zipSum :: (W -> W -> W) -> QT -> QT -> W
zipSum f = mcata2 $ \rec a b -> case (a, b) of
  (QtNode va a1 a2 a3 a4, QtNode vb b1 b2 b3 b4) ->
    f va vb + rec a1 b1 + rec a2 b2 + rec a3 b3 + rec a4 b4
  _ -> 0

mkOps :: Int -> W -> [(W, W)]
mkOps 0 _ = []
mkOps n s = let s1 = lcgNext s
                a  = s1 .&. 0xFF
                s2 = lcgNext s1
            in  (a, s2) : mkOps (n - 1) s2

insertCount :: Int
insertCount = 24

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          insA   = mkOps insertCount sa
          insB   = mkOps insertCount sb
          ta0    = foldl (\t (a, v) -> qtInsert t a qtDepth v) QtEmpty insA
          tb     = foldl (\t (a, v) -> qtInsert t a qtDepth v) QtEmpty insB
          dels   = [a | (a, _) <- mkOps 4 (sa `xorW` 0xCAFE)]
          ta     = foldl (\t a -> qtDelete t a qtDepth) ta0 dels
          tm     = mapMul3plus1 ta
          sl     = foldlSum tm 0
          sr     = foldrXor tm
          za     = zipSum addW tm tb
          zx     = zipSum xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
