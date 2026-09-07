-- Cichelli.hs - nofib spectral/cichelli (Main + Prog + Auxil + Key), verbatim
-- port to the NanoPrelude dialect. Keys are the Haskell keyword set from
-- Key.lhs. nofib FAST opts: 6 (mapM_ (putStr . prog) [1..6]; n mod 2 varies
-- the key list, so the loop is real work and is kept). Glue only: Char as
-- Int code, min/max/head/last/take as local helpers, the Show instance of
-- Status rendered byte-exact, and the putStr stream consumed with the nofib
-- hash.
module Cichelli where
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

minI, maxI :: Int -> Int -> Int
minI a b = if a <= b then a else b
maxI a b = if a >= b then a else b

-- Key.lhs: the active key set (Haskell keywords)
keys :: [[Int]]
keys = [ [99,97,115,101]                                -- case
       , [99,108,97,115,115]                            -- class
       , [100,97,116,97]                                -- data
       , [100,101,102,97,117,108,116]                   -- default
       , [100,101,114,105,118,105,110,103]              -- deriving
       , [101,108,115,101]                              -- else
       , [104,105,100,105,110,103]                      -- hiding
       , [105,102]                                      -- if
       , [105,109,112,111,114,116]                      -- import
       , [105,110]                                      -- in
       , [105,110,102,105,120]                          -- infix
       , [105,110,102,105,120,108]                      -- infixl
       , [105,110,115,116,97,110,99,101]                -- instance
       , [105,110,116,101,114,102,97,99,101]            -- interface
       , [108,101,116]                                  -- let
       , [109,111,100,117,108,101]                      -- module
       , [111,102]                                      -- of
       , [114,101,110,97,109,105,110,103]               -- renaming
       , [116,104,101,110]                              -- then
       , [116,111]                                      -- to
       , [116,121,112,101]                              -- type
       , [119,104,101,114,101]                          -- where
       ]

-- Auxil.hs
data Key = K [Int] Int Int Int
data HashSet = H (Maybe Int) (Maybe Int) [Int]
type HashFun = [(Int,Int)]

ends :: Key -> [Int]
ends (K _ a z _) = [a,z]

morefreq :: Key -> Key -> Bool
morefreq (K _ a x _) (K _ b y _) = freq a + freq x > freq b + freq y

freq :: Int -> Int
freq c = assoc c freqtab

assoc :: Int -> [(Int,Int)] -> Int
assoc x ((y,z):yzs) = if x == y then z else assoc x yzs

assocm :: Int -> [(Int,Int)] -> Maybe Int
assocm x [] = Nothing
assocm x ((y,z):yzs) = if x == y then Just z else assocm x yzs

freqtab :: [(Int, Int)]
freqtab = histo (concat (map ends (attribkeys keys)))

histo :: [Int] -> [(Int,Int)]
histo = foldr histins []
        where
        histins x [] = [(x,1)]
        histins x (yn:yns) = case yn of
          (y,n) -> if x==y then (y,n+1):yns
                   else yn:histins x yns

maxval :: Int
maxval = length freqtab

subset :: [Int] -> [Int] -> Bool
subset xs ys = all (\x -> member x ys) xs

union :: [Int] -> [Int] -> [Int]
union xs ys = append xs [y | y <- ys, not (member y xs)]

attribkeys :: [[Int]] -> [Key]
attribkeys ks = map (\k -> K k (headL k) (lastL k) (length k)) ks

hinsert :: Int -> HashSet -> Maybe HashSet
hinsert h (H lo hi hs) =
    if member h hs || 1 + hi'- lo' > numberofkeys then Nothing
    else Just (H (Just lo') (Just hi') (h:hs))
    where
    lo' = minm lo h
    hi' = maxm hi h

minm, maxm :: Maybe Int -> Int -> Int
minm Nothing y = y
minm (Just x) y = minI x y
maxm Nothing y = y
maxm (Just x) y = maxI x y

