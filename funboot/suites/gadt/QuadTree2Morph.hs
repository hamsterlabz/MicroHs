-- QuadTree2Morph.hs — lean variant of QuadTreeMorph.
--
-- KEEPS the recursion-scheme character of QuadTreeMorph (every fold/map/zipsum
-- still routed through the cata `qCata`/`qPairCata` over the F-algebra) — that
-- overhead is the POINT of the Morph variant and is left intact. The ONLY change
-- is in insert/delete, which are address-bit dispatch (not a cata): the original
-- binds a 5-tuple `(va,ka,kb,kc,kd) = case t of …` per tree level (an accidental
-- allocation, the analog of QuadTreePure's `Q4` round-trip), where the C peer
-- indexes `kid[q]` directly. Here they destructure/rebuild the QtNode directly
-- via nested `case`, one node alloc per level. Same computation, same answer.

module QuadTree2Morph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data QT = QtEmpty | QtNode W QT QT QT QT

qtDepth :: Int
qtDepth = 4

-- Algebras --------------------------------------------------

data QAlg r = QAlg
  { qaEmpty :: r
  , qaNode  :: W -> r -> r -> r -> r -> r
  }

data QCoalg s = QCoalg
  { qcIsEmpty :: s -> Bool
  , qcVal     :: s -> W
  , qcKid     :: s -> Int -> s
  }

data QPara r = QPara
  { qpEmpty :: r
  , qpNode  :: W -> QT -> r -> QT -> r -> QT -> r -> QT -> r -> r
  }

qCata :: QAlg r -> QT -> r
qCata alg QtEmpty            = qaEmpty alg
qCata alg (QtNode v a b c d) =
  qaNode alg v (qCata alg a) (qCata alg b) (qCata alg c) (qCata alg d)

qAna :: QCoalg s -> s -> QT
qAna co s
  | qcIsEmpty co s = QtEmpty
  | otherwise      =
      QtNode (qcVal co s)
             (qAna co (qcKid co s 0)) (qAna co (qcKid co s 1))
             (qAna co (qcKid co s 2)) (qAna co (qcKid co s 3))

qHylo :: QAlg r -> QCoalg s -> s -> r
qHylo alg co s
  | qcIsEmpty co s = qaEmpty alg
  | otherwise      =
      qaNode alg (qcVal co s)
             (qHylo alg co (qcKid co s 0)) (qHylo alg co (qcKid co s 1))
             (qHylo alg co (qcKid co s 2)) (qHylo alg co (qcKid co s 3))

qPara :: QPara r -> QT -> r
qPara alg QtEmpty            = qpEmpty alg
qPara alg (QtNode v a b c d) =
  qpNode alg v
         a (qPara alg a) b (qPara alg b)
         c (qPara alg c) d (qPara alg d)

-- ---- Product-functor cata over QT × QT -------------------

data QPairAlg r = QPairAlg
  { qpEmpty2 :: r
  , qpNode2  :: W -> W -> r -> r -> r -> r -> r
  }

qPairCata :: QPairAlg r -> QT -> QT -> r
qPairCata alg QtEmpty _ = qpEmpty2 alg
qPairCata alg (QtNode _ _ _ _ _) QtEmpty = qpEmpty2 alg
qPairCata alg (QtNode va a1 a2 a3 a4) (QtNode vb b1 b2 b3 b4) =
  qpNode2 alg va vb
          (qPairCata alg a1 b1) (qPairCata alg a2 b2)
          (qPairCata alg a3 b3) (qPairCata alg a4 b4)

-- Algebras for the canonical workload ----------------------

-- foldr: direct cata.
foldrSumAlg :: QAlg W
foldrSumAlg = QAlg (0::W) (\v a b c d -> v + a + b + c + d)

foldrXorAlg :: QAlg W
foldrXorAlg = QAlg (0::W) (\v a b c d -> v `xorW` a `xorW` b `xorW` c `xorW` d)

-- foldl: CPS cata threading acc left-to-right (NW → NE → SW → SE).
foldlSumAlg :: QAlg (W -> W)
foldlSumAlg = QAlg id (\v ka kb kc kd acc -> kd (kc (kb (ka (acc + v)))))

foldlXorAlg :: QAlg (W -> W)
foldlXorAlg = QAlg id (\v ka kb kc kd acc -> kd (kc (kb (ka (acc `xorW` v)))))

mapAlg :: (W -> W) -> QAlg QT
mapAlg f = QAlg QtEmpty (\v a b c d -> QtNode (f v) a b c d)

zipSumAlg :: (W -> W -> W) -> QPairAlg W
zipSumAlg f = QPairAlg (0::W) (\va vb a b c d -> f va vb + a + b + c + d)

-- Direct insert / delete (address-bit dispatch — not a clean cata). Destructure
-- and rebuild the QtNode directly (one alloc/level), no 5-tuple round-trip.

qtInsert :: QT -> W -> Int -> W -> QT
qtInsert _ _ 0 v = QtNode v QtEmpty QtEmpty QtEmpty QtEmpty
qtInsert t addr dl v =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
  in case t of
       QtNode va a b c d -> case q of
         0 -> QtNode va (qtInsert a addr (dl-1) v) b c d
         1 -> QtNode va a (qtInsert b addr (dl-1) v) c d
         2 -> QtNode va a b (qtInsert c addr (dl-1) v) d
         _ -> QtNode va a b c (qtInsert d addr (dl-1) v)
       QtEmpty -> case q of
         0 -> QtNode 0 (qtInsert QtEmpty addr (dl-1) v) QtEmpty QtEmpty QtEmpty
         1 -> QtNode 0 QtEmpty (qtInsert QtEmpty addr (dl-1) v) QtEmpty QtEmpty
         2 -> QtNode 0 QtEmpty QtEmpty (qtInsert QtEmpty addr (dl-1) v) QtEmpty
         _ -> QtNode 0 QtEmpty QtEmpty QtEmpty (qtInsert QtEmpty addr (dl-1) v)

qtDelete :: QT -> W -> Int -> QT
qtDelete QtEmpty _ _ = QtEmpty
qtDelete (QtNode _ a b c d) _ 0 = QtNode 0 a b c d
qtDelete t addr dl =
  let q = fromIntegral $ (addr `shiftR` ((dl - 1) * 2)) .&. 0x3
  in case t of
       QtNode va a b c d -> case q of
         0 -> QtNode va (qtDelete a addr (dl-1)) b c d
         1 -> QtNode va a (qtDelete b addr (dl-1)) c d
         2 -> QtNode va a b (qtDelete c addr (dl-1)) d
         _ -> QtNode va a b c (qtDelete d addr (dl-1))
       QtEmpty -> QtEmpty

mkOps :: Int -> W -> [(W, W)]
mkOps 0 _ = []
mkOps n s = let s1 = lcgNext s
                a  = s1 .&. 0xFF
                s2 = lcgNext s1
            in  (a, s2) : mkOps (n - 1) s2

insertCount :: Int
insertCount = 24

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          insA   = mkOps insertCount sa
          insB   = mkOps insertCount sb
          ta0    = foldl (\t (a, v) -> qtInsert t a qtDepth v) QtEmpty insA
          tb     = foldl (\t (a, v) -> qtInsert t a qtDepth v) QtEmpty insB
          dels   = [a | (a, _) <- mkOps 4 (sa `xorW` 0xCAFE)]
          ta     = foldl (\t a -> qtDelete t a qtDepth) ta0 dels
          tm     = qCata (mapAlg mul3plus1) ta
          sl     = qCata foldlSumAlg tm 0     -- CPS-cata
          sr     = qCata foldrXorAlg tm       -- direct cata
          za     = qPairCata (zipSumAlg addW) tm tb
          zx     = qPairCata (zipSumAlg xorW) tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
