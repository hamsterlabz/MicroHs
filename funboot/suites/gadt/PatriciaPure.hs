-- PatriciaPure.hs — Okasaki Patricia trie / Data.IntMap.
--
-- Canonical workload (4 hashMix outputs): build / delete / map /
-- foldl / foldr / zipsum.  Matches patricia_pure / patricia_ninja /
-- patricia_morph (C) and PatriciaMorph (Hs).  Folds are over VALUES
-- ONLY (keys are ignored), zipsum is key-intersection.

module PatriciaPure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data PT = Empty | Leaf W W | Branch W W PT PT

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
branchingBit p0 p1 = highestBit (p0 `xor` p1)

maskOf :: W -> W -> W
maskOf k m = k .&. (m - 1)

zeroBit :: W -> W -> Bool
zeroBit k m = (k .&. m) == 0

matchPrefix :: W -> W -> W -> Bool
matchPrefix k p m = maskOf k m == p

-- Core ops --------------------------------------------------

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
      case ptDelete l k of
        Empty -> r
        nl    -> Branch m p nl r
  | otherwise =
      case ptDelete r k of
        Empty -> l
        nr    -> Branch m p l nr

ptLookup :: PT -> W -> Maybe W
ptLookup Empty _ = Nothing
ptLookup (Leaf k0 v) k
  | k0 == k   = Just v
  | otherwise = Nothing
ptLookup (Branch m _ l r) k =
  ptLookup (if zeroBit k m then l else r) k

-- Folds over VALUE ONLY.
ptFoldl :: (W -> W -> W) -> W -> PT -> W
ptFoldl _ z Empty            = z
ptFoldl f z (Leaf _ v)       = f z v
ptFoldl f z (Branch _ _ l r) = ptFoldl f (ptFoldl f z l) r

ptFoldr :: (W -> W -> W) -> W -> PT -> W
ptFoldr _ z Empty            = z
ptFoldr f z (Leaf _ v)       = f v z
ptFoldr f z (Branch _ _ l r) = ptFoldr f (ptFoldr f z r) l

ptMap :: (W -> W) -> PT -> PT
ptMap _ Empty            = Empty
ptMap f (Leaf k v)       = Leaf k (f v)
ptMap f (Branch m p l r) = Branch m p (ptMap f l) (ptMap f r)

-- Key-intersection zipsum.
ptZipSumWith :: (W -> W -> W) -> PT -> PT -> W
ptZipSumWith _ Empty _ = 0
ptZipSumWith f (Leaf k v) b =
  case ptLookup b k of
    Just v' -> f v v'
    Nothing -> 0
ptZipSumWith f (Branch _ _ l r) b =
  ptZipSumWith f l b + ptZipSumWith f r b

pairs :: Int -> W -> [(W, W)]
pairs 0 _ = []
pairs n s = let s1 = lcgNext s
                s2 = lcgNext s1
            in  (s1, s2) : pairs (n - 1) s2

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
          ta     = foldl ptDelete ta0 (map fst (take 4 ksA))
          tm     = ptMap mul3plus1 ta
          sl     = ptFoldl addW 0 tm
          sr     = ptFoldr xorW 0 tm
          za     = ptZipSumWith addW tm tb
          zx     = ptZipSumWith xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
