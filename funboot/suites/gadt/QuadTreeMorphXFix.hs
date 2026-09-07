-- QuadTreeMorphX.hs — quadtree via Morphx generic F-algebra.


module QuadTreeMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data QtF r = QtEmptyF | QtNodeF W r r r r

type QT = Fix QtF

qtDepth :: Int
qtDepth = 4

-- Direct insert / delete (address-bit dispatch — not a clean cata).
qtInsert :: QT -> W -> Int -> W -> QT
qtInsert _ _ 0 v = Fix (QtNodeF v (Fix QtEmptyF) (Fix QtEmptyF) (Fix QtEmptyF) (Fix QtEmptyF))
qtInsert t addr dl v =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
      (va, ka, kb, kc, kd) = case unFix t of
        QtNodeF v0 a b c d -> (v0, a, b, c, d)
        QtEmptyF           -> ((0::W), Fix QtEmptyF, Fix QtEmptyF, Fix QtEmptyF, Fix QtEmptyF)
      kid = case q of 0 -> ka; 1 -> kb; 2 -> kc; _ -> kd
      nk  = qtInsert kid addr (dl - 1) v
  in  case q of
        0 -> Fix (QtNodeF va nk kb kc kd)
        1 -> Fix (QtNodeF va ka nk kc kd)
        2 -> Fix (QtNodeF va ka kb nk kd)
        _ -> Fix (QtNodeF va ka kb kc nk)

qtDelete :: QT -> W -> Int -> QT
qtDelete (Fix QtEmptyF) _ _ = Fix QtEmptyF
qtDelete (Fix (QtNodeF _ a b c d)) _ 0 = Fix (QtNodeF 0 a b c d)
qtDelete t addr dl =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
      (va, ka, kb, kc, kd) = case unFix t of
        QtNodeF v0 a b c d_ -> (v0, a, b, c, d_)
        QtEmptyF            -> ((0::W), Fix QtEmptyF, Fix QtEmptyF, Fix QtEmptyF, Fix QtEmptyF)
      kid = case q of 0 -> ka; 1 -> kb; 2 -> kc; _ -> kd
      nk  = qtDelete kid addr (dl - 1)
  in  case q of
        0 -> Fix (QtNodeF va nk kb kc kd)
        1 -> Fix (QtNodeF va ka nk kc kd)
        2 -> Fix (QtNodeF va ka kb nk kd)
        _ -> Fix (QtNodeF va ka kb kc nk)

-- Algebras --------------------------------------------------

foldrXorAlg :: Algebra QtF W
foldrXorAlg QtEmptyF             = 0
foldrXorAlg (QtNodeF v a b c d) = v `xorW` a `xorW` b `xorW` c `xorW` d

foldlSumAlg :: Algebra QtF (W -> W)
foldlSumAlg QtEmptyF                  = id
foldlSumAlg (QtNodeF v ka kb kc kd)   = \acc -> kd (kc (kb (ka (acc + v))))

mapMul3plus1Alg :: Algebra QtF QT
mapMul3plus1Alg QtEmptyF             = Fix QtEmptyF
mapMul3plus1Alg (QtNodeF v a b c d) = Fix (QtNodeF (mul3plus1 v) a b c d)

-- Product functor for zipsum.
data QtPairF r = QtEmptyP | QtNodeP W W r r r r

pairUp :: QT -> QT -> Fix QtPairF
pairUp = curry (ana fmap coalg)
  where
    coalg (Fix QtEmptyF, _) = QtEmptyP
    coalg (Fix (QtNodeF _ _ _ _ _), Fix QtEmptyF) = QtEmptyP
    coalg (Fix (QtNodeF va a1 a2 a3 a4), Fix (QtNodeF vb b1 b2 b3 b4)) =
      QtNodeP va vb (a1, b1) (a2, b2) (a3, b3) (a4, b4)

zipSumAddAlg, zipSumXorAlg :: Algebra QtPairF W
zipSumAddAlg QtEmptyP                       = 0
zipSumAddAlg (QtNodeP va vb r1 r2 r3 r4)    = (va + vb) + r1 + r2 + r3 + r4
zipSumXorAlg QtEmptyP                       = 0
zipSumXorAlg (QtNodeP va vb r1 r2 r3 r4)    = (va `xorW` vb) + r1 + r2 + r3 + r4

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
          ta0    = foldl (\t (a, v) -> qtInsert t a qtDepth v) (Fix QtEmptyF) insA
          tb     = foldl (\t (a, v) -> qtInsert t a qtDepth v) (Fix QtEmptyF) insB
          dels   = [a | (a, _) <- mkOps 4 (sa `xorW` 0xCAFE)]
          ta     = foldl (\t a -> qtDelete t a qtDepth) ta0 dels
          tm     = cata fmap mapMul3plus1Alg ta
          sl     = cata fmap foldlSumAlg tm 0
          sr     = cata fmap foldrXorAlg tm
          ab     = pairUp tm tb
          za     = cata fmap zipSumAddAlg ab
          zx     = cata fmap zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor QtF where
  fmap _ QtEmptyF = QtEmptyF
  fmap f (QtNodeF a b c d e) = QtNodeF a (f b) (f c) (f d) (f e)

instance Functor QtPairF where
  fmap _ QtEmptyP = QtEmptyP
  fmap g (QtNodeP a b c d e h) = QtNodeP a b (g c) (g d) (g e) (g h)

