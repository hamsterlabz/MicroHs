-- Atom.hs - nofib spectral/atom, verbatim port to the NanoPrelude dialect.
-- Double -> Float only. n stays 1000 (nofib FAST). The Num [a] instance is
-- the same code monomorphized (addL/mulL keep the original tails, including
-- (gs*gs)); runExperiment keeps the deliberate self-call. Glue: the printed
-- positions are consumed by a fold at the output boundary in place of
-- putStr (show ...).
module Atom where
import Prelude()
import NanoPrelude

data AtomState = State [FloatW] [FloatW]

type ForceLaw a = a -> [AtomState] -> [[FloatW]]

zipWithL :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithL f (a:as) (b:bs) = f a b : zipWithL f as bs
zipWithL _ _ _ = []

-- instance Num [a]: negate, (+), (*) as written in the source
addL :: [FloatW] -> [FloatW] -> [FloatW]
addL l []          = l
addL [] l          = l
addL (f:fs) (g:gs) = (f +. g) : addL fs gs

mulL :: [FloatW] -> [FloatW] -> [FloatW]
mulL _ []          = []
mulL [] _          = []
mulL (f:fs) (g:gs) = (f *. g) : mulL gs gs

infixl 9 .*
(.*) :: FloatW -> [FloatW] -> [FloatW]
c .* []     = []
c .* (f:fs) = c *. f : c .* fs

testforce :: ForceLaw [FloatW]
testforce k [] = []
testforce k (State pos vel : atoms) =
  negateD (fromIntD 1) .* mulL k pos : testforce k atoms

runExperiment :: ForceLaw a -> FloatW -> a -> AtomState -> [AtomState]
runExperiment law dt param init0 =
  init0 : zipWithL (propagate dt) (law param stream) stream
  where stream = runExperiment law dt param init0

propagate :: FloatW -> [FloatW] -> AtomState -> AtomState
propagate dt aforce (State pos vel) = State newpos newvel
  where newpos = addL pos (dt .* vel)
        newvel = addL vel (dt .* aforce)

test :: [AtomState]
test = runExperiment testforce (fromIntD 2 /. fromIntD 100)
                     [fromIntD 1] (State [fromIntD 1] [fromIntD 0])

n :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 1000
simN = 20

n = simN

-- output boundary: show AtomState prints the positions; consume them
hpos :: Int -> [FloatW] -> Int
hpos acc []     = acc
hpos acc (x:xs) = hpos (acc*31 + truncateD (x *. fromIntD 1000)) xs

bench :: Int
bench = foldl (\acc st -> case st of State pos _ -> hpos acc pos) 0 (takeL n test)

main :: Int
main = bench

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }
