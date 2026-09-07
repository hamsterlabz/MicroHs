-- RoseTreeMorph.hs — recursion-scheme variant of RoseTreePure.
--
--   F a r = W × [r]
--
-- Every recursive op routed through a morphism — no Prelude
-- fallbacks.  zipsum uses a product-functor cata over Rose × Rose.

module RoseTreeMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Rose = Rose W [Rose]

-- Algebras --------------------------------------------------

data RAlg r = RAlg
  { raNode :: W -> [r] -> r
  }

data RCoalg s = RCoalg
  { rcIsLeaf   :: s -> Bool
  , rcVal      :: s -> W
  , rcKidSeeds :: s -> [s]
  }

data RPara r = RPara
  { rpNode :: W -> [(Rose, r)] -> r
  }

rCata :: RAlg r -> Rose -> r
rCata alg (Rose v ks) = raNode alg v (rCataMap alg ks)
  where
    rCataMap _   []     = []
    rCataMap alg' (k:ks') = rCata alg' k : rCataMap alg' ks'

rAna :: RCoalg s -> s -> Rose
rAna co s
  | rcIsLeaf co s = Rose (rcVal co s) []
  | otherwise     = Rose (rcVal co s) (rAnaMap co (rcKidSeeds co s))
  where
    rAnaMap _ []     = []
    rAnaMap c (s':ss) = rAna c s' : rAnaMap c ss

rHylo :: RAlg r -> RCoalg s -> s -> r
rHylo alg co s
  | rcIsLeaf co s = raNode alg (rcVal co s) []
  | otherwise     = raNode alg (rcVal co s) (rHyloMap alg co (rcKidSeeds co s))
  where
    rHyloMap _ _ [] = []
    rHyloMap a c (s':ss) = rHylo a c s' : rHyloMap a c ss

rPara :: RPara r -> Rose -> r
rPara alg (Rose v ks) = rpNode alg v (zipKid ks)
  where
    zipKid []     = []
    zipKid (k:ks') = (k, rPara alg k) : zipKid ks'

-- ---- Product-functor cata over Rose × Rose ---------------
--
--   F (a, b) r = (W × W × [r])     (paired-node step over aligned children)
--   plus a "mismatch" arm for when child counts differ.

data RPairAlg r = RPairAlg
  { rpNode2 :: W -> W -> [r] -> r
  }

rPairCata :: RPairAlg r -> Rose -> Rose -> r
rPairCata alg (Rose va kas) (Rose vb kbs) =
  rpNode2 alg va vb (zipKidsCata kas kbs)
  where
    zipKidsCata []     _      = []
    zipKidsCata (_:_)  []     = []
    zipKidsCata (a:as) (b:bs) = rPairCata alg a b : zipKidsCata as bs

-- Algebras for the canonical workload ----------------------

-- foldr: direct cata over the value-then-list-of-folded-children
-- shape; sum the recursive results right-to-left.
foldrSumAlg :: RAlg W
foldrSumAlg = RAlg (\v rs -> foldrRSum v rs)
  where foldrRSum z []     = z
        foldrRSum z (x:xs) = x + foldrRSum z xs

foldrXorAlg :: RAlg W
foldrXorAlg = RAlg (\v rs -> foldrRXor v rs)
  where foldrRXor z []     = z
        foldrRXor z (x:xs) = x `xorW` foldrRXor z xs

-- foldl: CPS cata; algebra step builds a left-fold-applying
-- continuation over (value, child-cont-list).
foldlSumAlg :: RAlg (W -> W)
foldlSumAlg = RAlg (\v ks acc -> foldlList (acc + v) ks)
  where foldlList acc []     = acc
        foldlList acc (k:ks) = foldlList (k acc) ks

foldlXorAlg :: RAlg (W -> W)
foldlXorAlg = RAlg (\v ks acc -> foldlListX (acc `xorW` v) ks)
  where foldlListX acc []     = acc
        foldlListX acc (k:ks) = foldlListX (k acc) ks

mapAlg :: (W -> W) -> RAlg Rose
mapAlg f = RAlg (\v ks -> Rose (f v) ks)

zipSumAlg :: (W -> W -> W) -> RPairAlg W
zipSumAlg f = RPairAlg (\va vb rs -> sumChildren (f va vb) rs)
  where sumChildren z []     = z
        sumChildren z (x:xs) = x + sumChildren z xs

-- Direct insert / delete (root-level, not a cata).
roseInsertChild :: Rose -> W -> Rose
roseInsertChild (Rose v ks) v' = Rose v (Rose v' [] : ks)

roseDeleteFirstChild :: Rose -> Rose
roseDeleteFirstChild (Rose v [])     = Rose v []
roseDeleteFirstChild (Rose v (_:ks)) = Rose v ks

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

insertCount :: Int
insertCount = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta0    = foldl roseInsertChild (Rose (lcgNext sa) []) (vals insertCount sa)
          tb     = foldl roseInsertChild (Rose (lcgNext sb) []) (vals insertCount sb)
          ta     = roseDeleteFirstChild (roseDeleteFirstChild ta0)
          tm     = rCata (mapAlg mul3plus1) ta
          sl     = rCata foldlSumAlg tm 0     -- CPS-cata
          sr     = rCata foldrXorAlg tm       -- direct cata
          za     = rPairCata (zipSumAlg addW) tm tb
          zx     = rPairCata (zipSumAlg xorW) tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
