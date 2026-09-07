-- BTreePure.hs — Haskell translation of btree_pure.c.
--
-- Path-copying binary search tree.  Every mutation returns a NEW
-- tree along the path of the change; untouched subtrees are shared.

module BTreePure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data BT = Leaf | Node W BT BT

bInsert :: BT -> W -> BT
bInsert Leaf k             = Node k Leaf Leaf
bInsert n@(Node k0 l r) k
  | k <  k0   = Node k0 (bInsert l k) r
  | k >  k0   = Node k0 l (bInsert r k)
  | otherwise = n

bMinKey :: BT -> W
bMinKey (Node k Leaf _) = k
bMinKey (Node _ l _)    = bMinKey l
bMinKey _               = 0    -- caller guards Leaf

bDeleteMin :: BT -> BT
bDeleteMin (Node _ Leaf r) = r
bDeleteMin (Node k l    r) = Node k (bDeleteMin l) r
bDeleteMin Leaf            = Leaf

bDelete :: BT -> W -> BT
bDelete Leaf _ = Leaf
bDelete (Node k0 l r) k
  | k <  k0   = Node k0 (bDelete l k) r
  | k >  k0   = Node k0 l (bDelete r k)
  | otherwise = case (l, r) of
      (Leaf, _)    -> r
      (_   , Leaf) -> l
      _            -> let s = bMinKey r in Node s l (bDeleteMin r)

-- In-order folds.
bFoldl :: (W -> W -> W) -> W -> BT -> W
bFoldl _ z Leaf         = z
bFoldl f z (Node v l r) = bFoldl f (f (bFoldl f z l) v) r

bFoldr :: (W -> W -> W) -> W -> BT -> W
bFoldr _ z Leaf         = z
bFoldr f z (Node v l r) = bFoldr f (f v (bFoldr f z r)) l

bMap :: (W -> W) -> BT -> BT
bMap _ Leaf         = Leaf
bMap f (Node v l r) = Node (f v) (bMap f l) (bMap f r)

-- Structure-aligned zip-sum.
bZipSumWith :: (W -> W -> W) -> BT -> BT -> W
bZipSumWith _ Leaf _    = 0
bZipSumWith _ (Node _ _ _) Leaf = 0
bZipSumWith f (Node a la ra) (Node b lb rb) =
  f a b + bZipSumWith f la lb + bZipSumWith f ra rb

-- Build an LCG-driven key stream of size `n`, threading the seed.
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
          -- Delete four pseudo-random keys.
          taD    = foldl bDelete ta (keys 4 (sa `xorW` 0xDEAD))
          tm     = bMap mul3plus1 taD
          sl     = bFoldl addW 0 tm
          sr     = bFoldr xorW 0 tm
          za     = bZipSumWith addW tm tb
          zx     = bZipSumWith xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
