-- PatriciaMorphM.hs — Patricia trie via Mendler-style.

module PatriciaMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data PT = Empty | Leaf W W | Branch W W PT PT

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
  | zeroBit k m = case ptDelete l k of
      Empty -> r
      nl    -> Branch m p nl r
  | otherwise = case ptDelete r k of
      Empty -> l
      nr    -> Branch m p l nr

ptLookup :: PT -> W -> Maybe W
ptLookup t0 k = mcata go t0
  where
    go _   Empty = Nothing
    go _   (Leaf k0 v)
      | k0 == k   = Just v
      | otherwise = Nothing
    go rec (Branch m _ l r) = if zeroBit k m then rec l else rec r

foldrXor :: PT -> W
foldrXor = mcata $ \rec t -> case t of
  Empty          -> 0
  Leaf _ v       -> v
  Branch _ _ l r -> rec l `xorW` rec r

foldlSum :: PT -> W -> W
foldlSum = mcata $ \rec t acc -> case t of
  Empty          -> acc
  Leaf _ v       -> acc + v
  Branch _ _ l r -> rec r (rec l acc)

mapMul3plus1 :: PT -> PT
mapMul3plus1 = mcata $ \rec t -> case t of
  Empty          -> Empty
  Leaf k v       -> Leaf k (mul3plus1 v)
  Branch m p l r -> Branch m p (rec l) (rec r)

zipSum :: (W -> W -> W) -> PT -> PT -> W
zipSum f tA tB = mcata go tA
  where
    go _   Empty            = (0::W)
    go _   (Leaf k v)       = case ptLookup tB k of
                                Just v' -> f v v'
                                Nothing -> 0
    go rec (Branch _ _ l r) = rec l + rec r

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
          tm     = mapMul3plus1 ta
          sl     = foldlSum tm 0
          sr     = foldrXor tm
          za     = zipSum addW tm tb
          zx     = zipSum xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
