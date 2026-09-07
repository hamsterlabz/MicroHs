-- Life.hs - nofib spectral/life, NanoPrelude dialect.
-- Board size 15 (nofib FAST input). Strings are [Int] character lists;
-- the benchmark result is the length of the displayed last generation,
-- exactly as in the original main.
module Life where
import Prelude()
import NanoPrelude

sz :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastSz, simSz :: Int
fastSz = 15
simSz = 6

sz = simSz

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

tailL :: [a] -> [a]
tailL (_:xs) = xs

zip3L :: [a] -> [b] -> [c] -> [(a,b,c)]
zip3L (a:as) (b:bs) (c:cs) = (a,b,c) : zip3L as bs cs
zip3L _ _ _ = []

zipWith3L :: (a -> b -> c -> d) -> [a] -> [b] -> [c] -> [d]
zipWith3L f (a:as) (b:bs) (c:cs) = f a b c : zipWith3L f as bs cs
zipWith3L _ _ _ _ = []

start :: [[Int]]
start = [[],[],[],[],[],[],[],[],[],[],[],[],[],[],
         [0,0,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0,1,1,1,1,1,0]]

copy :: Int -> a -> [a]
copy n x = if n == 0 then [] else x : copy (n-1) x

shiftr :: a -> [a] -> [a]
shiftr x xs = append [x] (init xs)

shiftl :: a -> [a] -> [a]
shiftl x xs = append (tailL xs) [x]

shift :: a -> [a] -> [(a,a,a)]
shift x xs = zip3L (shiftr x xs) xs (shiftl x xs)

elt :: (Int,Int,Int) -> (Int,Int,Int) -> (Int,Int,Int) -> Int
elt (a,b,c) (d,e,f) (g,h,i) =
  if tot < 2 || tot > 3 then 0
  else if tot == 3 then 1
  else e
  where tot = a+b+c+d+f+g+h+i

row :: ([Int],[Int],[Int]) -> [Int]
row (lst,ths,nxt) = zipWith3L elt (shift 0 lst) (shift 0 ths) (shift 0 nxt)

gen :: Int -> [[Int]] -> [[Int]]
gen n board = map row (shift (copy n 0) board)

-- display: character codes; 10 = newline, 32 = space, 111 = 'o'
star :: Int -> [Int]
star 0 = [32,32]
star 1 = [32,111]

glue :: [Int] -> [Int] -> [Int] -> [Int]
glue s xs ys = append xs (append s ys)

showN :: Int -> [Int]
showN n = if n < 10 then [48+n] else append (showN (div n 10)) [48 + mod n 10]

disp :: ([Int],[[Int]]) -> [Int]
disp (g, xss) =
  append g (append [10,10]
    (foldr (glue [10]) [] (map (concat . map star) xss)))

eqRow :: [Int] -> [Int] -> Bool
eqRow []     []     = True
eqRow (a:as) (b:bs) = a == b && eqRow as bs
eqRow _      _      = False

eqB :: [[Int]] -> [[Int]] -> Bool
eqB []     []     = True
eqB (r:rs) (s:ss) = eqRow r s && eqB rs ss
eqB _      _      = False

limit :: [[[Int]]] -> [[[Int]]]
limit (x:y:xs) = if eqB x y then [x] else x : limit (y:xs)

iterateL :: (a -> a) -> a -> [a]
iterateL f x = x : iterateL f (f x)

upfrom :: Int -> [Int]
upfrom n = n : upfrom (n+1)

initial :: [[Int]]
initial = takeL sz (append (map (\r -> takeL sz (append r (copy sz 0))) start)
                          (copy sz (copy sz 0)))

generations :: [[Int]]
generations = map disp (zip (map showN (upfrom 0))
                            (limit (iterateL (gen sz) initial)))

bench :: Int
bench = length (lastL generations)

main :: Int
main = bench

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

lastL :: [a] -> a
lastL [x]    = x
lastL (_:xs) = lastL xs
