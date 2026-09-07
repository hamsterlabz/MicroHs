-- Integrate.hs - nofib imaginary/integrate, NanoPrelude dialect.
-- All arithmetic on the machine float (FloatW = RV32F binary32) through the
-- dot atoms; ^2/^4 spelled out; [1.0..], zipWith, take and (!!) are local.
-- The result is truncated to Int for printing; both backends run identical
-- binary32 operations in the same order. Args scaled for simulation
-- (nofib FAST is 100000).
module Integrate where
import Prelude()
import NanoPrelude

integrate1D :: FloatW -> FloatW -> (FloatW -> FloatW) -> FloatW
integrate1D l u f =
  let d = (u -. l) /. fromIntD 8 in
    d *. sumD
      [ f l *. half,
        f (l +. d),
        f (l +. (fromIntD 2 *. d)),
        f (l +. (fromIntD 3 *. d)),
        f (l +. (fromIntD 4 *. d)),
        f (u -. (fromIntD 3 *. d)),
        f (u -. (fromIntD 2 *. d)),
        f (u -. d),
        f u *. half ]
  where half = fromIntD 1 /. fromIntD 2

sumD :: [FloatW] -> FloatW
sumD = go (fromIntD 0) where go a [] = a
                             go a (x:xs) = go (a +. x) xs

integrate2D :: FloatW -> FloatW -> FloatW -> FloatW -> (FloatW -> FloatW -> FloatW) -> FloatW
integrate2D l1 u1 l2 u2 f =
  integrate1D l2 u2 (\y -> integrate1D l1 u1 (\x -> f x y))

zark :: FloatW -> FloatW -> FloatW
zark u v = integrate2D (fromIntD 0) u (fromIntD 0) v (\x y -> x *. y)

zipWD :: (FloatW -> FloatW -> FloatW) -> [FloatW] -> [FloatW] -> [FloatW]
zipWD f (x:xs) (y:ys) = f x y : zipWD f xs ys
zipWD f _ _ = []

ints :: [FloatW]
ints = go 1 where go n = fromIntD n : go (n+1)

zarks :: [FloatW]
zarks = zipWD zark ints (map (\x -> fromIntD 2 *. x) ints)

rtotals :: [FloatW]
rtotals = head zarks : zipWD (+.) (tail zarks) rtotals

is :: [FloatW]
is = map (\x -> let x2 = x *. x in x2 *. x2) ints

itotals :: [FloatW]
itotals = head is : zipWD (+.) (tail is) itotals

es :: [FloatW]
es = map (\x -> x *. x) (zipWD (-.) rtotals itotals)

takeD :: Int -> [FloatW] -> [FloatW]
takeD 0 _      = []
takeD n (x:xs) = x : takeD (n-1) xs

etotal :: Int -> FloatW
etotal n = sumD (takeD n es)

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 150
simN = 10

bench = truncateD (etotal simN)

main :: Int
main = bench
