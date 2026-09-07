-- MapMorphM.hs - Map in the exp3_8m idiom.
--
-- `foldr' (+) 0 (map (+ 1) [0..49])` builds [0..49], then a mapped copy, then
-- folds it away.  One catamorphism over the range does all three.

module MapMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

sumMap :: Int -> Int -> Int -> Int
sumMap = fix (\ rec acc ->
                \ i -> \ hi ->
                         if i > hi
                           then acc
                           else rec (acc + (i + 1)) (i + 1) hi)

main :: Int
main = sumMap 0 0 49
