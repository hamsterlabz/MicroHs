-- NQueens.hs - nofib imaginary/queens, NanoPrelude dialect.
-- Args scaled for simulation (nofib FAST is 12).
module NQueens where
import Prelude()
import NanoPrelude

nsoln :: Int -> Int
nsoln nq = length (gen nq)
 where
  safe :: Int -> Int -> [Int] -> Bool
  safe x d []    = True
  safe x d (q:l) = x /= q && x /= q+d && x /= q-d && safe x (d+1) l

  gen :: Int -> [[Int]]
  gen 0 = [[]]
  gen n = [ q:b | b <- gen (n-1), q <- enumFromTo 1 nq, safe q 1 b ]

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 8
simN = 5

bench = nsoln simN

main :: Int
main = bench
