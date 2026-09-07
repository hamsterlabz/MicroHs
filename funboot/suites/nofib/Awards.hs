-- Awards.hs - nofib spectral/awards (Main + QSort), verbatim port to the
-- NanoPrelude dialect. nofib FAST opts: 2000 (forM_ [1..2000], i mod 100
-- varies the scores, so the loop is real work and is kept). Glue only:
-- QSort's Ord instance monomorphized to (Int,[Int]) with the derived
-- lexicographic order, Data.List (\\) as a local helper, award names as
-- [Int] strings, and each print consumed into a running structural hash.
module Awards where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

-- QSort.hs (sortLe/qsort verbatim; predicate-parameterized)
sortLe :: (a -> a -> Bool) -> [a] -> [a]
sortLe le l = qsort le l []

qsort :: (a -> a -> Bool) -> [a] -> [a] -> [a]
qsort le []     r = r
qsort le [x]    r = x:r
qsort le (x:xs) r = qpart le x xs [] [] r

qpart :: (a -> a -> Bool) -> a -> [a] -> [a] -> [a] -> [a] -> [a]
qpart le x [] rlt rge r =
    rqsort le rlt (x:rqsort le rge r)
qpart le x (y:ys) rlt rge r =
    if le x y then
        qpart le x ys rlt (y:rge) r
    else
        qpart le x ys (y:rlt) rge r

rqsort :: (a -> a -> Bool) -> [a] -> [a] -> [a]
rqsort le []     r = r
rqsort le [x]    r = x:r
rqsort le (x:xs) r = rqpart le x xs [] [] r

rqpart :: (a -> a -> Bool) -> a -> [a] -> [a] -> [a] -> [a] -> [a]
rqpart le x [] rle rgt r =
    qsort le rle (x:qsort le rgt r)
rqpart le x (y:ys) rle rgt r =
    if le y x then
        rqpart le x ys (y:rle) rgt r
    else
        rqpart le x ys rle (y:rgt) r

-- derived Ord (<=) on (Int,[Int])
leL :: [Int] -> [Int] -> Bool
leL []     _      = True
leL (_:_)  []     = False
leL (a:as) (b:bs) = if a < b then True else if a > b then False else leL as bs

leP :: (Int,[Int]) -> (Int,[Int]) -> Bool
leP (s1,p1) (s2,p2) = if s1 < s2 then True else if s1 > s2 then False else leL p1 p2

sort :: [(Int,[Int])] -> [(Int,[Int])]
sort l = qsort leP l []

-- Data.List (\\)
deleteL :: Int -> [Int] -> [Int]
deleteL _ []     = []
deleteL y (x:xs) = if x == y then xs else x : deleteL y xs

diffL :: [Int] -> [Int] -> [Int]
diffL = foldl (\acc y -> deleteL y acc)

headL :: [a] -> a
headL (x:_) = x

-- Main.hs
perms :: Int -> [Int] -> [[Int]]
perms m [] = []
perms 1 l  = map (\x -> [x]) l
perms m (n:ns) = append (map (\rest -> n : rest) (perms (m-1) ns)) (perms m ns)

type Award = ([Int], (Int,[Int]))

awards :: [Int] -> [Award]
awards scores =
        append (award (gold,70)) (append (award (silver,60)) (award (bronze,50)))
        where sumscores = map (\p -> (sum p, p)) (perms 3 scores)
              atleast threshold = filter (\(s,p) -> s >= threshold) sumscores
              award (name,threshold) = map (\ps -> (name,ps)) (sort (atleast threshold))

gold, silver, bronze :: [Int]
gold   = [71,111,108,100]
silver = [83,105,108,118,101,114]
bronze = [66,114,111,110,122,101]

findawards :: [Int] -> [Award]
findawards scores =
  if null theawards then []
  else firstaward : findawards (diffL scores perm)
        where firstaward = headL theawards
              (_, (_, perm)) = headL theawards
              theawards = awards scores

findallawards :: [([Int],[Int])] -> [([Int],[Award])]
findallawards competitors =
        map (\(name,scores) -> (name,findawards scores)) competitors

competitors :: Int -> [([Int],[Int])]
competitors i =
  [ ([83,105,109,111,110],[35,27,40,i,34,21])                     -- "Simon"
  , ([72,97,110,115],[23,19,45,i,17,10,5,8,14])                   -- "Hans"
  , ([80,104,105,108],[1,18,i,20,21,19,34,8,16,21])               -- "Phil"
  , ([75,101,118,105,110],[9,23,17,54,i,41,9,18,14])              -- "Kevin"
  ]

-- output boundary: consume each iteration's printed structure
hashStr :: Int -> [Int] -> Int
hashStr = foldl (\acc c -> c + acc*31)

hashAward :: Int -> Award -> Int
hashAward acc (name,(s,p)) = hashStr (hashStr acc name * 31 + s) p

hashAll :: Int -> [([Int],[Award])] -> Int
hashAll = foldl (\acc (name,aws) -> foldl hashAward (hashStr acc name) aws)

nIter :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastIter, simIter :: Int
fastIter = 2000
simIter = 6

nIter = simIter

loop :: Int -> Int -> Int
loop acc i = if i > nIter then acc
             else loop (hashAll acc (findallawards (competitors (mod i 100)))) (i+1)

bench :: Int
bench = loop 0 1

main :: Int
main = bench
