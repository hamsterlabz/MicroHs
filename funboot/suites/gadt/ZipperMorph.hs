-- ZipperMorph.hs — recursion-scheme variant of ZipperPure.
--
-- The recursion lives entirely in the focus tree; navigation
-- (z_down_*, z_up) is 1-step (not recursion-scheme).  Every
-- recursive op on the focus tree (map, fold, zipsum) is routed
-- through a morphism — no Prelude fallbacks.  zipsum uses a
-- product-functor cata over Tree × Tree.

module ZipperMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Tree = Leaf | Node W Tree Tree
data Dir  = DL | DR
data Crumb = Crumb Dir W Tree
type Trail = [Crumb]
data Zip = Zip Tree Trail

-- Navigation (not morphisms) -------------------------------

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

-- Algebras --------------------------------------------------

data TAlg r = TAlg { taLeaf :: r, taNode :: W -> r -> r -> r }
data TCoalg s = TCoalg
  { tcIsLeaf :: s -> Bool
  , tcVal    :: s -> W
  , tcLeft   :: s -> s
  , tcRight  :: s -> s
  }
data TPara r = TPara
  { tpLeaf :: r
  , tpNode :: W -> Tree -> r -> Tree -> r -> r
  }

-- Product-functor cata over Tree × Tree.
data TPairAlg r = TPairAlg
  { tpLeaf2 :: r
  , tpNode2 :: W -> W -> r -> r -> r
  }

tCata :: TAlg r -> Tree -> r
tCata alg Leaf         = taLeaf alg
tCata alg (Node v l r) = taNode alg v (tCata alg l) (tCata alg r)

tAna :: TCoalg s -> s -> Tree
tAna co s
  | tcIsLeaf co s = Leaf
  | otherwise     = Node (tcVal co s) (tAna co (tcLeft co s)) (tAna co (tcRight co s))

tHylo :: TAlg r -> TCoalg s -> s -> r
tHylo alg co s
  | tcIsLeaf co s = taLeaf alg
  | otherwise     = taNode alg (tcVal co s)
                              (tHylo alg co (tcLeft co s))
                              (tHylo alg co (tcRight co s))

tPara :: TPara r -> Tree -> r
tPara alg Leaf         = tpLeaf alg
tPara alg (Node v l r) = tpNode alg v l (tPara alg l) r (tPara alg r)

tPairCata :: TPairAlg r -> Tree -> Tree -> r
tPairCata alg Leaf _ = tpLeaf2 alg
tPairCata alg (Node _ _ _) Leaf = tpLeaf2 alg
tPairCata alg (Node a la ra) (Node b lb rb) =
  tpNode2 alg a b (tPairCata alg la lb) (tPairCata alg ra rb)

-- Algebras for the canonical workload ----------------------

-- foldr: direct cata.
foldrSumAlg :: TAlg W
foldrSumAlg = TAlg (0::W) (\v lr rr -> v + lr + rr)

foldrXorAlg :: TAlg W
foldrXorAlg = TAlg (0::W) (\v lr rr -> v `xorW` lr `xorW` rr)

-- foldl: CPS cata threading acc in-order (left then root then right).
foldlSumAlg :: TAlg (W -> W)
foldlSumAlg = TAlg id (\v lk rk acc -> rk ((lk acc) + v))

foldlXorAlg :: TAlg (W -> W)
foldlXorAlg = TAlg id (\v lk rk acc -> rk ((lk acc) `xorW` v))

mapAlg :: (W -> W) -> TAlg Tree
mapAlg f = TAlg Leaf (\v l r -> Node (f v) l r)

zipSumAlg :: (W -> W -> W) -> TPairAlg W
zipSumAlg f = TPairAlg (0::W) (\a b lr rr -> f a b + lr + rr)

-- Direct BST insert (key-dispatch, not a cata).
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
          tm     = tCata (mapAlg mul3plus1) foc
          sl     = tCata foldlSumAlg tm 0     -- CPS-cata
          sr     = tCata foldrXorAlg tm       -- direct cata
          za     = tPairCata (zipSumAlg addW) tm tb
          zx     = tPairCata (zipSumAlg xorW) tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
