-- BTreeMorph.hs — recursion-scheme variant of BTreePure.
--
--   F a r = 1 + W × r × r           (Leaf | Node v l r)
--
-- Every recursive op (map, fold, zipsum) routed through a
-- morphism — no Prelude fallbacks.  zipsum uses a product-functor
-- cata over BT × BT.

module BTreeMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data BT = Leaf | Node W BT BT

-- Algebras --------------------------------------------------

data BAlg r = BAlg
  { baLeaf :: r
  , baNode :: W -> r -> r -> r
  }

data BCoalg s = BCoalg
  { bcIsLeaf :: s -> Bool
  , bcVal    :: s -> W
  , bcLeft   :: s -> s
  , bcRight  :: s -> s
  }

data BPara r = BPara
  { bpLeaf :: r
  , bpNode :: W -> BT -> r -> BT -> r -> r
  }

bCata :: BAlg r -> BT -> r
bCata alg Leaf         = baLeaf alg
bCata alg (Node v l r) = baNode alg v (bCata alg l) (bCata alg r)

bAna :: BCoalg s -> s -> BT
bAna co s
  | bcIsLeaf co s = Leaf
  | otherwise     = Node (bcVal co s) (bAna co (bcLeft co s)) (bAna co (bcRight co s))

bHylo :: BAlg r -> BCoalg s -> s -> r
bHylo alg co s
  | bcIsLeaf co s = baLeaf alg
  | otherwise     = baNode alg (bcVal co s)
                              (bHylo alg co (bcLeft co s))
                              (bHylo alg co (bcRight co s))

bPara :: BPara r -> BT -> r
bPara alg Leaf         = bpLeaf alg
bPara alg (Node v l r) = bpNode alg v l (bPara alg l) r (bPara alg r)

-- ---- Product-functor cata over BT × BT -------------------

data BPairAlg r = BPairAlg
  { bpLeaf2 :: r                              -- either side a Leaf
  , bpNode2 :: W -> W -> r -> r -> r          -- pair-node step
  }

bPairCata :: BPairAlg r -> BT -> BT -> r
bPairCata alg Leaf _ = bpLeaf2 alg
bPairCata alg (Node _ _ _) Leaf = bpLeaf2 alg
bPairCata alg (Node a la ra) (Node b lb rb) =
  bpNode2 alg a b (bPairCata alg la lb) (bPairCata alg ra rb)

-- Algebras for the canonical workload ----------------------

-- foldr — direct cata, right-associated combine.
foldrSumAlg :: BAlg W
foldrSumAlg = BAlg (0::W) (\v lr rr -> v + lr + rr)

foldrXorAlg :: BAlg W
foldrXorAlg = BAlg (0::W) (\v lr rr -> v `xorW` lr `xorW` rr)

-- foldl — CPS cata: in-order, accumulator threaded through
-- (left subtree first, then root, then right subtree).
foldlSumAlg :: BAlg (W -> W)
foldlSumAlg = BAlg id (\v lk rk acc -> rk ((lk acc) + v))

foldlXorAlg :: BAlg (W -> W)
foldlXorAlg = BAlg id (\v lk rk acc -> rk ((lk acc) `xorW` v))

mapAlg :: (W -> W) -> BAlg BT
mapAlg f = BAlg Leaf (\v l r -> Node (f v) l r)

zipSumAlg :: (W -> W -> W) -> BPairAlg W
zipSumAlg f = BPairAlg (0::W) (\a b lr rr -> f a b + lr + rr)

-- Direct BST insert / delete (key-bit dispatch — not a clean cata).

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
          tm     = bCata (mapAlg mul3plus1) taD
          sl     = bCata foldlSumAlg tm 0     -- CPS-cata
          sr     = bCata foldrXorAlg tm       -- direct cata
          za     = bPairCata (zipSumAlg addW) tm tb
          zx     = bPairCata (zipSumAlg xorW) tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
