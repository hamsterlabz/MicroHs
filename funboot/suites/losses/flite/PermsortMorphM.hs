-- PermsortMorphM.hs - Permsort in the exp3_8m idiom.  Each recursion is named
-- once already, so this is the structural rewrite only.

module PermsortMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

place :: Int -> [Int] -> [[Int]]
place x = fix (\ rec ys ->
                 case ys of
                   []       -> [[x]]
                   (y : yt) -> (x : y : yt) : map ((:) y) (rec yt))

perm :: [Int] -> [[Int]]
perm = fix (\ rec xs ->
              case xs of
                []       -> [[]]
                (x : xt) -> concatMap (place x) (rec xt))

ord :: [Int] -> Bool
ord = fix (\ rec xs ->
             case xs of
               []       -> True
               (x : ys) -> case ys of
                             []      -> True
                             (y : _) -> (x <= y) && rec ys)

permSort xs = head (filter ord (perm xs))

main = head (permSort [10,6,7,9,6,12,12])
