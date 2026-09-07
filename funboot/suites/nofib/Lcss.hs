-- Lcss.hs - nofib spectral/lcss (Hirschberg LCSS), NanoPrelude dialect.
-- nofib FAST input: lcss [1..60] [30..90]; result hashed.
module Lcss where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

elemL :: Int -> [Int] -> Bool
elemL x = any (\y -> x == y)

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

algb :: [Int] -> [Int] -> [Int]
algb xs0 ys
  = 0 : algb1 xs0 (map (\y -> (y,0)) ys)
  where
    algb1 [] ys' = map snd ys'
    algb1 (x:xs) ys'
      = algb1 xs (algb2 0 0 ys')
      where
        algb2 _ _ [] = []
        algb2 k0j1 k1j1 ((y,k0j):yrest)
          = let kjcurr = if x == y then k0j1+1 else maxI k1j1 k0j
            in (y,kjcurr) : algb2 k0j kjcurr yrest

algc :: Int -> Int -> [Int] -> [Int] -> [Int] -> [Int]
algc _ _ _   [] = id
algc _ _ [x] ys = if elemL x ys then (\r -> x:r) else id
algc m n xs  ys
  = algc m2 k xs1 (takeL k ys) . algc (m-m2) (n-k) xs2 (dropL k ys)
  where
    m2 = div m 2

    xs1 = takeL m2 xs
    xs2 = dropL m2 xs

    l1 = algb xs1 ys
    l2 = revL (algb (revL xs2) (revL ys))

    k = findk 0 0 (0-1) (zip l1 l2)

    findk _  km _ [] = km
    findk k' km mx ((x,y):xys) =
      if x+y >= mx then findk (k'+1) k' (x+y) xys
                   else findk (k'+1) km mx    xys

lcss :: [Int] -> [Int] -> [Int]
lcss xs ys = algc (length xs) (length ys) xs ys []

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 60
simN = 12

bench = hashS (lcss (fromTo 1 simN) (fromTo (div simN 2) (simN + div simN 2)))

main :: Int
main = bench

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

dropL :: Int -> [a] -> [a]
dropL k xs = if k <= 0 then xs else case xs of { [] -> []; (_:ys) -> dropL (k-1) ys }

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []

maxI :: Int -> Int -> Int
maxI a b = if a >= b then a else b
