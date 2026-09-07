-- QuadTreePure.hs — Haskell translation of quadtree_pure.c.
--
-- 4-way addressed tree.  Each node has a value + four children
-- indexed by (NW=0, NE=1, SW=2, SE=3).  8-bit address (MSB-first)
-- means depth 4.  Path-copying mutation.

module QuadTreePure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data QT = QtEmpty | QtNode W QT QT QT QT

qtDepth :: Int
qtDepth = 4

-- ks (kw, ne, sw, se) shows the kids of a node — used everywhere as
-- a uniform 4-tuple.
data Q4 a = Q4 a a a a

q4FromQT :: QT -> Q4 QT
q4FromQT QtEmpty            = Q4 QtEmpty QtEmpty QtEmpty QtEmpty
q4FromQT (QtNode _ a b c d) = Q4 a b c d

q4Idx :: Q4 a -> Int -> a
q4Idx (Q4 a _ _ _) 0 = a
q4Idx (Q4 _ b _ _) 1 = b
q4Idx (Q4 _ _ c _) 2 = c
q4Idx (Q4 _ _ _ d) _ = d

q4Put :: Q4 a -> Int -> a -> Q4 a
q4Put (Q4 _ b c d) 0 x = Q4 x b c d
q4Put (Q4 a _ c d) 1 x = Q4 a x c d
q4Put (Q4 a b _ d) 2 x = Q4 a b x d
q4Put (Q4 a b c _) _ x = Q4 a b c x

q4ToList :: Q4 a -> [a]
q4ToList (Q4 a b c d) = [a, b, c, d]

qtInsertAt :: QT -> W -> Int -> W -> QT
qtInsertAt t _addr 0 v =
  let Q4 a b c d = q4FromQT t in QtNode v a b c d
qtInsertAt t addr dl v =
  let q       = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
      kids    = q4FromQT t
      kid     = q4Idx kids q
      newKid  = qtInsertAt kid addr (dl - 1) v
      Q4 a b c d = q4Put kids q newKid
      currentV = case t of QtNode v0 _ _ _ _ -> v0; QtEmpty -> 0
  in  QtNode currentV a b c d

qtInsert :: QT -> W -> W -> QT
qtInsert t addr v = qtInsertAt t addr qtDepth v

qtDeleteAt :: QT -> W -> Int -> QT
qtDeleteAt QtEmpty _ _      = QtEmpty
qtDeleteAt t _addr 0        =
  let Q4 a b c d = q4FromQT t in QtNode 0 a b c d
qtDeleteAt t addr dl        =
  let q       = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
      kids    = q4FromQT t
      newKid  = qtDeleteAt (q4Idx kids q) addr (dl - 1)
      Q4 a b c d = q4Put kids q newKid
      currentV = case t of QtNode v0 _ _ _ _ -> v0; QtEmpty -> 0
  in  QtNode currentV a b c d

qtDelete :: QT -> W -> QT
qtDelete t addr = qtDeleteAt t addr qtDepth

qtFoldl :: (W -> W -> W) -> W -> QT -> W
qtFoldl _ z QtEmpty            = z
qtFoldl f z (QtNode v a b c d) =
  foldl (qtFoldl f) (f z v) [a, b, c, d]

qtFoldr :: (W -> W -> W) -> W -> QT -> W
qtFoldr _ z QtEmpty            = z
qtFoldr f z (QtNode v a b c d) =
  f v (foldr (flip (qtFoldr f)) z [a, b, c, d])

qtMap :: (W -> W) -> QT -> QT
qtMap _ QtEmpty            = QtEmpty
qtMap f (QtNode v a b c d) =
  QtNode (f v) (qtMap f a) (qtMap f b) (qtMap f c) (qtMap f d)

qtZipSumWith :: (W -> W -> W) -> QT -> QT -> W
qtZipSumWith _ QtEmpty _              = 0
qtZipSumWith _ (QtNode _ _ _ _ _) QtEmpty = 0
qtZipSumWith f (QtNode va a1 a2 a3 a4) (QtNode vb b1 b2 b3 b4) =
  f va vb
  + qtZipSumWith f a1 b1 + qtZipSumWith f a2 b2
  + qtZipSumWith f a3 b3 + qtZipSumWith f a4 b4

insertCount :: Int
insertCount = 24

-- Build a (addr, value) stream of length n, threading the LCG.
mkOps :: Int -> W -> [(W, W)]
mkOps 0 _ = []
mkOps n s =
  let s1 = lcgNext s
      a  = s1 .&. 0xFF
      s2 = lcgNext s1
  in  (a, s2) : mkOps (n - 1) s2

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          insA   = mkOps insertCount sa
          insB   = mkOps insertCount sb
          ta0    = foldl (\t (a, v) -> qtInsert t a v) QtEmpty insA
          tb     = foldl (\t (a, v) -> qtInsert t a v) QtEmpty insB
          dels   = take 4 [a | (a, _) <- mkOps 4 (sa `xorW` 0xCAFE)]
          ta     = foldl qtDelete ta0 dels
          tm     = qtMap mul3plus1 ta
          sl     = qtFoldl addW 0 tm
          sr     = qtFoldr xorW 0 tm
          za     = qtZipSumWith addW tm tb
          zx     = qtZipSumWith xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
