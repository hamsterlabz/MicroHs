-- MssMorphM.hs - Mss written in the exp3_8m idiom: every recursion is a
-- Mendler catamorphism over the input, tied with Fix.
--
-- Mss.hs computes  maximum (map sum (segments xs))  by BUILDING every segment:
-- inits calls `init` at each step (a re-walk of the whole prefix), then
-- concatMap tails, then sum each.  Written as one catamorphism the algebra
-- carries (best-so-far, best-suffix-ending-here) and the segments are never
-- built at all -- the same shape as mulMM folding over its argument instead of
-- re-walking a growing accumulator.

module MssMorphM where

import Prelude()
import NanoPrelude

fix :: forall a . (a -> a) -> a
fix g = g (fix g)

mx :: Int -> Int -> Int
mx a b = if a > b then a else b

-- one catamorphism over the list; the algebra returns
--   (maximum segment sum anywhere, maximum segment sum ending at the head)
mssGo :: [Int] -> (Int, Int)
mssGo = fix (\ rec xs ->
               case xs of
                 []       -> (0, 0)
                 (y : ys) -> case rec ys of
                               (best, suff) ->
                                 let s = mx y (y + suff)
                                 in  (mx best s, s))

mss :: [Int] -> Int
mss xs = case mssGo xs of
           (best, _) -> best

main :: Int
main = mss [(0-20)..20]
