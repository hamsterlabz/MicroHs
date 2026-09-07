-- Tak.hs - nofib imaginary/tak, NanoPrelude dialect.
-- SIM SCALE: nofib FAST is tak 31 16 8, which is far more Verilator wall
-- time than is available. bench is the value both backends compute.
module Tak where
import Prelude()
import NanoPrelude

tak :: Int -> Int -> Int -> Int
tak x y z = if not (y < x) then z
            else tak (tak (x-1) y z)
                     (tak (y-1) z x)
                     (tak (z-1) x y)

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
-- upstream nofib FAST is tak 31 16 8; it is not of the form (3k,2k,k), so
-- the three arguments are kept separately rather than parameterised.
fastX, fastY, fastZ :: Int
fastX = 31
fastY = 16
fastZ = 8

simX, simY, simZ :: Int
simX = 9
simY = 6
simZ = 3

bench = tak simX simY simZ

main :: Int
main = bench
