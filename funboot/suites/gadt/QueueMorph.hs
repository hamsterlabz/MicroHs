-- QueueMorph.hs — recursion-scheme variant of QueuePure.
--
-- Queue is two lists; the natural functor we expose is the LIST
-- functor over W.  Morphisms are defined on the cell-list
-- (= qToList q) and lifted to the queue surface.
--
-- Every recursive op routed through a morphism — no Prelude
-- fallbacks.  zipsum uses a product-functor cata over [W] × [W].

module QueueMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Q = Q [W] Int [W] Int

qEmpty :: Q
qEmpty = Q [] 0 [] 0

qBalance :: Q -> Q
qBalance q@(Q f fl r rl)
  | fl >= rl  = q
  | otherwise = Q (f ++ reverse r) (fl + rl) [] 0

qSnoc :: Q -> W -> Q
qSnoc (Q f fl r rl) v = qBalance (Q f fl (v : r) (rl + 1))

qToList :: Q -> [W]
qToList (Q f _ r _) = f ++ reverse r

qFromList :: [W] -> Q
qFromList = foldl qSnoc qEmpty

-- Algebras --------------------------------------------------

data QAlg r   = QAlg   { qaNil :: r, qaCons :: W -> r -> r }
data QCoalg s = QCoalg { qcIsNil :: s -> Bool
                       , qcHead  :: s -> W
                       , qcTail  :: s -> s }
data QPara r  = QPara  { qpNil :: r, qpCons :: W -> [W] -> r -> r }

-- Product-functor cata over [W] × [W].
data QPairAlg r = QPairAlg
  { qpNil2  :: r
  , qpCons2 :: W -> W -> r -> r
  }

qCataCells :: QAlg r -> [W] -> r
qCataCells alg []     = qaNil alg
qCataCells alg (x:xs) = qaCons alg x (qCataCells alg xs)

qCata :: QAlg r -> Q -> r
qCata alg q = qCataCells alg (qToList q)

qAna :: QCoalg s -> s -> Q
qAna co = go qEmpty
  where go q s
          | qcIsNil co s = q
          | otherwise    = go (qSnoc q (qcHead co s)) (qcTail co s)

qHylo :: QAlg r -> QCoalg s -> s -> r
qHylo alg co s
  | qcIsNil co s = qaNil alg
  | otherwise    = qaCons alg (qcHead co s) (qHylo alg co (qcTail co s))

qParaCells :: QPara r -> [W] -> r
qParaCells alg []     = qpNil alg
qParaCells alg (x:xs) = qpCons alg x xs (qParaCells alg xs)

qPara :: QPara r -> Q -> r
qPara alg q = qParaCells alg (qToList q)

qPairCataCells :: QPairAlg r -> [W] -> [W] -> r
qPairCataCells alg []     _      = qpNil2 alg
qPairCataCells alg (_:_)  []     = qpNil2 alg
qPairCataCells alg (a:as) (b:bs) = qpCons2 alg a b (qPairCataCells alg as bs)

qPairCata :: QPairAlg r -> Q -> Q -> r
qPairCata alg qa qb = qPairCataCells alg (qToList qa) (qToList qb)

-- Algebras for the canonical workload ----------------------

-- foldr: direct cata.
foldrSumAlg :: QAlg W
foldrSumAlg = QAlg (0::W) (\h r -> h + r)

foldrXorAlg :: QAlg W
foldrXorAlg = QAlg (0::W) (\h r -> h `xorW` r)

-- foldl: CPS cata.
foldlSumAlg :: QAlg (W -> W)
foldlSumAlg = QAlg id (\h k acc -> k (acc + h))

foldlXorAlg :: QAlg (W -> W)
foldlXorAlg = QAlg id (\h k acc -> k (acc `xorW` h))

mapAlg :: (W -> W) -> QAlg [W]
mapAlg f = QAlg [] (\h r -> f h : r)

qMapViaCata :: (W -> W) -> Q -> Q
qMapViaCata f q = qFromList (qCata (mapAlg f) q)

zipSumAlg :: (W -> W -> W) -> QPairAlg W
zipSumAlg f = QPairAlg (0::W) (\a b r -> f a b + r)

qLen :: Int
qLen = 32

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          qa     = qFromList (vals qLen sa)
          qb     = qFromList (vals qLen sb)
          qm     = qMapViaCata mul3plus1 qa
          sl     = qCata foldlSumAlg qm 0     -- CPS-cata
          sr     = qCata foldrXorAlg qm       -- direct cata
          za     = qPairCata (zipSumAlg addW) qm qb
          zx     = qPairCata (zipSumAlg xorW) qm qb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
