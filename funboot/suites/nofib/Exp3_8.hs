-- Exp3_8.hs - nofib imaginary/exp3_8, NanoPrelude dialect.
-- Peano naturals; the Num instance becomes plain addN/mulN (NanoPrelude has
-- no classes). Same arg as nofib FAST (8).
module Exp3_8 where
import Prelude()
import NanoPrelude

data Nat = Z | S Nat

addN :: Nat -> Nat -> Nat
addN Z     y = y
addN (S x) y = S (addN x y)

mulN :: Nat -> Nat -> Nat
mulN x Z     = Z
mulN x (S y) = addN (mulN x y) x

powN :: Nat -> Int -> Nat
powN x 0 = S Z
powN x k = mulN x (powN x (k-1))

intN :: Nat -> Int
intN Z     = 0
intN (S x) = 1 + intN x

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastE, simE :: Int
fastE = 8
simE = 4

bench = intN (powN (S (S (S Z))) simE)

main :: Int
main = bench
