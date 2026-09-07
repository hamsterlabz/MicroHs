-- QuadTree2Pure.hs — lean variant of QuadTreePure.
--
-- Same 4-way addressed path-copy tree and the SAME computation/answer as
-- QuadTreePure, but written to match the C peer (quadtree_pure.c) structurally:
-- insert/delete destructure and rebuild the QtNode DIRECTLY (one node alloc per
-- level), instead of round-tripping through an intermediate `Q4` 4-tuple
-- (QtNode -> Q4 -> QtNode, ~3 allocs/level); and the folds combine the four
-- children directly instead of via an [a,b,c,d] list. No algorithmic change —
-- the Q4 layer carried no information the four QtNode fields don't — so the
-- result is identical; only the reduction/allocation count drops.

module QuadTree2Pure where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data QT = QtEmpty | QtNode W QT QT QT QT

qtDepth :: Int
qtDepth = 4

qtInsertAt :: QT -> W -> Int -> W -> QT
qtInsertAt t _addr 0 v =
  case t of QtNode _ a b c d -> QtNode v a b c d
            QtEmpty          -> QtNode v QtEmpty QtEmpty QtEmpty QtEmpty
qtInsertAt t addr dl v =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
  in case t of
       QtNode cv a b c d -> case q of
         0 -> QtNode cv (qtInsertAt a addr (dl-1) v) b c d
         1 -> QtNode cv a (qtInsertAt b addr (dl-1) v) c d
         2 -> QtNode cv a b (qtInsertAt c addr (dl-1) v) d
         _ -> QtNode cv a b c (qtInsertAt d addr (dl-1) v)
       QtEmpty -> case q of
         0 -> QtNode 0 (qtInsertAt QtEmpty addr (dl-1) v) QtEmpty QtEmpty QtEmpty
         1 -> QtNode 0 QtEmpty (qtInsertAt QtEmpty addr (dl-1) v) QtEmpty QtEmpty
         2 -> QtNode 0 QtEmpty QtEmpty (qtInsertAt QtEmpty addr (dl-1) v) QtEmpty
         _ -> QtNode 0 QtEmpty QtEmpty QtEmpty (qtInsertAt QtEmpty addr (dl-1) v)

qtInsert :: QT -> W -> W -> QT
qtInsert t addr v = qtInsertAt t addr qtDepth v

qtDeleteAt :: QT -> W -> Int -> QT
qtDeleteAt QtEmpty _ _ = QtEmpty
qtDeleteAt t _addr 0   = case t of QtNode _ a b c d -> QtNode 0 a b c d
qtDeleteAt t addr dl =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
  in case t of
       QtNode cv a b c d -> case q of
         0 -> QtNode cv (qtDeleteAt a addr (dl-1)) b c d
         1 -> QtNode cv a (qtDeleteAt b addr (dl-1)) c d
         2 -> QtNode cv a b (qtDeleteAt c addr (dl-1)) d
         _ -> QtNode cv a b c (qtDeleteAt d addr (dl-1))

qtDelete :: QT -> W -> QT
qtDelete t addr = qtDeleteAt t addr qtDepth

-- direct 4-way folds (no [a,b,c,d] list); SAME traversal order as QuadTreePure.
qtFoldl :: (W -> W -> W) -> W -> QT -> W
qtFoldl _ z QtEmpty            = z
qtFoldl f z (QtNode v a b c d) =
  qtFoldl f (qtFoldl f (qtFoldl f (qtFoldl f (f z v) a) b) c) d

qtFoldr :: (W -> W -> W) -> W -> QT -> W
qtFoldr _ z QtEmpty            = z
qtFoldr f z (QtNode v a b c d) =
  f v (qtFoldr f (qtFoldr f (qtFoldr f (qtFoldr f z d) c) b) a)

qtMap :: (W -> W) -> QT -> QT
qtMap _ QtEmpty            = QtEmpty
qtMap f (QtNode v a b c d) =
  QtNode (f v) (qtMap f a) (qtMap f b) (qtMap f c) (qtMap f d)

qtZipSumWith :: (W -> W -> W) -> QT -> QT -> W
qtZipSumWith _ QtEmpty _                  = 0
qtZipSumWith _ (QtNode _ _ _ _ _) QtEmpty = 0
qtZipSumWith f (QtNode va a1 a2 a3 a4) (QtNode vb b1 b2 b3 b4) =
  f va vb
  + qtZipSumWith f a1 b1 + qtZipSumWith f a2 b2
  + qtZipSumWith f a3 b3 + qtZipSumWith f a4 b4

insertCount :: Int
insertCount = 24

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
