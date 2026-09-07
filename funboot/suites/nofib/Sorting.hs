-- Sorting.hs - nofib spectral/sorting (Main + Sort), verbatim port to the
-- NanoPrelude dialect. The input is the benchmark's own Main.hs source
-- (nofib FAST opts: 600 Main.hs), embedded byte-exact as inputFile. Glue
-- only: the eight Ord-polymorphic sorts are monomorphized to [Int] lines
-- with lexicographic string comparison (derived list Ord), partition/
-- intersperse/lines/unlines as local helpers, and the printed value is the
-- benchmark's own NofibUtils.hash of the mangled output.
module Sorting where
import Prelude()
import NanoPrelude

type Str = [Int]

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []

-- lexicographic Ord on [Int], as derived for String
cmpS :: Str -> Str -> Int
cmpS []     []     = 0
cmpS []     (_:_)  = 0-1
cmpS (_:_)  []     = 1
cmpS (a:as) (b:bs) = if a < b then 0-1 else if a > b then 1 else cmpS as bs

leS, ltS, gtS, geS, eqS :: Str -> Str -> Bool
leS a b = cmpS a b <= 0
ltS a b = cmpS a b < 0
gtS a b = cmpS a b > 0
geS a b = cmpS a b >= 0
eqS a b = cmpS a b == 0

partitionL :: (a -> Bool) -> [a] -> ([a],[a])
partitionL p = foldr (\x (ts,fs) -> if p x then (x:ts,fs) else (ts,x:fs)) ([],[])

intersperseL :: a -> [a] -> [a]
intersperseL _   []     = []
intersperseL _   [x]    = [x]
intersperseL sep (x:xs) = x : sep : intersperseL sep xs

linesL :: Str -> [Str]
linesL [] = []
linesL s  = go [] s
  where go acc []      = [revL acc]
        go acc (c:cs)  = if c == 10 then revL acc : linesL cs else go (c:acc) cs

unlinesL :: [Str] -> Str
unlinesL = concat . map (\l -> append l [10])

-- Sort.hs, monomorphized to Str
quickSort :: [Str] -> [Str]
quickSort []     = []
quickSort (x:xs) = append (quickSort lo) (x : quickSort hi)
    where
        lo = [ y | y <- xs, y `leS` x ]
        hi = [ y | y <- xs, y `gtS` x ]

quickSort2 :: [Str] -> [Str]
quickSort2 []     = []
quickSort2 (x:xs) = append (quickSort2 lo) (x : quickSort2 hi)
    where
        (lo, hi) = partitionL (geS x) xs

quickerSort :: [Str] -> [Str]
quickerSort []     = []
quickerSort [x]    = [x]
quickerSort (x:xs) = split x [] [] xs
  where
    split x' lo hi []     = append (quickerSort lo) (x' : quickerSort hi)
    split x' lo hi (y:ys) = if y `leS` x' then split x' (y:lo) hi ys
                            else split x' lo (y:hi) ys

insertSort :: [Str] -> [Str]
insertSort []     = []
insertSort (x:xs) = trins [] [x] xs
  where
    trins rev []       (y:ys) = trins [] (append (revL rev) [y]) ys
    trins rev xs'      []     = append (revL rev) xs'
    trins rev (x':xs') (y:ys) = if x' `ltS` y then trins (x':rev) xs' (y:ys)
                                else trins [] (append (revL rev) (y:x':xs')) ys

data Tree = Tip | Branch Str Tree Tree

treeSort :: [Str] -> [Str]
treeSort = readTree . mkTree
  where
    mkTree = foldr to_tree Tip
      where
        to_tree x Tip            = Branch x Tip Tip
        to_tree x (Branch y l r) = if x `leS` y then Branch y (to_tree x l) r
                                   else Branch y l (to_tree x r)

    readTree Tip            = []
    readTree (Branch x l r) = append (readTree l) (x : readTree r)

data Tree2 = Tip2 | Twig2 Str | Branch2 Str Tree2 Tree2

treeSort2 :: [Str] -> [Str]
treeSort2 = readTree . mkTree
  where
    mkTree = foldr to_tree Tip2
      where
        to_tree x Tip2            = Twig2 x
        to_tree x (Twig2 y)       = if x `leS` y then Branch2 y (Twig2 x) Tip2
                                    else Branch2 y Tip2 (Twig2 x)
        to_tree x (Branch2 y l r) = if x `leS` y then Branch2 y (to_tree x l) r
                                    else Branch2 y l (to_tree x r)

    readTree Tip2             = []
    readTree (Twig2 x)        = [x]
    readTree (Branch2 x l r)  = append (readTree l) (x : readTree r)

heapSort :: [Str] -> [Str]
heapSort xs = clear (heap 0 xs)
  where
    heap _ []      = Tip
    heap k (x:xs') = to_heap k x (heap (k+1) xs')

    to_heap _ x Tip            = Branch x Tip Tip
    to_heap k x (Branch y l r) =
      if x `leS` y && oddI k then Branch x (to_heap (div2 k) y l) r
      else if x `leS` y      then Branch x l (to_heap (div2 k) y r)
      else if oddI k         then Branch y (to_heap (div2 k) x l) r
      else                        Branch y l (to_heap (div2 k) x r)

    clear Tip            = []
    clear (Branch x l r) = x : clear (mix l r)

    mix Tip r = r
    mix l Tip = l
    mix t1 t2 = case t1 of
      Branch x l1 r1 -> case t2 of
        Branch y l2 r2 -> if x `leS` y then Branch x (mix l1 r1) t2
                          else Branch y t1 (mix l2 r2)

    oddI k = mod k 2 == 1
    div2 k = div k 2

