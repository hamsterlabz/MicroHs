-- X2n1.hs - nofib imaginary/x2n1, NanoPrelude dialect.
-- Complex FloatW as a pair; sin/cos/pi are NOT primitives on the fun
-- backend, so they are fixed 12-term Taylor series IN THE PORT, and ^n is
-- an explicit binary power: both backends execute the identical binary32
-- op sequence, so the result stays bit-comparable (Double-as-Float
-- ruling). round is truncate(x+0.5) for the positive result.
-- Args scaled for simulation (nofib FAST is 1000000).
module X2n1 where
import Prelude()
import NanoPrelude

type C = (FloatW, FloatW)

piD :: FloatW
piD = fromIntD 3 +. fromIntD 14159265 /. fromIntD 100000000

-- 12-term Taylor about 0; adequate and, above all, IDENTICAL on both sides
sinD :: FloatW -> FloatW
sinD x = go 0 x x
  where
    x2 = x *. x
    go k term acc =
      if k >= 12 then acc
      else let term' = negateD term *. x2
                       /. fromIntD ((2*k+2) * (2*k+3))
           in go (k+1) term' (acc +. term')

cosD :: FloatW -> FloatW
cosD x = go 0 (fromIntD 1) (fromIntD 1)
  where
    x2 = x *. x
    go k term acc =
      if k >= 12 then acc
      else let term' = negateD term *. x2
                       /. fromIntD ((2*k+1) * (2*k+2))
           in go (k+1) term' (acc +. term')

mulC :: C -> C -> C
mulC (a,b) (c,d) = (a *. c -. b *. d, a *. d +. b *. c)

addC :: C -> C -> C
addC (a,b) (c,d) = (a +. c, b +. d)

powC :: C -> Int -> C
powC z 0 = (fromIntD 1, fromIntD 0)
powC z n = if mod n 2 == 0 then h2 else mulC z h2
  where h  = powC z (div n 2)
        h2 = mulC h h

f :: Int -> C
f n = powC (cosD th, sinD th) n
  where th = (fromIntD 2 *. piD) /. fromIntD n

sumC :: [C] -> C
sumC = go (fromIntD 0, fromIntD 0)
  where go a []     = a
        go a (z:zs) = go (addC a z) zs

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 1000000  -- upstream FAST; this port already ran a reduced 50
simN = 6

bench = truncateD (fst (sumC (map f (enumFromTo 1 simN)))
                   +. (fromIntD 1 /. fromIntD 2))

main :: Int
main = bench
