-- BTreeMorphX.hs — binary tree via the generic Morphx F-algebra
-- library.  Pattern functor BTF derives Functor.


module BTreeMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data BTF r = LeafF | NodeF W r r

type BT = Fix BTF

-- Direct BST insert (key-bit dispatch — not a clean F-algebra step).
bInsert :: BT -> W -> BT
bInsert (Fix LeafF) v = Fix (NodeF v (Fix LeafF) (Fix LeafF))
bInsert t@(Fix (NodeF k l r)) v
  | v <  k    = Fix (NodeF k (bInsert l v) r)
  | v >  k    = Fix (NodeF k l (bInsert r v))
  | otherwise = t

bMinKey :: BT -> W
bMinKey (Fix (NodeF k (Fix LeafF) _)) = k
bMinKey (Fix (NodeF _ l _))           = bMinKey l
bMinKey _                              = 0

bDeleteMin :: BT -> BT
bDeleteMin (Fix (NodeF _ (Fix LeafF) r)) = r
bDeleteMin (Fix (NodeF k l r))           = Fix (NodeF k (bDeleteMin l) r)
bDeleteMin (Fix LeafF)                   = Fix LeafF

bDelete :: BT -> W -> BT
bDelete (Fix LeafF) _ = Fix LeafF
bDelete (Fix (NodeF k l r)) v
  | v <  k    = Fix (NodeF k (bDelete l v) r)
  | v >  k    = Fix (NodeF k l (bDelete r v))
  | otherwise = case (unFix l, unFix r) of
      (LeafF, _)    -> r
      (_   , LeafF) -> l
      _             -> let s = bMinKey r in Fix (NodeF s l (bDeleteMin r))

-- Algebras --------------------------------------------------

foldrXorAlg :: Algebra BTF W
foldrXorAlg LeafF         = 0
foldrXorAlg (NodeF v l r) = v `xorW` l `xorW` r

-- CPS foldl: in-order, accumulator threaded left → root → right.
foldlSumAlg :: Algebra BTF (W -> W)
foldlSumAlg LeafF           = id
foldlSumAlg (NodeF v lk rk) = \acc -> rk ((lk acc) + v)

mapMul3plus1Alg :: Algebra BTF BT
mapMul3plus1Alg LeafF         = Fix LeafF
mapMul3plus1Alg (NodeF v l r) = Fix (NodeF (mul3plus1 v) l r)

-- Product functor for zipsum.
data BTPairF r = LeafP | NodeP W W r r

pairUp :: BT -> BT -> Fix BTPairF
pairUp = curry (ana fmap coalg)
  where
    coalg (Fix LeafF, _) = LeafP
    coalg (Fix (NodeF _ _ _), Fix LeafF) = LeafP
    coalg (Fix (NodeF a la ra), Fix (NodeF b lb rb)) =
      NodeP a b (la, lb) (ra, rb)

zipSumAddAlg, zipSumXorAlg :: Algebra BTPairF W
zipSumAddAlg LeafP             = 0
zipSumAddAlg (NodeP a b lr rr) = (a + b) + lr + rr
zipSumXorAlg LeafP             = 0
zipSumXorAlg (NodeP a b lr rr) = (a `xorW` b) + lr + rr

keys :: Int -> W -> [W]
keys 0 _ = []
keys n s = let s' = lcgNext s in (s' .&. 4095) : keys (n - 1) s'

keyCount :: Int
keyCount = 24

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa  = 0xA1F32C97 + fromIntegral i
          sb  = 0x5EE9D4B2 + fromIntegral i
          ta  = foldl bInsert (Fix LeafF) (keys keyCount sa)
          tb  = foldl bInsert (Fix LeafF) (keys keyCount sb)
          taD = foldl bDelete ta (keys 4 (sa `xorW` 0xDEAD))
          tm  = cata fmap mapMul3plus1Alg taD
          sl  = cata fmap foldlSumAlg tm 0
          sr  = cata fmap foldrXorAlg tm
          ab  = pairUp tm tb
          za  = cata fmap zipSumAddAlg ab
          zx  = cata fmap zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor BTF where
  fmap _ LeafF = LeafF
  fmap f (NodeF a b c) = NodeF a (f b) (f c)

instance Functor BTPairF where
  fmap _ LeafP = LeafP
  fmap f (NodeP a b c d) = NodeP a b (f c) (f d)