mergeSort :: [Str] -> [Str]
mergeSort = merge_lists . (runsplit [])
  where
    runsplit []        []     = []
    runsplit run       []     = [run]
    runsplit []        (x:xs) = runsplit [x] xs
    runsplit [r]       (x:xs) = if x `gtS` r then runsplit [r,x] xs
                                else runsplit (x:[r]) xs
    runsplit rl@(r:_)  (x:xs) = if x `leS` r then runsplit (x:rl) xs
                                else rl : (runsplit [x] xs)

    merge_lists []     = []
    merge_lists (x:xs) = merge x (merge_lists xs)

    merge [] ys = ys
    merge xs [] = xs
    merge xl@(x:xs) yl@(y:ys) = if x `eqS` y then x : y : (merge xs ys)
                                else if x `ltS` y then x : (merge xs yl)
                                else y : (merge xl ys)

-- Main.hs
mangle :: Str -> Str
mangle inpt
  = (unlinesL . sort . linesL) inpt
  where
    sort = foldr (.) id (intersperseL revL sorts)
    sorts =
      [ heapSort
      , insertSort
      , mergeSort
      , quickSort
      , quickSort2
      , quickerSort
      , treeSort
      , treeSort2
      ]

hash :: Str -> Int
hash = foldl (\acc c -> c + acc*31) 0

-- the input file: spectral/sorting/Main.hs, byte-exact
inputFile :: Str
inputFile = [109,111,100,117,108,101,32,77,97,105,110,32,119,104,101,114,101,10,10,105,109,112,111,114,116,32,83,111,114,116,10,10,105,109,112,111,114,116,32,67,111,110,116,114,111,108,46,77,111,110,97,100,32,40,114,101,112,108,105,99,97,116,101,77,95,41,10,105,109,112,111,114,116,32,68,97,116,97,46,76,105,115,116,32,40,105,110,116,101,114,115,112,101,114,115,101,41,10,105,109,112,111,114,116,32,83,121,115,116,101,109,46,69,110,118,105,114,111,110,109,101,110,116,32,40,103,101,116,65,114,103,115,41,10,105,109,112,111,114,116,32,78,111,102,105,98,85,116,105,108,115,32,40,104,97,115,104,41,10,10,109,97,105,110,32,61,32,100,111,10,32,32,40,110,58,95,41,32,60,45,32,103,101,116,65,114,103,115,10,32,32,114,101,112,108,105,99,97,116,101,77,95,32,40,114,101,97,100,32,110,41,32,36,32,100,111,10,32,32,32,32,40,95,58,115,58,95,41,32,60,45,32,103,101,116,65,114,103,115,10,32,32,32,32,102,32,60,45,32,114,101,97,100,70,105,108,101,32,115,10,32,32,32,32,112,114,105,110,116,32,40,104,97,115,104,32,40,109,97,110,103,108,101,32,102,41,41,10,10,109,97,110,103,108,101,32,58,58,32,83,116,114,105,110,103,123,45,105,110,112,117,116,32,116,111,32,115,111,114,116,45,125,32,45,62,32,83,116,114,105,110,103,123,45,111,117,116,112,117,116,45,125,10,109,97,110,103,108,101,32,105,110,112,116,10,32,32,61,32,40,117,110,108,105,110,101,115,32,46,32,115,111,114,116,32,46,32,108,105,110,101,115,41,32,105,110,112,116,10,32,32,119,104,101,114,101,10,32,32,32,32,115,111,114,116,32,61,32,102,111,108,100,114,32,40,46,41,32,105,100,32,40,105,110,116,101,114,115,112,101,114,115,101,32,114,101,118,101,114,115,101,32,115,111,114,116,115,41,10,32,32,32,32,115,111,114,116,115,32,61,10,32,32,32,32,32,32,91,32,104,101,97,112,83,111,114,116,10,32,32,32,32,32,32,44,32,105,110,115,101,114,116,83,111,114,116,10,32,32,32,32,32,32,44,32,109,101,114,103,101,83,111,114,116,10,32,32,32,32,32,32,44,32,113,117,105,99,107,83,111,114,116,10,32,32,32,32,32,32,44,32,113,117,105,99,107,83,111,114,116,50,10,32,32,32,32,32,32,44,32,113,117,105,99,107,101,114,83,111,114,116,10,32,32,32,32,32,32,44,32,116,114,101,101,83,111,114,116,10,32,32,32,32,32,32,44,32,116,114,101,101,83,111,114,116,50,10,32,32,32,32,32,32,93,10]

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastLines, simLines :: Int
fastLines = 615  -- whole Main.hs, 30 lines
simLines = 6

bench = hash (mangle (unlinesL (takeL simLines (linesL inputFile))))

main :: Int
main = bench

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }
