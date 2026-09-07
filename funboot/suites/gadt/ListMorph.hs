-- ListMorph.hs — recursion-scheme variant of ListPure.
--
-- Every recursive op (map, foldl, foldr, zipsum) is expressed via
-- a morphism — no Prelude fallbacks.  zipsum uses a product-
-- functor catamorphism over [W] × [W].
--
-- Canonical workload (4 hashMix outputs): build / drop / map /
-- foldl / foldr / zipsum.

module ListMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

-- ---- F-algebra over [W]: F a r = 1 + W × r ---------------

data LAlg r = LAlg
  { laNil  :: r
  , laCons :: W -> r -> r
  }

data LCoalg s = LCoalg
  { lcIsNil :: s -> Bool
  , lcHead  :: s -> W
  , lcTail  :: s -> s
  }

data LPara r = LPara
  { lpNil  :: r
  , lpCons :: W -> [W] -> r -> r
  }

lCata :: LAlg r -> [W] -> r
lCata alg []     = laNil alg
lCata alg (x:xs) = laCons alg x (lCata alg xs)

lAna :: LCoalg s -> s -> [W]
lAna co s
  | lcIsNil co s = []
  | otherwise    = lcHead co s : lAna co (lcTail co s)

lHylo :: LAlg r -> LCoalg s -> s -> r
lHylo alg co s
  | lcIsNil co s = laNil alg
  | otherwise    = laCons alg (lcHead co s) (lHylo alg co (lcTail co s))

lPara :: LPara r -> [W] -> r
lPara alg []     = lpNil alg
lPara alg (x:xs) = lpCons alg x xs (lPara alg xs)

-- ---- Product-functor cata over [W] × [W] -----------------
--
--   F (a, b) r = 1 + (W × W × r)
--             ≡ Nil | Cons (a, b) r
--
-- (Plus a third arm for "one side empty" — we collapse it into
-- Nil since both ends behave the same for our zip semantics.)

data LPairAlg r = LPairAlg
  { lpNil2  :: r                      -- both lists empty (or one ran out)
  , lpCons2 :: W -> W -> r -> r       -- pair-cons step
  }

lPairCata :: LPairAlg r -> [W] -> [W] -> r
lPairCata alg []     _      = lpNil2 alg
lPairCata alg (_:_)  []     = lpNil2 alg
lPairCata alg (a:as) (b:bs) = lpCons2 alg a b (lPairCata alg as bs)

-- Algebras for the canonical workload ----------------------
--
-- foldr uses the natural cata: r = W, right-associated combine.
-- foldl uses CPS cata: r = (W -> W), left-associated via
-- continuation.  Different algebra TYPES and different operational
-- structure — even for commutative+associative ops where the
-- scalar results are equal.

foldrSumAlg :: LAlg W
foldrSumAlg = LAlg (0::W) (\h r -> h + r)

foldrXorAlg :: LAlg W
foldrXorAlg = LAlg (0::W) (\h r -> h `xorW` r)

foldlSumAlg :: LAlg (W -> W)
foldlSumAlg = LAlg id (\h k acc -> k (acc + h))

foldlXorAlg :: LAlg (W -> W)
foldlXorAlg = LAlg id (\h k acc -> k (acc `xorW` h))

mapMul3plus1Alg :: LAlg [W]
mapMul3plus1Alg = LAlg [] (\h r -> mul3plus1 h : r)

zipSumAlg :: (W -> W -> W) -> LPairAlg W
zipSumAlg f = LPairAlg (0::W) (\a b r -> f a b + r)

-- ---- LCG draws ------------------------------------------

draws :: Int -> W -> ([W], W)
draws n s0 = go n s0 []
  where
    go 0 s acc = (acc, s)
    go k s acc = let s' = lcgNext s in go (k - 1) s' (s' : acc)

listLen :: Int
listLen = 64

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let seed     = 0xA1F32C97 + fromIntegral i
          seed'    = 0x5EE9D4B2 + fromIntegral i
          (as0, _) = draws listLen seed
          (bs0, _) = draws listLen seed'
          as       = drop 4 as0
          bs       = bs0
          asM      = lCata mapMul3plus1Alg as
          sumL     = lCata foldlSumAlg asM 0     -- CPS-cata + apply
          sumR     = lCata foldrXorAlg asM       -- direct cata
          zAdd     = lPairCata (zipSumAlg addW) asM bs
          zXor     = lPairCata (zipSumAlg xorW) asM bs
      in  acc `hashMix` sumL `hashMix` sumR `hashMix` zAdd `hashMix` zXor

main :: Int
main = bench 4
