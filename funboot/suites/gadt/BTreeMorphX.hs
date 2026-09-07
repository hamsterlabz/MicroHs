-- BTreeMorphX.hs — binary tree via Morphx merged-fmap variant.

module BTreeMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data BT = Leaf | Node W BT BT

data BTF r = LeafF | NodeF W r r

fmapBT :: (BT -> a) -> BT -> BTF a
fmapBT _ Leaf         = LeafF
fmapBT f (Node v l r) = NodeF v (f l) (f r)

fmapBTE :: (a -> BT) -> BTF a -> BT
fmapBTE _ LeafF         = Leaf
fmapBTE f (NodeF v l r) = Node v (f l) (f r)

-- Direct BST insert / delete.
bInsert :: BT -> W -> BT
bInsert Leaf v = Node v Leaf Leaf
bInsert n@(Node k l r) v
  | v <  k    = Node k (bInsert l v) r
  | v >  k    = Node k l (bInsert r v)
  | otherwise = n

bMinKey :: BT -> W
bMinKey (Node k Leaf _) = k
bMinKey (Node _ l _)    = bMinKey l
bMinKey _               = 0

bDeleteMin :: BT -> BT
bDeleteMin (Node _ Leaf r) = r
bDeleteMin (Node k l    r) = Node k (bDeleteMin l) r
bDeleteMin Leaf            = Leaf

bDelete :: BT -> W -> BT
bDelete Leaf _ = Leaf
bDelete (Node k l r) v
  | v <  k    = Node k (bDelete l v) r
  | v >  k    = Node k l (bDelete r v)
  | otherwise = case (l, r) of
      (Leaf, _)    -> r
      (_   , Leaf) -> l
      _            -> let s = bMinKey r in Node s l (bDeleteMin r)

-- Product pair tree (for zipsum).
data BTPair = LeafP | NodeP W W BTPair BTPair
data BTPairF r = LeafPF | NodePF W W r r

fmapPair :: (BTPair -> a) -> BTPair -> BTPairF a
fmapPair _ LeafP             = LeafPF
fmapPair f (NodeP a b lp rp) = NodePF a b (f lp) (f rp)

fmapPairE :: (a -> BTPair) -> BTPairF a -> BTPair
fmapPairE _ LeafPF             = LeafP
fmapPairE f (NodePF a b lp rp) = NodeP a b (f lp) (f rp)

pairUp :: BT -> BT -> BTPair
pairUp = curry (ana' fmapPairE coalg)
  where
    coalg :: (BT, BT) -> BTPairF (BT, BT)
    coalg (Leaf, _) = LeafPF
    coalg (Node _ _ _, Leaf) = LeafPF
    coalg (Node a la ra, Node b lb rb) = NodePF a b (la, lb) (ra, rb)

-- Algebras --------------------------------------------------

foldrXorAlg :: BTF W -> W
foldrXorAlg LeafF         = 0
foldrXorAlg (NodeF v l r) = v `xorW` l `xorW` r

foldlSumAlg :: BTF (W -> W) -> (W -> W)
foldlSumAlg LeafF           = id
foldlSumAlg (NodeF v lk rk) = \acc -> rk ((lk acc) + v)

mapMul3plus1Alg :: BTF BT -> BT
mapMul3plus1Alg LeafF         = Leaf
mapMul3plus1Alg (NodeF v l r) = Node (mul3plus1 v) l r

zipSumAddAlg, zipSumXorAlg :: BTPairF W -> W
zipSumAddAlg LeafPF             = 0
zipSumAddAlg (NodePF a b lr rr) = (a + b) + lr + rr
zipSumXorAlg LeafPF             = 0
zipSumXorAlg (NodePF a b lr rr) = (a `xorW` b) + lr + rr

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
          ta  = foldl bInsert Leaf (keys keyCount sa)
          tb  = foldl bInsert Leaf (keys keyCount sb)
          taD = foldl bDelete ta (keys 4 (sa `xorW` 0xDEAD))
          tm  = cata' fmapBT mapMul3plus1Alg taD
          sl  = cata' fmapBT foldlSumAlg tm 0
          sr  = cata' fmapBT foldrXorAlg tm
          ab  = pairUp tm tb
          za  = cata' fmapPair zipSumAddAlg ab
          zx  = cata' fmapPair zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
