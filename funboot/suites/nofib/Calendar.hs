-- Calendar.hs - nofib spectral/calendar (Bird and Wadler section 4.5),
-- verbatim port to the NanoPrelude dialect. nofib FAST opts: 1993 1000; the
-- loop offsets the year by i (yr = 1993 + i), so it is real work and is
-- kept. The original prints length (cal yr) per year; those lengths are
-- folded into one Int. Only the UNIX-cal path is reachable from main.
module Calendar where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

headL :: [a] -> a
headL (x:_) = x

lastL :: [a] -> a
lastL [x]    = x
lastL (_:xs) = lastL xs

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

dropL :: Int -> [a] -> [a]
dropL k xs = if k <= 0 then xs else case xs of { [] -> []; (_:ys) -> dropL (k-1) ys }

repeatL :: a -> [a]
repeatL x = x : repeatL x

zipWithL :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithL f (a:as) (b:bs) = f a b : zipWithL f as bs
zipWithL _ _ _ = []

zip3L :: [a] -> [b] -> [c] -> [(a,b,c)]
zip3L (a:as) (b:bs) (c:cs) = (a,b,c) : zip3L as bs cs
zip3L _ _ _ = []

foldr1L :: (a -> a -> a) -> [a] -> a
foldr1L _ [x]    = x
foldr1L f (x:xs) = f x (foldr1L f xs)

-- Picture handling:

type Picture = [[Int]]

height, width :: Picture -> Int
height p = length p
width  p = length (headL p)

above, beside :: Picture -> Picture -> Picture
above  = append
beside = zipWithL append

stack, spread :: [Picture] -> Picture
stack  = foldr1L above
spread = foldr1L beside

emptyPic :: (Int,Int) -> Picture
emptyPic (h,w) = copy h (copy w 32)

block, blockT :: Int -> [Picture] -> Picture
block n  = stack . map spread . groop n
blockT n = spread . map stack . groop n

groop :: Int -> [a] -> [[a]]
groop n [] = []
groop n xs = takeL n xs : groop n (dropL n xs)

lframe :: (Int,Int) -> Picture -> Picture
lframe (m,n) p = (p `beside` emptyPic (h,n-w)) `above` emptyPic (m-h,n)
                 where h = height p
                       w = width p

-- Information about the months in a year:

monthLengths :: Int -> [Int]
monthLengths year = [31,feb,31,30,31,30,31,31,30,31,30,31]
                    where feb = if leap year then 29 else 28

leap :: Int -> Bool
leap year = if mod year 100 == 0 then mod year 400 == 0
                                 else mod year 4   == 0

monthNames :: [[Int]]
monthNames = [ [74,97,110,117,97,114,121]          -- January
             , [70,101,98,114,117,97,114,121]      -- February
             , [77,97,114,99,104]                  -- March
             , [65,112,114,105,108]                -- April
             , [77,97,121]                         -- May
             , [74,117,110,101]                    -- June
             , [74,117,108,121]                    -- July
             , [65,117,103,117,115,116]            -- August
             , [83,101,112,116,101,109,98,101,114] -- September
             , [79,99,116,111,98,101,114]          -- October
             , [78,111,118,101,109,98,101,114]     -- November
             , [68,101,99,101,109,98,101,114]      -- December
             ]

jan1st :: Int -> Int
jan1st year = mod (year + div lst 4 - div lst 100 + div lst 400) 7
              where lst = year - 1

firstDays :: Int -> [Int]
firstDays year = takeL 12
                   (map (\x -> mod x 7)
                        (scanl (+) (jan1st year) (monthLengths year)))

-- Producing the information necessary for one month:

dates :: Int -> Int -> [Picture]
dates fd ml = map (date ml) (fromTo (1-fd) (42-fd))
              where date ml' d = if d < 1 || ml' < d then [[32,32,32]]
                                 else [rjustify 3 (showN d)]

showN :: Int -> [Int]
showN k = if k < 10 then [48+k] else append (showN (div k 10)) [48 + mod k 10]

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

-- In a format somewhat closer to UNIX cal:

cal :: Int -> [Int]
cal year = unlinesL (banner year `above` body year)
           where banner yr      = [cjustify 75 (showN yr)] `above` emptyPic (1,75)
                 body           = block 3 . map (pad . pic) . months
                 pic (mn,fd,ml) = title mn `above` table fd ml
                 pad p          = (side`beside`p`beside`side)`above`end
                 side           = emptyPic (8,2)
                 end            = emptyPic (1,25)
                 title mn       = [cjustify 21 mn]
                 table fd ml    = daynames `above` entries fd ml
                 daynames       = [[32,83,117,32,77,111,32,84,117,32,87,101,32,84,104,32,70,114,32,83,97]]
                 entries fd ml  = block 7 (dates fd ml)
                 months year'   = zip3L monthNames
                                        (firstDays year')
                                        (monthLengths year')

unlinesL :: [[Int]] -> [Int]
unlinesL = concat . map (\l -> append l [10])

copy :: Int -> a -> [a]
copy n x = takeL n (repeatL x)

cjustify, rjustify :: Int -> [Int] -> [Int]
cjustify n s = append (space halfm) (append s (space (m - halfm)))
               where m     = n - length s
                     halfm = div m 2
rjustify n s = append (space (n - length s)) s

space :: Int -> [Int]
space n = copy n 32

-- main: year 1993, n = 1000, yr = 1993 + i per iteration
baseYear, nIter :: Int
baseYear = 1993
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastIter, simIter :: Int
fastIter = 1000
simIter = 2

nIter = simIter

loop :: Int -> Int -> Int
loop acc i = if i > nIter then acc
             else loop (acc*31 + length (cal (baseYear + i))) (i+1)

bench :: Int
bench = loop 0 1

main :: Int
main = bench
