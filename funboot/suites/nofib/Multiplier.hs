-- Multiplier.hs - nofib spectral/multiplier (O'Donnell binary multiplier
-- circuit simulation), verbatim port to the NanoPrelude dialect. nofib FAST
-- opts: 32 (wordsize); limit 2000 cycles, verbose trace. Signals are lazy
-- Int streams exactly as in the source (latch a = 0:a, zerO = 0:zerO).
-- Glue only: local list helpers, the local binding `sum` renamed sumS
-- (NanoPrelude exports sum), the unreachable k<0 error guards dropped, and
-- the traced output stream consumed with the nofib hash.
module Multiplier where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

headL :: [a] -> a
headL (x:_) = x

tailL :: [a] -> [a]
tailL (_:xs) = xs

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

dropL :: Int -> [a] -> [a]
dropL k xs = if k <= 0 then xs else case xs of { [] -> []; (_:ys) -> dropL (k-1) ys }

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []

orB :: [Bool] -> Bool
orB = any (\b -> b)

upfrom :: Int -> [Int]
upfrom n = n : upfrom (n+1)

type Bit = Int
type B = [Bit]
type W = [B]

-- Definition of the output and the simulation parameters

fastCycles, simCycles :: Int
fastCycles = 2000
simCycles = 60

go :: Int -> [Int]
go wordsize =
  let
    limit = simCycles   -- upstream FAST: 2000
    width = 10
    xs = [(2+3*i, 11+2*i) | i <- upfrom 1]
  in
    append hdr (traceMult width wordsize limit xs)
  where
    -- "Binary multiplier circuit simulation\n"
    hdr = [66,105,110,97,114,121,32,109,117,108,116,105,112,108,105,101,114,32,99,105,114,99,117,105,116,32,115,105,109,117,108,97,116,105,111,110,10]

-- Simulation driver (verbose)

traceMult :: Int -> Int -> Int -> [(Int,Int)] -> [Int]
traceMult width wordsize limit xs =
  format limit
    [fmtInt 5 (upfrom 0), fmtStr [46,32],
     fmtB start, fmtW width as, fmtW width bs, fmtStr [32,32,61,61,62,32],
     fmtB ready, fmtW width ra, fmtW width rb, fmtW width prod,
     fmtStr [10]]
  where (as,bs,ready,ra,rb,prod) = multsys wordsize xs
        start = ready

-- Interface to the multiplier

