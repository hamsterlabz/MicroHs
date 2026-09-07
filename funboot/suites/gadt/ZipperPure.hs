-- ZipperPure.hs — Huet zipper over a binary tree.
--
-- Canonical workload (4 hashMix outputs): build ta+tb / navigate+
-- edit ta / map focus / foldl / foldr / zipsum.  Matches
-- zipper_pure / zipper_ninja / zipper_morph (C) and ZipperMorph
-- (Hs).

module ZipperPure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Tree = Leaf | Node W Tree Tree

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

-- Tree ops --------------------------------------------------

tInsert :: Tree -> W -> Tree
tInsert Leaf v = Node v Leaf Leaf
tInsert t@(Node v0 l r) v
  | v == v0   = t
  | v <  v0   = Node v0 (tInsert l v) r
  | otherwise = Node v0 l (tInsert r v)

tFoldl :: (W -> W -> W) -> W -> Tree -> W
tFoldl _ z Leaf         = z
tFoldl f z (Node v l r) = tFoldl f (f (tFoldl f z l) v) r

tFoldr :: (W -> W -> W) -> W -> Tree -> W
tFoldr _ z Leaf         = z
tFoldr f z (Node v l r) = tFoldr f (f v (tFoldr f z r)) l

tMap :: (W -> W) -> Tree -> Tree
tMap _ Leaf         = Leaf
tMap f (Node v l r) = Node (f v) (tMap f l) (tMap f r)

-- In-order flatten + positional pair-walk zipsum.
tToList :: Tree -> [W]
tToList Leaf         = []
tToList (Node v l r) = tToList l ++ [v] ++ tToList r

tZipSumWith :: (W -> W -> W) -> Tree -> Tree -> W
tZipSumWith f a b = sum (zipWith f (tToList a) (tToList b))

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
          tm     = tMap mul3plus1 foc
          sl     = tFoldl addW 0 tm
          sr     = tFoldr xorW 0 tm
          za     = tZipSumWith addW tm tb
          zx     = tZipSumWith xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