member :: Int -> [Int] -> Bool
member _ [] = False
member x (y:ys) = x == y || member x ys

hash :: HashFun -> Key -> Int
hash cvs (K _ a z n) = n + assoc a cvs + assoc z cvs

numberofkeys :: Int
numberofkeys = length keys

partition' :: (a -> Bool) -> [a] -> ([a],[a])
partition' p = foldr select ([],[])
              where select x (ts,fs) = if p x then (x:ts,fs) else (ts,x:fs)

freqsorted :: [Key] -> [Key]
freqsorted = \x -> x

blocked :: [Key] -> [Key]
blocked = blocked' []

blocked' :: [Int] -> [Key] -> [Key]
blocked' ds [] = []
blocked' ds (k : ks) = k : append det (blocked' ds' rest)
                     where
                     (det,rest) = partition' (\x -> subset (ends x) ds') ks
                     ds' = union ds (ends k)

-- Prog.hs
data Status = NotEver Int | YesIts Int HashFun

type FeedBack = Status

cichelli :: Int -> FeedBack
cichelli n = findhash hashkeys
                where
                attribkeys' = attribkeys (append keys (takeL (mod n 2) keys))
                hashkeys = (blocked . freqsorted) attribkeys'

findhash :: [Key] -> FeedBack
findhash = findhash' (H Nothing Nothing []) []

findhash' :: HashSet -> HashFun -> [Key] -> FeedBack
findhash' keyHashSet charAssocs [] = YesIts 1 charAssocs
findhash' keyHashSet charAssocs (k@(K s a z n):ks) =
  ( case (assocm a charAssocs, assocm z charAssocs) of
          (Nothing,Nothing) -> if a==z then
                                firstSuccess (\m -> try [(a,m)]) (fromTo 0 maxval)
                                else
                                firstSuccess (\(m,n') -> try [(a,m),(z,n')])
                                            [(m,n') | m <- fromTo 0 maxval, n' <- fromTo 0 maxval]
          (Nothing,Just zc) -> firstSuccess (\m -> try [(a,m)]) (fromTo 0 maxval)
          (Just ac,Nothing) -> firstSuccess (\n' -> try [(z,n')]) (fromTo 0 maxval)
          (Just ac,Just zc) -> try [] )
  where
  try newAssocs = ( case hinsert (hash newCharAssocs k) keyHashSet of
             Nothing -> NotEver 1
             Just newKeyHashSet -> findhash' newKeyHashSet newCharAssocs ks )
             where
             newCharAssocs = append newAssocs charAssocs

firstSuccess :: (a -> FeedBack) -> [a] -> FeedBack
firstSuccess f possibles = first 0 (map f possibles)

first :: Int -> [FeedBack] -> FeedBack
first k [] = NotEver k
first k (a:l) = case a of
                (YesIts leaves y) -> YesIts (k+leaves) y
                (NotEver leaves)  -> first (k+leaves) l

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

-- Show (Status HashFun), rendered byte-exact
showN :: Int -> [Int]
showN k = if k < 10 then [48+k] else append (showN (div k 10)) [48 + mod k 10]

showPair :: (Int,Int) -> [Int]
showPair (c,v) = append [40,39,c,39,44] (append (showN v) [41])   -- ('c',v)

showHF :: HashFun -> [Int]
showHF []     = [91,93]
showHF (x:xs) = 91 : append (showPair x) (go xs)
  where go []     = [93]
        go (y:ys) = 44 : append (showPair y) (go ys)

showStatus :: Status -> [Int]
showStatus (NotEver i)  = append [78,111,116,69,118,101,114,32] (showN i)          -- "NotEver "
showStatus (YesIts i a) = append [89,101,115,73,116,115,32]                        -- "YesIts "
                          (append (showN i) (32 : showHF a))

prog :: Int -> [Int]
prog n = showStatus (cichelli n)

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastIter, simIter :: Int
fastIter = 6
simIter = 1

bench = hashS (concat (map prog (fromTo 1 simIter)))

main :: Int
main = bench