multsys :: Int -> [(Int,Int)] -> (W,W,B,W,W,W)
multsys wordsize xs = (as,bs,ready,ra,rb,prod)
  where (ready, ra, rb, prod) = multiplier wordsize start as bs
        start = ready
        as  = f (map fst xs)
        bs  = f (map snd xs)
        f as' = ntrans wordsize (map (ibits wordsize) (g start as'))
        g [] xs' = []
        g st [] = []
        g (0:sts) xs' = 0 : g sts xs'
        g (1:sts) (x:xs') = x : g sts xs'

-- The multiplier circuit specification

multiplier :: Int -> B -> W -> W -> (B,W,W,W)
multiplier k start a b = (ready, regA, regB, regP)
  where
    regP = wlat (2*k) (wmux1 (2*k) start sumS (rept (2*k) zerO))
    (ovfl,sumS) = add (2*k) regP (wmux1 (2*k) lsbB
                   (rept (2*k) zerO) regA) zerO
    regA = wlat (2*k) (wmux1 (2*k) start (shl (2*k) regA)
                   (append (rept k zerO) a))
    regB = wlat k (wmux1 k start (shr k regB) b)
    lsbB = headL (dropL (k-1) regB)
    ready = or2 (regIs0 (2*k) regA) (regIs0 k regB)

-- Comparator

regIs0 :: Int -> W -> B
regIs0 k xs = wideAnd (map inv xs)

-- Combinational shifters

shl :: Int -> W -> W
shl k xs = append (dropL 1 xs) [zerO]

shr :: Int -> W -> W
shr k xs = zerO : takeL (k-1) xs

-- Adder

add :: Int -> W -> W -> B -> (B,W)
add 0 xs ys cin = (cin,[])
add k (x:xs) (y:ys) cin = (cout,s:ss)
  where
  (cout,s) = fulladd x y c
  (c,ss) = add (k-1) xs ys cin

halfadd :: B -> B -> (B,B)
halfadd x y = (and2 x y, xor x y)

fulladd :: B -> B -> B -> (B,B)
fulladd a b c = (or2 w y, z)
  where (w,x) = halfadd a b
        (y,z) = halfadd x c

-- Multiplexors

bmux1 :: B -> B -> B -> B
bmux1 c a b = or2 (and2 (inv c) a) (and2 c b)

wmux1 :: Int -> B -> W -> W -> W
wmux1 k a = word21 k (bmux1 a)

-- Registers

wlat :: Int -> [B] -> [B]
wlat 0 xs = []
wlat k (x:xs) = latch x : wlat (k-1) xs

-- Primitive components

latch :: B -> B
latch a = 0:a

zerO, one :: B
zerO = 0:zerO
one  = 1:one

inv :: B -> B
inv = lift11 forceBit f
  where f 0 = 1
        f 1 = 0

and2 :: B -> B -> B
and2 = lift21 forceBit f
  where f 1 1 = 1
        f _ _ = 0

nand2 :: B -> B -> B
nand2 = lift21 forceBit f
  where f 1 1 = 0
        f _ _ = 1

or2 :: B -> B -> B
or2 = lift21 forceBit f
  where f 0 0 = 0
        f _ _ = 1

xor :: B -> B -> B
xor = lift21 forceBit f
  where f a b = if a == b then 0 else 1

-- Wide gates

wideGate :: (B -> B -> B) -> [B] -> B
wideGate f [x] = x
wideGate f xs =
  f (wideGate f (takeL i xs))
    (wideGate f (dropL i xs))
  where i = div (length xs) 2

wideAnd :: [B] -> B
wideAnd = wideGate and2

-- Auxiliary definitions

forceBit :: Bit -> Bool
forceBit x = x == 0

headstrict :: (a -> Bool) -> [a] -> [a]
headstrict force [] = []
headstrict force xs = if force (headL xs) then xs else xs

lift11 :: (a -> Bool) -> (a -> a) -> [a] -> [a]
lift11 force f [] = []
lift11 force f (x:xs) = headstrict force (f x : lift11 force f xs)

lift21 :: (a -> Bool) -> (a -> a -> a) -> [a] -> [a] -> [a]
lift21 force f (y:ys) (z:zs) =
   (f y z : lift21 force f ys zs)

-- Words

word21 :: Int -> (a -> b -> c) -> [a] -> [b] -> [c]
word21 0 f as bs = []
word21 k f as bs =
  f (headL as) (headL bs) : word21 (k-1) f (tailL as) (tailL bs)

-- Conversions

transL :: [[a]] -> [[a]]
transL xs =
  if orB (map null xs)
    then []
    else map headL xs : transL (map tailL xs)

ntrans :: Int -> [[a]] -> [[a]]
ntrans 0 xs = []
ntrans i xs = map headL xs : ntrans (i-1) (map tailL xs)

showI :: Int -> [Int]
showI n = if n < 0 then 45 : showP (0-n) else showP n
  where showP k = if k < 10 then [48+k] else append (showP (div k 10)) [48 + mod k 10]

dec :: Int -> Int -> [Int]
dec k n =
  if i < k then append (rept (k-i) 32) xs else xs
  where xs = showI n
        i = length xs

ibits :: Int -> Int -> [Int]
ibits n i = revL (f_ibits n i)
  where f_ibits 0 i' = []
        f_ibits n' i' = mod i' 2 : f_ibits (n'-1) (div i' 2)

bitsi :: [Int] -> Int
bitsi = f_bitsi 0
  where f_bitsi i [] = i
        f_bitsi i (b:bs) = f_bitsi (2*i+b) bs

intrep :: [B] -> [Int]
intrep bs = map bitsi (transL bs)

-- Formatting

rept :: Int -> a -> [a]
rept 0 x = []
rept i x = x : rept (i-1) x

format :: Int -> [[[a]]] -> [a]
format limit = concat . takeL limit . map concat . transL

fmtW :: Int -> W -> [[Int]]
fmtW i xs = fmtDec i (intrep xs)

fmtDec :: Int -> [Int] -> [[Int]]
fmtDec w = map (dec w)

fmtB :: B -> [[Int]]
fmtB = map (dec 1)

fmtInt :: Int -> [Int] -> [[Int]]
fmtInt i = map (dec i)

fmtStr :: [Int] -> [[Int]]
fmtStr s = s : fmtStr s

-- main: wordsize 32 (nofib FAST)

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastWord, simWord :: Int
fastWord = 32
simWord = 8

bench = hashS (go simWord)

main :: Int
main = bench
