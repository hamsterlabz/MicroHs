-- RoseTreeMorphX.hs — rose tree via Morphx generic F-algebra.
-- Pattern functor:  F r = W × [r].  Functor instance derives via
-- the inner list (DeriveFunctor handles nested traversal).


module RoseTreeMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data RoseF r = RoseF W [r]

type Rose = Fix RoseF

roseInsertChild :: Rose -> W -> Rose
roseInsertChild (Fix (RoseF v ks)) v' = Fix (RoseF v (Fix (RoseF v' []) : ks))

roseDeleteFirstChild :: Rose -> Rose
roseDeleteFirstChild t@(Fix (RoseF v [])) = t
roseDeleteFirstChild (Fix (RoseF v (_:ks))) = Fix (RoseF v ks)

-- Algebras --------------------------------------------------

foldrXorAlg :: Algebra RoseF W
foldrXorAlg (RoseF v rs) = foldrXorList v rs
  where
    foldrXorList z []     = z
    foldrXorList z (x:xs) = x `xorW` foldrXorList z xs

foldlSumAlg :: Algebra RoseF (W -> W)
foldlSumAlg (RoseF v ks) = \acc -> foldlList (acc + v) ks
  where
    foldlList z []     = z
    foldlList z (k:ks_) = foldlList (k z) ks_

mapMul3plus1Alg :: Algebra RoseF Rose
mapMul3plus1Alg (RoseF v ks) = Fix (RoseF (mul3plus1 v) ks)

-- Product functor for zipsum.
data RosePairF r = RosePairF W W [r]

pairUp :: Rose -> Rose -> Fix RosePairF
pairUp = curry (ana fmap coalg)
  where
    coalg (Fix (RoseF va kas), Fix (RoseF vb kbs)) =
      RosePairF va vb (zipKids kas kbs)
    zipKids []     _      = []
    zipKids (_:_)  []     = []
    zipKids (a:as) (b:bs) = (a, b) : zipKids as bs

zipSumAddAlg, zipSumXorAlg :: Algebra RosePairF W
zipSumAddAlg (RosePairF va vb rs) = sumList ((va + vb) : rs)
  where sumList [] = (0::W)
        sumList (x:xs) = x + sumList xs
zipSumXorAlg (RosePairF va vb rs) = sumList ((va `xorW` vb) : rs)
  where sumList [] = (0::W)
        sumList (x:xs) = x + sumList xs

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

insertCount :: Int
insertCount = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta0    = foldl roseInsertChild (Fix (RoseF (lcgNext sa) [])) (vals insertCount sa)
          tb     = foldl roseInsertChild (Fix (RoseF (lcgNext sb) [])) (vals insertCount sb)
          ta     = roseDeleteFirstChild (roseDeleteFirstChild ta0)
          tm     = cata fmap mapMul3plus1Alg ta
          sl     = cata fmap foldlSumAlg tm 0
          sr     = cata fmap foldrXorAlg tm
          ab     = pairUp tm tb
          za     = cata fmap zipSumAddAlg ab
          zx     = cata fmap zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor RoseF where
  fmap f (RoseF a b) = RoseF a (map f b)

instance Functor RosePairF where
  fmap f (RosePairF a b c) = RosePairF a b (map f c)

