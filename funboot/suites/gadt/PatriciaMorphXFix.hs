-- PatriciaMorphX.hs — Patricia trie via Morphx generic F-algebra.


module PatriciaMorphXFix (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Functor
import Data.Records

import Common
import Morphx

data PTF r = EmptyF | LeafF W W | BranchF W W r r

type PT = Fix PTF

-- Bit helpers ----------------------------------------------

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

-- Direct insert / delete (key-bit dispatch; not a clean cata).
ptInsert :: PT -> W -> W -> PT
ptInsert (Fix EmptyF) k v = Fix (LeafF k v)
ptInsert t@(Fix (LeafF k0 _)) k v
  | k0 == k   = Fix (LeafF k v)
  | otherwise =
      let m = branchingBit k0 k; nl = Fix (LeafF k v)
      in  if zeroBit k m then Fix (BranchF m (maskOf k m) nl t)
                         else Fix (BranchF m (maskOf k m) t  nl)
ptInsert t@(Fix (BranchF m p l r)) k v
  | not (matchPrefix k p m) =
      let m2 = branchingBit k p; nl = Fix (LeafF k v)
      in  if zeroBit k m2 then Fix (BranchF m2 (maskOf k m2) nl t)
                          else Fix (BranchF m2 (maskOf k m2) t  nl)
  | zeroBit k m = Fix (BranchF m p (ptInsert l k v) r)
  | otherwise   = Fix (BranchF m p l (ptInsert r k v))

ptDelete :: PT -> W -> PT
ptDelete (Fix EmptyF) _ = Fix EmptyF
ptDelete (Fix (LeafF k0 v)) k
  | k0 == k   = Fix EmptyF
  | otherwise = Fix (LeafF k0 v)
ptDelete t@(Fix (BranchF m p l r)) k
  | not (matchPrefix k p m) = t
  | zeroBit k m = case unFix (ptDelete l k) of
      EmptyF -> r
      _      -> Fix (BranchF m p (ptDelete l k) r)
  | otherwise = case unFix (ptDelete r k) of
      EmptyF -> l
      _      -> Fix (BranchF m p l (ptDelete r k))

-- Algebras --------------------------------------------------

-- Lookup as a cata returning Maybe W.
lookupAlg :: W -> Algebra PTF (Maybe W)
lookupAlg q EmptyF = Nothing
lookupAlg q (LeafF k v)
  | k == q    = Just v
  | otherwise = Nothing
lookupAlg q (BranchF m _ lr rr) = if zeroBit q m then lr else rr

ptLookup :: PT -> W -> Maybe W
ptLookup t k = cata fmap (lookupAlg k) t

foldrXorAlg :: Algebra PTF W
foldrXorAlg EmptyF              = 0
foldrXorAlg (LeafF _ v)         = v
foldrXorAlg (BranchF _ _ l r)   = l `xorW` r

-- CPS foldl over leaves' values.
foldlSumAlg :: Algebra PTF (W -> W)
foldlSumAlg EmptyF             = id
foldlSumAlg (LeafF _ v)        = \acc -> acc + v
foldlSumAlg (BranchF _ _ lk rk) = \acc -> rk (lk acc)

mapMul3plus1Alg :: Algebra PTF PT
mapMul3plus1Alg EmptyF            = Fix EmptyF
mapMul3plus1Alg (LeafF k v)       = Fix (LeafF k (mul3plus1 v))
mapMul3plus1Alg (BranchF m p l r) = Fix (BranchF m p l r)

-- Key-intersection zipsum: cata over a, calling lookup cata on b.
zipSumAddAlg :: PT -> Algebra PTF W
zipSumAddAlg _ EmptyF        = 0
zipSumAddAlg b (LeafF k v)   = case ptLookup b k of Just v' -> v + v'; Nothing -> 0
zipSumAddAlg _ (BranchF _ _ l r) = l + r

zipSumXorAlg :: PT -> Algebra PTF W
zipSumXorAlg _ EmptyF        = 0
zipSumXorAlg b (LeafF k v)   = case ptLookup b k of Just v' -> v `xorW` v'; Nothing -> 0
zipSumXorAlg _ (BranchF _ _ l r) = l + r

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
          ta0    = foldl (\t (k, v) -> ptInsert t k v) (Fix EmptyF) ksA
          tb     = foldl (\t (k, v) -> ptInsert t k v) (Fix EmptyF) ksB
          dels   = take 4 [k | (k, _) <- ksA]
          ta     = foldl ptDelete ta0 dels
          tm     = cata fmap mapMul3plus1Alg ta
          sl     = cata fmap foldlSumAlg tm 0
          sr     = cata fmap foldrXorAlg tm
          za     = cata fmap (zipSumAddAlg tb) tm
          zx     = cata fmap (zipSumXorAlg tb) tm
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4

instance Functor PTF where
  fmap _ EmptyF = EmptyF
  fmap _ (LeafF a b) = LeafF a b
  fmap f (BranchF a b c d) = BranchF a b (f c) (f d)

