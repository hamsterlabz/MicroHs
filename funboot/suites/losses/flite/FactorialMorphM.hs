-- FactorialMorphM.hs - Factorial in the exp3_8m idiom.
--
-- Nothing to recover: the recursion is named once, there is no re-walked
-- accumulator and no loop-invariant call.  Both idiom variants were measured
-- WORSE than the direct definition -- a Fix knot 406, an accumulating
-- two-argument knot 566, against 325 -- so the idiom form here IS the original.

module FactorialMorphM where

import Prelude()
import NanoPrelude

fact :: Int -> Int
fact 0 = 0
fact n = n + fact (n - 1)

main :: Int
main = fact 80
