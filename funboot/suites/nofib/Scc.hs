-- Scc.hs - nofib spectral/scc, verbatim port to the NanoPrelude dialect
-- (Main + Digraph in one module; Digraph carries no state). Glue only:
-- elem/++ as local elemL/append, the printed [[Int]] rendered to its exact
-- Show string and consumed with the nofib hash.
module Scc where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

elemL :: Int -> [Int] -> Bool
elemL x = any (\y -> x == y)

type Edge = (Int, Int)

stronglyConnComp :: [Edge] -> [Int] -> [[Int]]
stronglyConnComp es vs
  = snd (span_tree (new_range reversed_edges)
                   ([],[])
                   ( snd (dfs (new_range es) ([],[]) vs) )
        )
 where
   reversed_edges = map swap es

   swap (x,y) = (y, x)

   new_range    []       w = []
   new_range ((x,y):xys) w
       = if x==w
         then (y : (new_range xys w))
         else (new_range xys w)

   span_tree r (vs',ns) []   = (vs',ns)
   span_tree r (vs',ns) (x:xs)
       = if x `elemL` vs' then span_tree r (vs',ns) xs
         else span_tree r (vs'',(x:ns'):ns) xs
         where
           (vs'',ns') = dfs r (x:vs',[]) (r x)

dfs :: (Int -> [Int]) -> ([Int], [Int]) -> [Int] -> ([Int], [Int])
dfs r (vs,ns)   []   = (vs,ns)
dfs r (vs,ns) (x:xs) = if x `elemL` vs then dfs r (vs,ns) xs
                       else dfs r (vs',append (x:ns') ns) xs
                                   where
                                     (vs',ns') = dfs r (x:vs,[]) (r x)

vertices :: [Int]
vertices = [1,2,3,4,5,6,7]

edges :: [Edge]
edges = [(2, 1),
         (3, 2),
         (3, 4),
         (3, 7),
         (4, 3),
         (5, 1),
         (5, 6),
         (5, 7),
         (6, 5),
         (7, 6)]

-- output boundary: render as Show would, hash as nofib does
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
bench = hashS (append (showListList (stronglyConnComp edges vertices)) [10])

main :: Int
main = bench
