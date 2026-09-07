-- RFib.hs - nofib imaginary/rfib, NanoPrelude dialect.
-- nfib over the machine float (FloatW = RV32F binary32); the counts are
-- integer-valued and exactly representable well past this range, so
-- truncating to Int gives a bit-exact cross-backend result.
-- Args scaled for simulation (nofib FAST is 35).
module RFib where
import Prelude()
import NanoPrelude

nfib :: FloatW -> FloatW
nfib n = if n <=. fromIntD 1 then fromIntD 1
         else nfib (n -. fromIntD 1) +. nfib (n -. fromIntD 2) +. fromIntD 1

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 22
simN = 11

bench = truncateD (nfib (fromIntD simN))

main :: Int
main = bench
