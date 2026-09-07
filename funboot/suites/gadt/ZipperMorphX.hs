-- ZipperMorphX.hs — zipper over a binary tree via Morphx
-- merged-fmap variant.  Recursion lives entirely in the focus
-- tree (direct ADT); navigation is non-recursive surface.

module ZipperMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Tree = Leaf | Node W Tree Tree
data BTF r = LeafF | NodeF W r r

fmapTree :: (Tree -> a) -> Tree -> BTF a
fmapTree _ Leaf         = LeafF
fmapTree f (Node v l r) = NodeF v (f l) (f r)

fmapTreeE :: (a -> Tree) -> BTF a -> Tree
fmapTreeE _ LeafF         = Leaf
fmapTreeE f (NodeF v l r) = Node v (f l) (f r)

-- Zipper -------------------------------------------------

data Dir = DL | DR
data Crumb = Crumb Dir W Tree
type Trail = [Crumb]
data Zip = Zip Tree Trail

zDownL, zDownR :: Zip -> Zip
zDownL z@(Zip Leaf _) = z
zDownL (Zip (Node v l r) ts) = Zip l (Crumb DL v r : ts)
zDownR z@(Zip Leaf _) = z
zDownR (Zip (Node v l r) ts) = Zip r (Crumb DR v l : ts)

zUp :: Zip -> Zip
zUp z@(Zip _ []) = z
zUp (Zip f (Crumb DL v sib : ts)) = Zip (Node v f sib) ts
zUp (Zip f (Crumb DR v sib : ts)) = Zip (Node v sib f) ts

zTop :: Zip -> Zip
zTop z@(Zip _ []) = z
zTop z            = zTop (zUp z)

zModify :: (W -> W) -> Zip -> Zip
zModify _ z@(Zip Leaf _) = z
zModify f (Zip (Node v l r) ts) = Zip (Node (f v) l r) ts

zReplace :: Tree -> Zip -> Zip
zReplace t (Zip _ ts) = Zip t ts

zInsert :: W -> Zip -> Zip
zInsert v = zReplace (Node v Leaf Leaf)

zDelete :: Zip -> Zip
zDelete = zReplace Leaf

tInsert :: Tree -> W -> Tree
tInsert Leaf v = Node v Leaf Leaf
tInsert t@(Node v0 l r) v
  | v == v0   = t
  | v <  v0   = Node v0 (tInsert l v) r
  | otherwise = Node v0 l (tInsert r v)

-- Product pair tree.
data BTPair = LeafP | NodeP W W BTPair BTPair
data BTPairF r = LeafPF | NodePF W W r r

fmapPair :: (BTPair -> a) -> BTPair -> BTPairF a
fmapPair _ LeafP             = LeafPF
fmapPair f (NodeP a b lp rp) = NodePF a b (f lp) (f rp)

fmapPairE :: (a -> BTPair) -> BTPairF a -> BTPair
fmapPairE _ LeafPF             = LeafP
fmapPairE f (NodePF a b lp rp) = NodeP a b (f lp) (f rp)

pairUp :: Tree -> Tree -> BTPair
pairUp = curry (ana' fmapPairE coalg)
  where
    coalg :: (Tree, Tree) -> BTPairF (Tree, Tree)
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

mapMul3plus1Alg :: BTF Tree -> Tree
mapMul3plus1Alg LeafF         = Leaf
mapMul3plus1Alg (NodeF v l r) = Node (mul3plus1 v) l r

zipSumAddAlg, zipSumXorAlg :: BTPairF W -> W
zipSumAddAlg LeafPF             = 0
zipSumAddAlg (NodePF a b lr rr) = (a + b) + lr + rr
zipSumXorAlg LeafPF             = 0
zipSumXorAlg (NodePF a b lr rr) = (a `xorW` b) + lr + rr

keys :: Int -> W -> [W]
keys 0 _ = []
keys n s = let s' = lcgNext s in (s' .&. 0xFFFF) : keys (n - 1) s'

tLen :: Int
tLen = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta     = foldl tInsert Leaf (keys tLen sa)
          tb     = foldl tInsert Leaf (keys tLen sb)
          zp0    = Zip ta []
          zp1    = zModify mul3plus1 (zDownR (zDownL zp0))
          zp2    = zUp (zUp (zInsert 0xCAFEBABE zp1))
          zp3    = zDelete (zDownL zp2)
          (Zip foc _) = zTop zp3
          tm     = cata' fmapTree mapMul3plus1Alg foc
          sl     = cata' fmapTree foldlSumAlg tm 0
          sr     = cata' fmapTree foldrXorAlg tm
          ab     = pairUp tm tb
          za     = cata' fmapPair zipSumAddAlg ab
          zx     = cata' fmapPair zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
