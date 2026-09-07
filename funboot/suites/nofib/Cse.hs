-- Cse.hs - nofib spectral/cse (Mark Jones's common subexpression
-- elimination; Main + StateMonad), verbatim port to the NanoPrelude
-- dialect. StateMonad.hs is already explicit state-passing and ports
-- directly. nofib FAST opts: 30000 (forM_ with i mod 6 varying the work,
-- kept). Node labels are [Int] strings; the Eq contexts are monomorphized;
-- the drawTree/showGraph printers are unreachable from main (rnf only) and
-- omitted. The rnf forcing becomes a structural hash of each LabGraph.
module Cse where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

dropWhileL :: (a -> Bool) -> [a] -> [a]
dropWhileL p [] = []
dropWhileL p l@(x:xs) = if p x then dropWhileL p xs else l

elemL :: Int -> [Int] -> Bool
elemL x = any (\y -> y == x)

eqL :: [Int] -> [Int] -> Bool
eqL []     []     = True
eqL (a:as) (b:bs) = a == b && eqL as bs
eqL _      _      = False

headI :: [a] -> a
headI (x:_) = x

-- StateMonad.hs
type SM s a = s -> (s, a)

retURN :: a -> SM s a
retURN x = \s -> (s, x)

bind :: SM s a -> (a -> SM s b) -> SM s b
m `bind` f = \s -> let (s',a) = m s in f a s'

mmapl :: (a -> SM s b) -> ([a] -> SM s [b])
mmapl f []     = retURN []
mmapl f (a:as) = f a        `bind` \b ->
                 mmapl f as `bind` \bs ->
                 retURN (b:bs)

mif :: SM s Bool -> SM s a -> SM s a -> SM s a
mif c t f = c `bind` \cond -> if cond then t else f

startingWith :: SM s a -> s -> a
m `startingWith` v = answer where (final,answer) = m v

fetch :: SM s s
fetch = \s -> (s,s)

update :: (s -> s) -> SM s s
update f = \s -> (f s, s)

set :: s -> SM s s
set s' = \s -> (s',s)

incr :: SM Int Int
incr = update (\x -> 1 + x)

-- Main.hs
data GenTree = Node [Int] [GenTree]
data LabTree = LNode (Int,[Int]) [LabTree]
type LabGraph = [ (Int, [Int], [Int]) ]

labelTree :: GenTree -> LabTree
labelTree t = label t `startingWith` 0
              where label (Node x xs) = incr           `bind` \n  ->
                                        mmapl label xs `bind` \ts ->
                                        retURN (LNode (n,x) ts)

ltGraph :: LabTree -> LabGraph
ltGraph (LNode (n,x) xs) = (n, x, map labelOf xs) : concat (map ltGraph xs)
                           where labelOf (LNode (n',x') xs') = n'

findCommon :: LabGraph -> LabGraph
findCommon = snd . foldr sim (\x -> x, [])
 where
   sim (n,s,cs) (r,lg) =
     if null ms then
       (r, append [(n,s,rcs)] lg)
     else
       (updF n (headI ms) r, lg)
         where
           ms  = [m | (m,s',cs') <- lg, eqL s s', eqL cs' rcs]
           rcs = map r cs

updF :: Int -> Int -> (Int -> Int) -> (Int -> Int)
updF x fx f y = if x == y then fx else f y

cse :: GenTree -> LabGraph
cse = findCommon . ltGraph . labelTree

-- Examples (labels as character codes)
plus, mult :: GenTree -> GenTree -> GenTree
plus x y = Node [43] [x,y]
mult x y = Node [42] [x,y]

prod :: [GenTree] -> GenTree
prod xs = Node [88] xs

zerO, a, b, c, d :: GenTree
zerO = Node [48] []
a    = Node [97] []
b    = Node [98] []
c    = Node [99] []
d    = Node [100] []

examples :: [GenTree]
examples = [example0, example1, example2, example3, example4, example5]

example0, example1, example2, example3, example4, example5 :: GenTree
example0 = a
example1 = plus a a
example2 = plus (mult a b) (mult a b)
example3 = plus (mult (plus a b) c) (plus a b)
example4 = prod (scanl plus zerO [a,b,c,d])
example5 = prod (scanrL plus zerO [a,b,c,d])

scanrL :: (a -> b -> b) -> b -> [a] -> [b]
scanrL f q0 []     = [q0]
scanrL f q0 (x:xs) = f x q : qs
                     where qs@(q:_) = scanrL f q0 xs

-- rnf boundary: structural hash of the LabGraphs
hashG :: Int -> LabGraph -> Int
hashG = foldl (\acc (n,s,cs) ->
                 foldl (\a2 x -> a2*31 + x)
                       (foldl (\a1 ch -> a1*31 + ch) (acc*31 + n) s) cs)

nIter :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastIter, simIter :: Int
fastIter = 30000
simIter = 8

nIter = simIter

loop :: Int -> Int -> Int
loop acc i = if i > nIter then acc
             else loop (foldl hashG acc (map cse (takeL (mod i 6) examples))) (i+1)

bench :: Int
bench = loop 0 1

main :: Int
main = bench
