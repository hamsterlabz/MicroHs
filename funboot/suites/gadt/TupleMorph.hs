-- TupleMorph.hs — recursion-scheme variant of TuplePure.
--
-- The four morphisms specialised to a 3-tuple are degenerate but
-- illustrative.  Every recursive op (foldl, foldr, map, zipWith,
-- drop-first via para) is routed through a morphism — no Prelude
-- fallbacks.  Distinct algebras for foldl (CPS-cata) vs foldr
-- (direct cata): even where the scalar results coincide for
-- commutative+associative ops, the algebra shapes differ.

module TupleMorph where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common

data Triple = Triple W W W

-- ---- F-algebra over Triple  (F r = W × W × W × r — degenerate to fixed 3) -----

-- Direct cata: right-associated combine.
data TAlg r = TAlg
  { taStep :: W -> r -> r
  , taSeed :: r
  }

tCata :: TAlg r -> Triple -> r
tCata (TAlg s z) (Triple a b c) = s a (s b (s c z))

-- Coalgebra: generate three slot values from a seed (state-passing).
data TCoalg = TCoalg
  { tcNext :: W -> (W, W)
  }

tAna :: TCoalg -> W -> Triple
tAna (TCoalg nx) s0 =
  let (a, s1) = nx s0
      (b, s2) = nx s1
      (c, _ ) = nx s2
  in  Triple a b c

tHylo :: TAlg r -> TCoalg -> W -> r
tHylo (TAlg s z) (TCoalg nx) s0 =
  let (a, s1) = nx s0
      (b, s2) = nx s1
      (c, _ ) = nx s2
  in  s a (s b (s c z))

-- Paramorphism: cata with slot position.
data TPara r = TPara
  { tpStep :: W -> Int -> r -> r
  , tpSeed :: r
  }

tPara :: TPara r -> Triple -> r
tPara (TPara s z) (Triple a b c) = s a 0 (s b 1 (s c 2 z))

-- Product-functor cata over Triple × Triple.
data TPairAlg r = TPairAlg
  { tpStep2 :: W -> W -> r -> r
  , tpSeed2 :: r
  }

tPairCata :: TPairAlg r -> Triple -> Triple -> r
tPairCata (TPairAlg s z) (Triple a1 b1 c1) (Triple a2 b2 c2) =
  s a1 a2 (s b1 b2 (s c1 c2 z))

-- Algebras for the canonical workload ----------------------

-- foldr: direct cata with `r = W`.
foldrXorAlg :: TAlg W
foldrXorAlg = TAlg (\v acc -> v `xorW` acc) 0

-- foldl: CPS cata with `r = W -> W`.
foldlSumAlg :: TAlg (W -> W)
foldlSumAlg = TAlg (\v k acc -> k (acc + v)) id

-- Drop slot 0 via paramorphism: XOR every slot except position 0.
dropFirstXorPara :: TPara W
dropFirstXorPara = TPara (\v idx acc -> if idx == 0 then acc else acc `xorW` v) 0

-- map: lifted cata that re-emits a Triple.  We express it
-- structurally as a cata returning (Triple via slot-apply).
tMapViaCata :: (W -> W) -> Triple -> Triple
tMapViaCata f (Triple a b c) = Triple (f a) (f b) (f c)
-- (The cata is degenerate at three fixed slots; there's no
-- recursion to thread through, so the source-level "cata" here
-- is just slot-apply.)

-- zipWith: product-functor cata that collapses pairs to a scalar.
zipSumXorAlg :: (W -> W -> W) -> TPairAlg W
zipSumXorAlg f = TPairAlg (\x y acc -> acc `xorW` f x y) 0

-- Coalgebra: LCG generator.
lcgCoalg :: TCoalg
lcgCoalg = TCoalg (\s -> let s' = lcgNext s in (s', s'))

bench :: Int -> W
bench n = benchFold n step
  where
    step i acc =
      let seed   = 0xA1F32C97 + fromIntegral i
          x      = tAna lcgCoalg seed
          x3     = case x of Triple _ _ c -> c   -- x's final LCG state (chain y off it, as TuplePure does)
          y      = tAna lcgCoalg (x3 + 0x5EE9D4B2)
          pj     = tPara dropFirstXorPara x
          xm     = tMapViaCata mul3plus1 x
          sl     = tCata foldlSumAlg xm 0     -- CPS cata + apply
          sr     = tCata foldrXorAlg xm       -- direct cata
          za     = tPairCata (zipSumXorAlg addW) xm y
          zx     = tPairCata (zipSumXorAlg xorW) xm y
      in  acc `hashMix` sl `hashMix` sr `hashMix` pj `hashMix` za `hashMix` zx

main :: Int
main = bench 4
