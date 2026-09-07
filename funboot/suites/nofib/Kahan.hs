-- Kahan.hs - nofib imaginary/kahan, NanoPrelude dialect, gadt idiom
-- (W from Common: Int on mhs, Word32 under the ghc-shim; GExtra hardware
-- ALU ops; unsigned comparisons). Double becomes the machine float
-- (FloatW = RV32F binary32) per the Double-as-Float ruling; the two
-- STUArrays become lists rebuilt per outer pass, arithmetic order
-- preserved; wToD is the shared exact-unsigned conversion. The original
-- prints nothing, so bench sums the vector, scales by 2^-32 and
-- truncates: identical binary32 ops on both backends.
-- Args scaled for simulation (nofib FAST is 150000, vdim 100).
module Kahan where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Common

vdim :: Int
fastVdim, simVdim :: Int
fastVdim = 100
simVdim = 6

vdim = simVdim

vnum :: W
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastVnum, simVnum :: W
fastVnum = 300
simVnum = 6

vnum = simVnum

prng :: W -> W
prng w = w'
  where
    w1 = w `xor` (w `shiftL` 13)
    w2 = w1 `xor` (w1 `shiftR` 7)
    w' = w2 `xor` (w2 `shiftL` 17)

two32 :: FloatW
two32 = fromIntD 65536 *. fromIntD 65536

inner :: W -> [FloatW] -> [FloatW] -> ([FloatW], [FloatW])
inner w [] [] = ([], [])
inner w (sj:ss) (cj:cs) =
  let y  = wToD w -. cj
      t  = sj +. y
      w' = prng w
      (ss', cs') = inner w' ss cs
  in (t : ss', ((t -. sj) -. y) : cs')

outer :: W -> [FloatW] -> [FloatW] -> [FloatW]
outer i s c = if i <= vnum
              then let (s', c') = inner i s c in outer (i+1) s' c'
              else s

zeros :: Int -> [FloatW]
zeros 0 = []
zeros n = fromIntD 0 : zeros (n-1)

sumD :: [FloatW] -> FloatW
sumD = go (fromIntD 0) where go a []     = a
                             go a (x:xs) = go (a +. x) xs

bench :: Int
bench = truncateD (sumD (outer 1 (zeros vdim) (zeros vdim)) /. two32)

main :: Int
main = bench
