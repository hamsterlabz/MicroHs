-- PatriciaMorphX.hs — Patricia trie via Morphx merged-fmap variant.

module PatriciaMorphX (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data PT = Empty | Leaf W W | Branch W W PT PT
data PTF r = EmptyF | LeafF W W | BranchF W W r r

fmapPT :: (PT -> a) -> PT -> PTF a
fmapPT _ Empty            = EmptyF
fmapPT _ (Leaf k v)       = LeafF k v
fmapPT f (Branch m p l r) = BranchF m p (f l) (f r)
{-# INLINE fmapPT #-}

fmapPTE :: (a -> PT) -> PTF a -> PT
fmapPTE _ EmptyF            = Empty
fmapPTE _ (LeafF k v)       = Leaf k v
fmapPTE f (BranchF m p l r) = Branch m p (f l) (f r)
{-# INLINE fmapPTE #-}

-- Bit helpers ---------------------------------------------

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

-- Direct insert / delete.
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
  | zeroBit k m = case ptDelete l k of
      Empty -> r
      nl    -> Branch m p nl r
  | otherwise = case ptDelete r k of
      Empty -> l
      nr    -> Branch m p l nr

-- Algebras --------------------------------------------------

lookupAlg :: W -> PTF (Maybe W) -> Maybe W
lookupAlg _ EmptyF = Nothing
lookupAlg q (LeafF k v)
  | k == q    = Just v
  | otherwise = Nothing
lookupAlg q (BranchF m _ lr rr) = if zeroBit q m then lr else rr

ptLookup :: PT -> W -> Maybe W
ptLookup t k = cata' fmapPT (lookupAlg k) t

foldrXorAlg :: PTF W -> W
foldrXorAlg EmptyF              = 0
foldrXorAlg (LeafF _ v)         = v
foldrXorAlg (BranchF _ _ l r)   = l `xorW` r

foldlSumAlg :: PTF (W -> W) -> (W -> W)
foldlSumAlg EmptyF              = id
foldlSumAlg (LeafF _ v)         = \acc -> acc + v
foldlSumAlg (BranchF _ _ lk rk) = \acc -> rk (lk acc)

mapMul3plus1Alg :: PTF PT -> PT
mapMul3plus1Alg EmptyF            = Empty
mapMul3plus1Alg (LeafF k v)       = Leaf k (mul3plus1 v)
mapMul3plus1Alg (BranchF m p l r) = Branch m p l r

zipSumAddAlg :: PT -> PTF W -> W
zipSumAddAlg _ EmptyF             = 0
zipSumAddAlg b (LeafF k v)        = case ptLookup b k of Just v' -> v + v'; Nothing -> 0
zipSumAddAlg _ (BranchF _ _ l r)  = l + r

zipSumXorAlg :: PT -> PTF W -> W
zipSumXorAlg _ EmptyF             = 0
zipSumXorAlg b (LeafF k v)        = case ptLookup b k of Just v' -> v `xorW` v'; Nothing -> 0
zipSumXorAlg _ (BranchF _ _ l r)  = l + r

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
          tm     = cata' fmapPT mapMul3plus1Alg ta
          sl     = cata' fmapPT foldlSumAlg tm 0
          sr     = cata' fmapPT foldrXorAlg tm
          za     = cata' fmapPT (zipSumAddAlg tb) tm
          zx     = cata' fmapPT (zipSumXorAlg tb) tm
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
