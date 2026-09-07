-- RoseTreeMorphM.hs — rose tree via Mendler-style open
-- recursion (mcata / mcata2 from Morphx).  No pattern functor
-- → no intermediate RoseF constructor allocated per node;
-- each operation is one open-recursive step function whose
-- algebra pattern-matches the ADT directly and applies the
-- recurse function on whichever recursive positions it wants.

module RoseTreeMorphM (bench) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

import Common
import Morphx

data Rose = Rose W [Rose]

roseInsertChild :: Rose -> W -> Rose
roseInsertChild (Rose v ks) v' = Rose v (Rose v' [] : ks)

roseDeleteFirstChild :: Rose -> Rose
roseDeleteFirstChild t@(Rose _ []) = t
roseDeleteFirstChild (Rose v (_:ks)) = Rose v ks

-- Algebras as open-recursive step functions.  The `rec`
-- argument is the recurse; the algebra applies it to any
-- subterm it wants to fold and pattern-matches Rose directly.

mapMul3plus1 :: Rose -> Rose
mapMul3plus1 = mcata $ \rec (Rose v ks) ->
  Rose (mul3plus1 v) (goMap rec ks)
  where
    goMap _ []     = []
    goMap f (x:xs) = f x : goMap f xs

foldrXor :: Rose -> W
foldrXor = mcata $ \rec (Rose v ks) ->
  foldrXorList rec v ks
  where
    foldrXorList _ z []     = z
    foldrXorList r z (x:xs) = r x `xorW` foldrXorList r z xs

foldlSum :: Rose -> W -> W
foldlSum = mcata $ \rec (Rose v ks) acc ->
  foldlList rec (acc + v) ks
  where
    foldlList _ z []     = z
    foldlList r z (k:rest) = foldlList r (r k z) rest

-- zip walks two roses in lockstep with mcata2; structurally
-- identical to the morph variant's rPairCata.
zipSum :: (W -> W -> W) -> Rose -> Rose -> W
zipSum f = mcata2 $ \rec (Rose va kas) (Rose vb kbs) ->
  sumList (f va vb) (zipKids rec kas kbs)
  where
    sumList z []     = z
    sumList z (x:xs) = x + sumList z xs
    zipKids _ []     _      = []
    zipKids _ (_:_)  []     = []
    zipKids r (a:as) (b:bs) = r a b : zipKids r as bs

vals :: Int -> W -> [W]
vals 0 _ = []
vals n s = let s' = lcgNext s in s' : vals (n - 1) s'

insertCount :: Int
insertCount = 16

bench :: Int -> W
bench nOuter = benchFold nOuter step
  where
    step i acc =
      let sa     = 0xA1F32C97 + fromIntegral i
          sb     = 0x5EE9D4B2 + fromIntegral i
          ta0    = foldl roseInsertChild (Rose (lcgNext sa) []) (vals insertCount sa)
          tb     = foldl roseInsertChild (Rose (lcgNext sb) []) (vals insertCount sb)
          ta     = roseDeleteFirstChild (roseDeleteFirstChild ta0)
          tm     = mapMul3plus1 ta
          sl     = foldlSum tm 0
          sr     = foldrXor tm
          za     = zipSum addW tm tb
          zx     = zipSum xorW tm tb
      in  acc `hashMix` sl `hashMix` sr `hashMix` za `hashMix` zx

main :: Int
main = bench 4
