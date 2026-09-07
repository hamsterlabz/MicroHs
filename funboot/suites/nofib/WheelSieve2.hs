-- WheelSieve2.hs - nofib imaginary/wheel-sieve2, NanoPrelude dialect.
-- span/dropWhile/zipWith3 are not in NanoPrelude: local spanL/dropW/zipW3;
-- input^4 spelled out. Args scaled for simulation (nofib FAST is 700);
-- the forM_ [1..100] repetition wrapper is dropped.
module WheelSieve2 where
import Prelude()
import NanoPrelude

data Wheel = Wheel Int [Int] [Int]

spanL :: (Int -> Bool) -> [Int] -> ([Int], [Int])
spanL p [] = ([], [])
spanL p (x:xs) = if p x then let (as, bs) = spanL p xs in (x:as, bs)
                 else ([], x:xs)

dropW :: (Int -> Bool) -> [Int] -> [Int]
dropW p [] = []
dropW p (x:xs) = if p x then dropW p xs else x:xs

zipW3 :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
zipW3 f (x:xs) (y:ys) (z:zs) = f x y z : zipW3 f xs ys zs
zipW3 f _ _ _ = []

prime :: Int -> Int
prime n = idx primes n
  where
    primes = spiral (wheels primes) primes (squares primes) n
    idx (x:_)  0 = x
    idx (_:xs) k = idx xs (k-1)

spiral :: [Wheel] -> [Int] -> [Int] -> Int -> [Int]
spiral (Wheel s ms ns:ws) ps qs input =
  foldr turn0 (roll s) ns
  where
  roll o = foldr (turn o) (foldr (turn o) (roll (o+s)) ns) ms
  turn0 n rs = if n < q then n:rs else sp
  turn o n rs =
    let n' = o+n in
    if n' == 2 || n' < q then n':rs else dropW (\x -> x < n') sp
  sp = spiral ws (tail ps) (tail qs) input
  q = min (input*input*input*input) (head qs)

squares :: [Int] -> [Int]
squares ps = [ p*p | p <- ps ]

wheels :: [Int] -> [Wheel]
wheels primes = Wheel 1 [1] [] :
                zipW3 nextSize (wheels primes) primes (squares primes)

nextSize :: Wheel -> Int -> Int -> Wheel
nextSize (Wheel s ms ns) p q =
  Wheel (s*p) ms' ns'
  where
  (xs, ns') = spanL (\x -> x <= q) (foldr turn0 (roll (p-1) s) ns)
  ms' = foldr turn0 xs ms
  roll 0 _ = []
  roll t o = foldr (turn o) (foldr (turn o) (roll (t-1) (o+s)) ns) ms
  turn0 n rs = if mod n p > 0 then n:rs else rs
  turn o n rs =
    let n' = o+n in
    if mod n' p > 0 then n':rs else rs

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
