-- PatriciaMorph.hs — recursion-scheme variant of PatriciaPure.
--
--   F a r = 1 + (W × W) + (W × W × r × r)
--           Empty | Leaf k v | Branch m p l r
--
-- Every recursive op routed through a morphism — no Prelude
-- fallbacks.  Lookup is itself a cata (returns Maybe W), and
-- zipsum is the natural composition: a cata over `a` that, at each
-- Leaf, invokes the lookup cata on `b`.

module PatriciaMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data PT = Empty | Leaf W W | Branch W W PT PT

-- Algebras --------------------------------------------------

data PAlg r = PAlg
  { paEmpty  :: r
  , paLeaf   :: W -> W -> r
  , paBranch :: W -> W -> r -> r -> r
  }

data PCoStep s
  = COEmpty
  | COLeaf   W W
  | COBranch W W s s

data PCoalg s = PCoalg { pcStep :: s -> PCoStep s }

data PPara r = PPara
  { ppEmpty  :: r
  , ppLeaf   :: W -> W -> r
  , ppBranch :: W -> W -> PT -> r -> PT -> r -> r
  }

pCata :: PAlg r -> PT -> r
pCata alg Empty            = paEmpty alg
pCata alg (Leaf k v)       = paLeaf alg k v
pCata alg (Branch m p l r) = paBranch alg m p (pCata alg l) (pCata alg r)

pAna :: PCoalg s -> s -> PT
pAna co s = case pcStep co s of
  COEmpty             -> Empty
  COLeaf k v          -> Leaf k v
  COBranch m p ls rs  -> Branch m p (pAna co ls) (pAna co rs)

pHylo :: PAlg r -> PCoalg s -> s -> r
pHylo alg co s = case pcStep co s of
  COEmpty             -> paEmpty alg
  COLeaf k v          -> paLeaf alg k v
  COBranch m p ls rs  -> paBranch alg m p (pHylo alg co ls) (pHylo alg co rs)

pPara :: PPara r -> PT -> r
pPara alg Empty            = ppEmpty alg
pPara alg (Leaf k v)       = ppLeaf alg k v
pPara alg (Branch m p l r) =
  ppBranch alg m p l (pPara alg l) r (pPara alg r)

-- Algebras for the canonical workload ----------------------

-- foldr: direct cata over values.
foldrSumAlg :: PAlg W
foldrSumAlg = PAlg (0::W) (\_ v -> v) (\_ _ a b -> a + b)

foldrXorAlg :: PAlg W
foldrXorAlg = PAlg (0::W) (\_ v -> v) (\_ _ a b -> a `xorW` b)

-- foldl: CPS cata threading acc left-to-right (in-order over leaves).
foldlSumAlg :: PAlg (W -> W)
foldlSumAlg = PAlg id (\_ v acc -> acc + v) (\_ _ lk rk acc -> rk (lk acc))

foldlXorAlg :: PAlg (W -> W)
foldlXorAlg = PAlg id (\_ v acc -> acc `xorW` v) (\_ _ lk rk acc -> rk (lk acc))

mapValAlg :: (W -> W) -> PAlg PT
mapValAlg f = PAlg Empty (\k v -> Leaf k (f v)) Branch

-- Lookup as a cata returning Maybe W.  In Haskell's lazy semantics
-- the unused branch result is never forced — same asymptotic cost
-- as a direct walk.
lookupAlg :: W -> PAlg (Maybe W)
lookupAlg query = PAlg
  { paEmpty  = Nothing
  , paLeaf   = \k v -> if k == query then Just v else Nothing
  , paBranch = \m _ lr rr -> if zeroBit query m then lr else rr
  }

ptLookup :: PT -> W -> Maybe W
ptLookup t k = pCata (lookupAlg k) t

-- Key-intersection zipsum: cata over `a` calling cata-lookup on `b`.
zipSumAlg :: (W -> W -> W) -> PT -> PAlg W
zipSumAlg f b = PAlg
  { paEmpty  = (0::W)
  , paLeaf   = \k v -> case ptLookup b k of Just v' -> f v v'; Nothing -> 0
  , paBranch = \_ _ lr rr -> lr + rr
  }

ptZipSum :: (W -> W -> W) -> PT -> PT -> W
ptZipSum f a b = pCata (zipSumAlg f b) a

-- Bit helpers + direct insert/delete (key-bit dispatch, not catas).

highestBit :: W -> W
highestBit x0 =
  let x1 = x0 .|. (x0 `shiftR` 1)
      x2 = x1 .|. (x1 `shiftR` 2)
      x3 = x2 .|. (x2 `shiftR` 4)
      x4 = x3 .|. (x3 `shiftR` 8)
      x5 = x4 .|. (x4 `shiftR` 16)
  in  (x5 + 1) `shiftR` 1

branchingBit :: W -> W -> W
branchingBit a b = highestBit (a `xor` b)

maskOf :: W -> W -> W
maskOf k m = k .&. (m - 1)

zeroBit :: W -> W -> Bool
zeroBit k m = (k .&. m) == 0

matchPrefix :: W -> W -> W -> Bool
matchPrefix k p m = maskOf k m == p

ptInsert :: PT -> W -> W -> PT
ptInsert Empty k v = Leaf k v
ptInsert t@(Leaf k0 _) k v
  | k0 == k   = Leaf k v
  | otherwise =
      let m = branchingBit k0 k; nl = Leaf k v
      in  if zeroBit k m then Branch m (maskOf k m) nl t
                         else Branch m (maskOf k m) t  nl
ptInsert t@(Branch m p l r) k v
  | not (matchPrefix k p m) =
      let m2 = branchingBit k p; nl = Leaf k v
      in  if zeroBit k m2 then Branch m2 (maskOf k m2) nl t
                          else Branch m2 (maskOf k m2) t  nl
  | zeroBit k m = Branch m p (ptInsert l k v) r
  | otherwise   = Branch m p l (ptInsert r k v)

ptDelete :: PT -> W -> PT
ptDelete Empty _ = Empty
ptDelete (Leaf k0 v) k
  | k0 == k   = Empty
  | otherwise = Leaf k0 v
ptDelete t@(Branch m p l r) k
  | not (matchPrefix k p m) = t
  | zeroBit k m =
      case ptDelete l k of Empty -> r; nl -> Branch m p nl r
  | otherwise =
      case ptDelete r k of Empty -> l; nr -> Branch m p l nr

pairs :: Int -> W -> [(W, W)]
pairs 0 _ = []
pairs n s = let s1 = lcgNext s; s2 = lcgNext s1 in (s1, s2) : pairs (n - 1) s2

keyCount :: Int
keyCount = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ksA    = pairs keyCount sa
          ksB    = pairs keyCount sb
          ta0    = foldl (\t (k, v) -> ptInsert t k v) Empty ksA
          tb     = foldl (\t (k, v) -> ptInsert t k v) Empty ksB
          dels   = take 4 [k | (k, _) <- ksA]
          ta     = foldl ptDelete ta0 dels
          tm     = pCata (mapValAlg mul3plus1) ta
          sl     = pCata foldlSumAlg tm 0     -- CPS-cata
          sr     = pCata foldrXorAlg tm       -- direct cata
          za     = ptZipSum addW tm tb
          zx     = ptZipSum xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
