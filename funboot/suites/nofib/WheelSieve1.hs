-- WheelSieve1.hs - nofib imaginary/wheel-sieve1, NanoPrelude dialect.
-- zipWith and enumFromThenTo are not in NanoPrelude: local zipW/fromThenTo.
-- Args scaled for simulation (nofib FAST is 3000); the forM_ [1..100]
-- repetition wrapper is dropped.
module WheelSieve1 where
import Prelude()
import NanoPrelude

data Wheel = Wheel Int [Int]

zipW :: (a -> b -> c) -> [a] -> [b] -> [c]
zipW f (x:xs) (y:ys) = f x y : zipW f xs ys
zipW f _      _      = []

fromThenTo :: Int -> Int -> Int -> [Int]
fromThenTo a b c = go a
  where d = b - a
        go x = if x <= c then x : go (x+d) else []

prime :: Int -> Int
prime n = idx primes n
  where
    primes = sieve (wheels primes) primes (squares primes) n
    idx (x:_)  0 = x
    idx (_:xs) k = idx xs (k-1)

sieve :: [Wheel] -> [Int] -> [Int] -> Int -> [Int]
sieve (Wheel s ns:ws) ps qs input =
  [ n' | o <- s : fromThenTo (s*2) (s*3) (min (input*input) (head ps - 1) * s),
         n <- ns,
         n' <- [n+o], noFactor n' ]
  ++ sieve ws (tail ps) (tail qs) input
  where
  noFactor = if s <= 2 then const True else notDivBy ps qs
  (++) [] ys = ys
  (++) (x:xs) ys = x : (xs ++ ys)

notDivBy :: [Int] -> [Int] -> Int -> Bool
notDivBy (p:ps) (q:qs) n =
  q > n || mod n p > 0 && notDivBy ps qs n

squares :: [Int] -> [Int]
squares ps = [ p*p | p <- ps ]

wheels :: [Int] -> [Wheel]
wheels ps = ws
  where ws = Wheel 1 [1] : zipW nextSize ws ps

nextSize :: Wheel -> Int -> Wheel
nextSize (Wheel s ns) p = Wheel (s*p) ns'
  where
  ns' = [ n' | o <- fromThenTo 0 s ((p-1)*s),
               n <- ns,
               n' <- [n+o], mod n' p > 0 ]

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 100
simN = 10

bench = prime simN

main :: Int
main = bench
