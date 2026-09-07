-- ZipperMorphX.hs — zipper over a binary tree (the recursive
-- focus lives in Fix BTF; navigation is non-recursive surface
-- around it).  All recursive ops on the focus tree route through
-- Morphx.cata.


module ZipperMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data BTF r = LeafF | NodeF W r r

type Tree = Fix BTF

data Dir = DL | DR
data Crumb = Crumb Dir W Tree
type Trail = [Crumb]
data Zip = Zip Tree Trail

-- Navigation (non-recursive) -------------------------------

zDownL, zDownR :: Zip -> Zip
zDownL z@(Zip (Fix LeafF) _) = z
zDownL (Zip (Fix (NodeF v l r)) ts) = Zip l (Crumb DL v r : ts)
zDownR z@(Zip (Fix LeafF) _) = z
zDownR (Zip (Fix (NodeF v l r)) ts) = Zip r (Crumb DR v l : ts)

zUp :: Zip -> Zip
zUp z@(Zip _ []) = z
zUp (Zip f (Crumb DL v sib : ts)) = Zip (Fix (NodeF v f sib)) ts
zUp (Zip f (Crumb DR v sib : ts)) = Zip (Fix (NodeF v sib f)) ts

zTop :: Zip -> Zip
zTop z@(Zip _ []) = z
zTop z            = zTop (zUp z)

zModify :: (W -> W) -> Zip -> Zip
zModify _ z@(Zip (Fix LeafF) _) = z
zModify f (Zip (Fix (NodeF v l r)) ts) = Zip (Fix (NodeF (f v) l r)) ts

zReplace :: Tree -> Zip -> Zip
zReplace t (Zip _ ts) = Zip t ts

zInsert :: W -> Zip -> Zip
zInsert v = zReplace (Fix (NodeF v (Fix LeafF) (Fix LeafF)))

zDelete :: Zip -> Zip
zDelete = zReplace (Fix LeafF)

-- Direct BST insert (key-dispatch).
tInsert :: Tree -> W -> Tree
tInsert (Fix LeafF) v = Fix (NodeF v (Fix LeafF) (Fix LeafF))
tInsert t@(Fix (NodeF v0 l r)) v
  | v == v0   = t
  | v <  v0   = Fix (NodeF v0 (tInsert l v) r)
  | otherwise = Fix (NodeF v0 l (tInsert r v))

-- Algebras --------------------------------------------------

foldrXorAlg :: Algebra BTF W
foldrXorAlg LeafF         = 0
foldrXorAlg (NodeF v l r) = v `xorW` l `xorW` r

foldlSumAlg :: Algebra BTF (W -> W)
foldlSumAlg LeafF           = id
foldlSumAlg (NodeF v lk rk) = \acc -> rk ((lk acc) + v)

mapMul3plus1Alg :: Algebra BTF Tree
mapMul3plus1Alg LeafF         = Fix LeafF
mapMul3plus1Alg (NodeF v l r) = Fix (NodeF (mul3plus1 v) l r)

-- Product functor.
data BTPairF r = LeafP | NodeP W W r r

pairUp :: Tree -> Tree -> Fix BTPairF
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
keys n s = let s' = lcgNext s in (s' .&. 0xFFFF) : keys (n - 1) s'

tLen :: Int
tLen = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta     = foldl tInsert (Fix LeafF) (keys tLen sa)
          tb     = foldl tInsert (Fix LeafF) (keys tLen sb)
          zp0    = Zip ta []
          zp1    = zModify mul3plus1 (zDownR (zDownL zp0))
          zp2    = zUp (zUp (zInsert 0xCAFEBABE zp1))
          zp3    = zDelete (zDownL zp2)
          (Zip foc _) = zTop zp3
          tm     = cata fmap mapMul3plus1Alg foc
          sl     = cata fmap foldlSumAlg tm 0
          sr     = cata fmap foldrXorAlg tm
          ab     = pairUp tm tb
          za     = cata fmap zipSumAddAlg ab
          zx     = cata fmap zipSumXorAlg ab
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor BTF where
  fmap _ LeafF = LeafF
  fmap f (NodeF a b c) = NodeF a (f b) (f c)

instance Functor BTPairF where
  fmap _ LeafP = LeafP
  fmap f (NodeP a b c d) = NodeP a b (f c) (f d)

