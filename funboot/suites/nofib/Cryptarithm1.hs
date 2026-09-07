-- Cryptarithm1.hs - nofib spectral/cryptarithm1, verbatim port to the
-- NanoPrelude dialect. Tests ALL 10! permutations of [0..9] against the
-- THIRTY + 5*TWELVE == NINETY condition. Glue only: the forM_ index i is
-- fixed at 1 (nofib FAST runs one iteration), and the printed solution
-- list is rendered to its exact Show string and consumed by a hash at the
-- output boundary.
module Cryptarithm1 where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

iFix :: Int
iFix = 1

p0 :: [Int]
p0 = takeL 10 (fromTo 0 (9 + iFix))

condition :: [Int] -> Bool
condition [t,h,i,r,y,w,e,l,v,n] =
  expand t h i r t y + 5 * expand t w e l v e ==
  expand n i n e t y

expand :: Int -> Int -> Int -> Int -> Int -> Int -> Int
expand a b c d e f = f + e*10 + d*100 + c*1000 + b*10000 + a*100000

permutations :: [Int] -> [[Int]]
            -- build the full permutation list given an ordered list
permutations []     = [[]]
permutations (j:js) = [r | pjs <- permutations js, r <- addj pjs]
                  where
                  addj []     = [[j]]
                  addj (k:ks) = (j:k:ks): [(k:aks) | aks <- addj ks]

-- output boundary: render the solution list as Show would, then hash
showN :: Int -> [Int]
showN k = if k < 10 then [48+k] else append (showN (div k 10)) [48 + mod k 10]

commaSep :: [[Int]] -> [Int]
commaSep []     = []
commaSep [x]    = x
commaSep (x:xs) = append x (44 : commaSep xs)

showIntList :: [Int] -> [Int]
showIntList xs = 91 : append (commaSep (map showN xs)) [93]

showListList :: [[Int]] -> [Int]
showListList xss = 91 : append (commaSep (map showIntList xss)) [93]

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastPerms, simPerms :: Int
fastPerms = 3628800  -- all 10! permutations
simPerms = 2000

bench = hashS (append (showListList
           (filter condition (takeL simPerms (permutations p0)))) [10])

main :: Int
main = bench

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }
