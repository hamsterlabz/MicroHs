-- Cryptarithm2Bits.hs - the digit set as a bitmask.
-- Cryptarithm2.hs - nofib spectral/cryptarithm2 (Andy Gill's generic
-- solver), verbatim port to the NanoPrelude dialect. The StateT Digits []
-- monad is hand-specialized: DigitState a = Digits -> [(a,Digits)], with
-- do-blocks desugared to bindD (list-of-successes semantics unchanged).
-- Chars are [Int] codes. The forM_ [1..30] wrapper repeats identical work
-- (the i > 999999 branch is never taken at FAST=30) and is dropped; the
-- printed puzzle string is consumed with the nofib hash.
module Cryptarithm2Bits where
import Prelude()
import NanoPrelude
import GExtra ((.&.), xor, shiftL, shiftR)

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []

-- Digits record: remaining digits, char -> digit environment
-- The available-digit set is 0..9, so it is a 10-bit mask, not a list.
--
-- permute built  diffL (digits st) [x]  -- a fresh nine-element list -- for
-- EVERY one of the ten candidates, so each call allocated about ninety conses
-- just to say "these digits are still free".  As a mask, removal is one xor and
-- the candidates are read off the set bits in the same ascending order.
data Digits = Digits Int [(Int,Int)]

bitsOf :: Int -> [Int]
bitsOf = go 0
  where
    go i m = if m == 0
               then []
               else if (m .&. 1) == 1
                      then i : go (i + 1) (shiftR m 1)
                      else go (i + 1) (shiftR m 1)

digits :: Digits -> Int
digits (Digits d _) = d

digitEnv :: Digits -> [(Int,Int)]
digitEnv (Digits _ e) = e

initState :: Digits
initState = Digits 1023 []   -- bits 0..9 set

-- DigitState a = StateT Digits [] a, specialized
type DigitState a = Digits -> [(a, Digits)]

returnD :: a -> DigitState a
returnD a = \s -> [(a, s)]

bindD :: DigitState a -> (a -> DigitState b) -> DigitState b
bindD m k = \s -> concat (map (\(a, s') -> k a s') (m s))

getD :: DigitState Digits
getD = \s -> [(s, s)]

putD :: Digits -> DigitState Int
putD s' = \_ -> [(0, s')]

liftD :: [a] -> DigitState a
liftD xs = \s -> map (\x -> (x, s)) xs

mzeroD :: DigitState a
mzeroD = \_ -> []

guardD :: Bool -> DigitState Int
guardD b = if b then returnD 0 else mzeroD

execStateTD :: DigitState a -> Digits -> [Digits]
execStateTD m s = map snd (m s)

mapMD :: (a -> DigitState b) -> [a] -> DigitState [b]
mapMD f []     = returnD []
mapMD f (x:xs) = f x `bindD` \y -> mapMD f xs `bindD` \ys -> returnD (y:ys)

-- Data.List helpers
deleteL :: Int -> [Int] -> [Int]
deleteL _ []     = []
deleteL y (x:xs) = if x == y then xs else x : deleteL y xs

diffL :: [Int] -> [Int] -> [Int]
diffL = foldl (\acc y -> deleteL y acc)

lookupL :: Int -> [(Int,Int)] -> Int
lookupL c []          = 0-1
lookupL c ((k,v):kvs) = if c == k then v else lookupL c kvs

nubL :: [Int] -> [Int]
nubL = go []
  where go seen []     = []
        go seen (x:xs) = if any (\y -> y == x) seen then go seen xs
                         else x : go (x:seen) xs

transposeL :: [[a]] -> [[a]]
transposeL []             = []
transposeL ([]     : xss) = transposeL xss
transposeL ((x:xs) : xss) = (x : [h | (h:_) <- xss])
                          : transposeL (xs : [t | (_:t) <- xss])

-- permute / select / solve, desugared
permute :: Int -> DigitState Int
permute c =
  getD `bindD` \st ->
  liftD [ (x, digits st `xor` shiftL 1 x) | x <- bitsOf (digits st) ] `bindD` \(i,is) ->
  putD (Digits is ((c,i) : digitEnv st)) `bindD` \_ ->
  returnD i

select :: Int -> DigitState Int
select c =
  getD `bindD` \st ->
  let r = lookupL c (digitEnv st)
  in if r /= (0-1) then returnD r else permute c

solve :: [[Int]] -> [Int] -> Int -> DigitState Int
solve tops (bot:bots) carry =
  (case tops of
     []      -> returnD carry
     (top:_) -> mapMD select top `bindD` \topNS ->
                returnD (sum topNS + carry)) `bindD` \topN ->
  select bot `bindD` \botN ->
  guardD (mod topN 10 == botN) `bindD` \_ ->
  solve (rest tops) bots (div topN 10)
  where
     rest []     = []
     rest (x:xs) = xs
solve [] [] c = if c == 0 then returnD 0 else mzeroD
solve _  _  _ = mzeroD

puzzle :: [[Int]] -> [Int] -> [Int]
puzzle top bot =
             if length (nubL (append (concat top) bot)) > 10
             then []   -- error "can not map more than 10 chars" (unreachable)
        else if topVal /= botVal
             then []   -- error "Internal Error" (unreachable)
        else concat [ append [c] (append arrow (append (showN i) [10]))
                    | (c,i) <- digitEnv answer ]
   where
        arrow = [32,61,62,32]   -- " => "
        solution = solve (transposeL (map revL top))
                         (revL bot)
                         0
        answer = headL (execStateTD solution initState)
        headL (x:_) = x
        env    = digitEnv answer
        look c = lookupL c env
        topVal = sum [expand xs | xs <- top]
        botVal = expand bot
        expand = foldl (\a b -> a * 10 + look b) 0

showN :: Int -> [Int]
showN k = if k < 10 then [48+k] else append (showN (div k 10)) [48 + mod k 10]

-- "THIRTY" and five "TWELVE"s summing to "NINETY"
tHIRTY, tWELVE, nINETY :: [Int]
tHIRTY = [84,72,73,82,84,89]
tWELVE = [84,87,69,76,86,69]
nINETY = [78,73,78,69,84,89]

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS (puzzle [tHIRTY, tWELVE, tWELVE, tWELVE, tWELVE, tWELVE] nINETY)

main :: Int
main = bench
