-- ZipperMorphM.hs — zipper over a BST; focus-tree recursion goes
-- through Mendler combinators.  Navigation is 1-step (non-recursive).

module ZipperMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Tree = Leaf | Node W Tree Tree
data Dir  = DL | DR
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

foldrXor :: Tree -> W
foldrXor = mcata $ \rec t -> case t of
  Leaf       -> 0
  Node v l r -> v `xorW` rec l `xorW` rec r

foldlSum :: Tree -> W -> W
foldlSum = mcata $ \rec t acc -> case t of
  Leaf       -> acc
  Node v l r -> rec r (rec l acc + v)

mapMul3plus1 :: Tree -> Tree
mapMul3plus1 = mcata $ \rec t -> case t of
  Leaf       -> Leaf
  Node v l r -> Node (mul3plus1 v) (rec l) (rec r)

zipSum :: (W -> W -> W) -> Tree -> Tree -> W
zipSum f = mcata2 $ \rec a b -> case (a, b) of
  (Node va la ra, Node vb lb rb) -> f va vb + rec la lb + rec ra rb
  _                              -> 0

tInsert :: Tree -> W -> Tree
tInsert Leaf v = Node v Leaf Leaf
tInsert t@(Node v0 l r) v
  | v == v0   = t
  | v <  v0   = Node v0 (tInsert l v) r
  | otherwise = Node v0 l (tInsert r v)

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
          tm     = mapMul3plus1 foc
          sl     = foldlSum tm 0
          sr     = foldrXor tm
          za     = zipSum addW tm tb
          zx     = zipSum xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
