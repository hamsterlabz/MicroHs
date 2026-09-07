-- Primes.hs - nofib imaginary/primes, NanoPrelude dialect.
-- iterate and (!!) are not in NanoPrelude: local iter/idx.
-- Args scaled for simulation (nofib FAST is 400); the forM_ [1..100]
-- repetition wrapper is timing chaff and is dropped.
module Primes where
import Prelude()
import NanoPrelude

isdivs :: Int -> Int -> Bool
isdivs n x = mod x n /= 0

theFilter :: [Int] -> [Int]
theFilter (n:ns) = filter (isdivs n) ns

iter :: ([Int] -> [Int]) -> [Int] -> [[Int]]
iter f x = x : iter f (f x)

idx :: [Int] -> Int -> Int
idx (x:_)  0 = x
idx (_:xs) n = idx xs (n-1)

prime :: Int -> Int
prime n = idx (map head (iter theFilter (enumFromTo 2 (n*n)))) n

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 150
simN = 12

bench = prime simN

main :: Int
main = bench
