-- BTreeMorphM.hs — binary tree via Mendler-style.

module BTreeMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data BT = Leaf | Node W BT BT

foldrXor :: BT -> W
foldrXor = mcata $ \rec t -> case t of
  Leaf       -> 0
  Node v l r -> v `xorW` rec l `xorW` rec r

foldlSum :: BT -> W -> W
foldlSum = mcata $ \rec t acc -> case t of
  Leaf       -> acc
  Node v l r -> rec r (rec l acc + v)

mapMul3plus1 :: BT -> BT
mapMul3plus1 = mcata $ \rec t -> case t of
  Leaf       -> Leaf
  Node v l r -> Node (mul3plus1 v) (rec l) (rec r)

zipSum :: (W -> W -> W) -> BT -> BT -> W
zipSum f = mcata2 $ \rec a b -> case (a, b) of
  (Node va la ra, Node vb lb rb) -> f va vb + rec la lb + rec ra rb
  _                              -> 0

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

keys :: Int -> W -> [W]
keys 0 _ = []
keys n s = let s' = lcgNext s in (s' .&. 4095) : keys (n - 1) s'

keyCount :: Int
keyCount = 24

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta     = foldl bInsert Leaf (keys keyCount sa)
          tb     = foldl bInsert Leaf (keys keyCount sb)
          taD    = foldl bDelete ta (keys 4 (sa `xorW` 0xDEAD))
          tm     = mapMul3plus1 taD
          sl     = foldlSum tm 0
          sr     = foldrXor tm
          za     = zipSum addW tm tb
          zx     = zipSum xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
