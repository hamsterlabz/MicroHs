-- QuadTreeMorphX.hs — quadtree via Morphx merged-fmap variant.

module QuadTreeMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data QT = QtEmpty | QtNode W QT QT QT QT

data QtF r = QtEmptyF | QtNodeF W r r r r

fmapQT :: (QT -> a) -> QT -> QtF a
fmapQT _ QtEmpty            = QtEmptyF
fmapQT f (QtNode v a b c d) = QtNodeF v (f a) (f b) (f c) (f d)
{-# INLINE fmapQT #-}

fmapQTE :: (a -> QT) -> QtF a -> QT
fmapQTE _ QtEmptyF            = QtEmpty
fmapQTE f (QtNodeF v a b c d) = QtNode v (f a) (f b) (f c) (f d)
{-# INLINE fmapQTE #-}

qtDepth :: Int
qtDepth = 4

-- Direct insert / delete.
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

-- Product pair tree.
data QtPair = QtEmptyP | QtNodeP W W QtPair QtPair QtPair QtPair
data QtPairF r = QtEmptyPF | QtNodePF W W r r r r

fmapPair :: (QtPair -> a) -> QtPair -> QtPairF a
fmapPair _ QtEmptyP                = QtEmptyPF
fmapPair f (QtNodeP va vb a b c d) = QtNodePF va vb (f a) (f b) (f c) (f d)
{-# INLINE fmapPair #-}

fmapPairE :: (a -> QtPair) -> QtPairF a -> QtPair
fmapPairE _ QtEmptyPF                = QtEmptyP
fmapPairE f (QtNodePF va vb a b c d) = QtNodeP va vb (f a) (f b) (f c) (f d)
{-# INLINE fmapPairE #-}

-- Functor over QtPairF (regular fmap, not merged) — used by hylo' so
-- the F-structure of seeds emitted by `pairCoalg` can be lifted into
-- F-structure of results without first materialising a QtPair tree.
fmapPairF :: (a -> b) -> QtPairF a -> QtPairF b
fmapPairF _ QtEmptyPF                = QtEmptyPF
fmapPairF f (QtNodePF va vb a b c d) = QtNodePF va vb (f a) (f b) (f c) (f d)
{-# INLINE fmapPairF #-}

pairCoalg :: (QT, QT) -> QtPairF (QT, QT)
pairCoalg (QtEmpty, _) = QtEmptyPF
pairCoalg (QtNode _ _ _ _ _, QtEmpty) = QtEmptyPF
pairCoalg (QtNode va a1 a2 a3 a4, QtNode vb b1 b2 b3 b4) =
  QtNodePF va vb (a1, b1) (a2, b2) (a3, b3) (a4, b4)
{-# INLINE pairCoalg #-}

pairUp :: QT -> QT -> QtPair
pairUp = curry (ana' fmapPairE pairCoalg)

-- Algebras --------------------------------------------------

foldrXorAlg :: QtF W -> W
foldrXorAlg QtEmptyF            = 0
foldrXorAlg (QtNodeF v a b c d) = v `xorW` a `xorW` b `xorW` c `xorW` d

foldlSumAlg :: QtF (W -> W) -> (W -> W)
foldlSumAlg QtEmptyF                = id
foldlSumAlg (QtNodeF v ka kb kc kd) = \acc -> kd (kc (kb (ka (acc + v))))

mapMul3plus1Alg :: QtF QT -> QT
mapMul3plus1Alg QtEmptyF            = QtEmpty
mapMul3plus1Alg (QtNodeF v a b c d) = QtNode (mul3plus1 v) a b c d

zipSumAddAlg, zipSumXorAlg :: QtPairF W -> W
zipSumAddAlg QtEmptyPF                  = 0
zipSumAddAlg (QtNodePF va vb r1 r2 r3 r4) = (va + vb) + r1 + r2 + r3 + r4
zipSumXorAlg QtEmptyPF                  = 0
zipSumXorAlg (QtNodePF va vb r1 r2 r3 r4) = (va `xorW` vb) + r1 + r2 + r3 + r4

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
          tm     = cata' fmapQT mapMul3plus1Alg ta
          sl     = cata' fmapQT foldlSumAlg tm 0
          sr     = cata' fmapQT foldrXorAlg tm
          za     = hylo' fmapPairF zipSumAddAlg pairCoalg (tm, tb)
          zx     = hylo' fmapPairF zipSumXorAlg pairCoalg (tm, tb)
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
