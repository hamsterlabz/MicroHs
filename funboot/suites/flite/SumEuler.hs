---------------------------------------------------------------------------
-- Sequential Euler Totient Function 
---------------------------------------------------------------------------
-- This program calculates the sum of the totients between a lower and an 
-- upper limit, using arbitrary precision integers.
-- Phil Trinder, 26/6/03
-- Based on earlier work by Nathan Charles, Hans-Wolfgang Loidl and 
-- Colin Runciman
---------------------------------------------------------------------------

module SumEuler where
import Prelude()
import NanoPrelude

main :: Int
main = sum (totients 1 30)
        
---------------------------------------------------------------------------
-- Main Function, sumTotient
---------------------------------------------------------------------------
-- The main function, sumTotient  
-- 1. Generates a list of integers between lower and upper
-- 2. Applies Euler's phi function to every element of the list
-- 3. Returns the sum of the results

sumTotientSequential :: (Int,Int) -> Int
sumTotientSequential (lower,upper) = sum (totients lower upper)

totients :: Int -> Int -> [Int]
totients lower upper = map euler (lower: [lower+1 .. upper])

---------------------------------------------------------------------------
-- euler
---------------------------------------------------------------------------
-- The euler n function
-- 1. Generates a list [1,2,3, ... n-1,n]
-- 2. Select only those elements of the list that are relative prime to n
-- 3. Returns a count of the number of relatively prime elements

euler :: Int -> Int
euler n = length (filter (relprime n) [1 .. n-1])

---------------------------------------------------------------------------
-- relprime
---------------------------------------------------------------------------
-- The relprime function returns true if it's arguments are relatively 
-- prime, i.e. the highest common factor is 1.

relprime :: Int -> Int -> Bool
relprime x y = hcf x y == 1

relprime' :: Int -> Int -> Bool
relprime' x y = null (intersect (primeFactors x) (primeFactors y))

primeFactors :: Int -> [Int]
primeFactors 1 = []
primeFactors n = go n 2
  where
    go num divisor
      | divisor * divisor > num = if num > 1 then [num] else []
      | num `mod` divisor == 0 = divisor : go (num `div` divisor) divisor
      | otherwise = go num (divisor + 1)
      
---------------------------------------------------------------------------
-- intersect (Helper to find common factors)
---------------------------------------------------------------------------
intersect :: [Int] -> [Int] -> [Int]
intersect xs ys = [x | x <- xs, elem x ys]

---------------------------------------------------------------------------
-- hcf 
---------------------------------------------------------------------------
-- The hcf function returns the highest common factor of 2 integers

hcf :: Int -> Int -> Int
hcf x 0 = x
hcf x y = hcf y (x `mod` y)

