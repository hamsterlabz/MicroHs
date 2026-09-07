-- Constraints.hs - nofib spectral/constraints (Tolmach/Nordin CSP solver),
-- verbatim port to the NanoPrelude dialect. nofib FAST opts: 6 (queens 6),
-- all five labelers bt/bm/bjbt/bjbt'/fc. The forM_ [1..240] wrapper repeats
-- identical work and is dropped. Figure 7 (btr randomization) is not
-- reachable from main and is omitted. Glue only: the CSP record as
-- constructor + accessors, derived Eq/Ord on Assign by hand, Data.List
-- union/notElem and head/tail/(!!)/zipWith as locals, and the five printed
-- lengths folded into one Int.
module Constraints where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

headL :: [a] -> a
headL (x:_) = x

tailL :: [a] -> [a]
tailL (_:xs) = xs

idx :: [a] -> Int -> a
idx (x:_)  0 = x
idx (_:xs) n = idx xs (n-1)

zipWithL :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithL f (a:as) (b:bs) = f a b : zipWithL f as bs
zipWithL _ _ _ = []

absI :: Int -> Int
absI x = if x < 0 then 0-x else x

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

-----------------------------
-- Figure 1. CSPs in Haskell.
-----------------------------

type Var = Int
type Value = Int

data Assign = Var := Value

eqA :: Assign -> Assign -> Bool
eqA (a := b) (c := d) = a == c && b == d

-- derived Ord: level first, then value
gtA :: Assign -> Assign -> Bool
gtA (a := b) (c := d) = a > c || (a == c && b > d)

type Relation = Assign -> Assign -> Bool

data CSP = CSP Int Int Relation

vars, vals :: CSP -> Int
vars (CSP a _ _) = a
vals (CSP _ b _) = b

rel :: CSP -> Relation
rel (CSP _ _ r) = r

type State = [Assign]

level :: Assign -> Var
level (var := val) = var

value :: Assign -> Value
value (var := val) = val

maxLevel :: State -> Var
maxLevel [] = 0
maxLevel ((var := val):_) = var

complete :: CSP -> State -> Bool
complete csp s = maxLevel s == vars csp

generate :: CSP -> [State]
generate csp = g (vars csp)
  where g 0 = [[]]
        g var = [ (var := val):st | val <- fromTo 1 (vals csp), st <- g (var-1) ]

inconsistencies :: CSP -> State -> [(Var,Var)]
inconsistencies csp as = [ (level a, level b) | a <- as, b <- revL as, gtA a b, not (rel csp a b) ]

consistent :: CSP -> State -> Bool
consistent csp = null . (inconsistencies csp)

test :: CSP -> [State] -> [State]
test csp = filter (consistent csp)

solver :: CSP -> [State]
solver csp = test csp candidates
  where candidates = generate csp

queens :: Int -> CSP
queens n = CSP n n safe
  where safe (i := m) (j := n') = (m /= n') && absI (i - j) /= absI (m - n')

-------------------------------
-- Figure 2. Trees in Haskell.
-------------------------------

data Tree a = Node a [Tree a]

label :: Tree a -> a
label (Node lab _) = lab

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f (Node a cs) = Node (f a) (map (mapTree f) cs)

foldTree :: (a -> [b] -> b) -> Tree a -> b
foldTree f (Node a cs) = f a (map (foldTree f) cs)

filterTree :: (a -> Bool) -> Tree a -> Tree a
filterTree p = foldTree f
  where f a cs = Node a (filter (p . label) cs)

prune :: (a -> Bool) -> Tree a -> Tree a
prune p = filterTree (not . p)

leaves :: Tree a -> [a]
leaves (Node leaf []) = [leaf]
leaves (Node _ cs) = concat (map leaves cs)

initTree :: (a -> [a]) -> a -> Tree a
initTree f a = Node a (map (initTree f) (f a))

--------------------------------------------------
-- Figure 3. Simple backtracking solver for CSPs.
--------------------------------------------------

mkTree :: CSP -> Tree State
mkTree csp = initTree next []
  where next ss = [ ((maxLevel ss + 1) := j):ss | maxLevel ss < vars csp, j <- fromTo 1 (vals csp) ]

earliestInconsistency :: CSP -> State -> Maybe (Var,Var)
earliestInconsistency csp [] = Nothing
earliestInconsistency csp (a:as) =
        case filter (\b -> not (rel csp a b)) (revL as) of
          [] -> Nothing
          (b:_) -> Just (level a, level b)

labelInconsistencies :: CSP -> Tree State -> Tree (State,Maybe (Var,Var))
labelInconsistencies csp = mapTree f
    where f s = (s,earliestInconsistency csp s)

-----------------------------------------------
-- Figure 6. Conflict-directed solving of CSPs.
-----------------------------------------------

data ConflictSet = Known [Var] | Unknown

isUnknown :: ConflictSet -> Bool
isUnknown Unknown = True
isUnknown _       = False

knownConflict :: ConflictSet -> Bool
knownConflict (Known (a:as)) = True
knownConflict _              = False

knownSolution :: ConflictSet -> Bool
knownSolution (Known []) = True
knownSolution _          = False

checkComplete :: CSP -> State -> ConflictSet
checkComplete csp s = if complete csp s then Known [] else Unknown

type Labeler = CSP -> Tree State -> Tree (State, ConflictSet)

search :: Labeler -> CSP -> [State]
search labeler csp =
  (map fst . filter (knownSolution . snd) . leaves . prune (knownConflict . snd) . labeler csp . mkTree) csp

bt :: Labeler
bt csp = mapTree f
      where f s = (s,
                   case earliestInconsistency csp s of
                     Nothing    -> checkComplete csp s
                     Just (a,b) -> Known [a,b])

-------------------------
-- Figure 8. Backmarking.
-------------------------

type Table = [Row]       -- indexed by Var
type Row = [ConflictSet] -- indexed by Value

bm :: Labeler
bm csp = mapTree fst . lookupCache csp . cacheChecks csp (emptyTable csp)

emptyTable :: CSP -> Table
emptyTable csp = [] : [[Unknown | m <- fromTo 1 (vals csp)] | n <- fromTo 1 (vars csp)]

cacheChecks :: CSP -> Table -> Tree State -> Tree (State, Table)
cacheChecks csp tbl (Node s cs) =
  Node (s, tbl) (map (cacheChecks csp (fillTable s csp (tailL tbl))) cs)

fillTable :: State -> CSP -> Table -> Table
fillTable [] csp tbl = tbl
fillTable ((var' := val'):as) csp tbl =
    zipWithL (zipWithL f) tbl [[(var,val) | val <- fromTo 1 (vals csp)] | var <- fromTo (var'+1) (vars csp)]
          where f cs (var,val) = if isUnknown cs && not (rel csp (var' := val') (var := val)) then
                                   Known [var',var]
                                 else cs

lookupCache :: CSP -> Tree (State, Table) -> Tree ((State, ConflictSet), Table)
lookupCache csp t = mapTree f t
  where f ([], tbl)      = (([], Unknown), tbl)
        f (s@(a:_), tbl) = ((s, cs), tbl)
             where cs = if isUnknown tableEntry then checkComplete csp s else tableEntry
                   tableEntry = idx (headL tbl) (value a - 1)

--------------------------------------------
-- Figure 10. Conflict-directed backjumping.
--------------------------------------------

bjbt :: Labeler
bjbt csp = bj csp . bt csp

bjbt' :: Labeler
bjbt' csp = bj' csp . bt csp

notElemL :: Int -> [Int] -> Bool
notElemL x = all (\y -> y /= x)

unionL :: [Int] -> [Int] -> [Int]
unionL xs ys = append xs [y | y <- ys, notElemL y xs]

bj :: CSP -> Tree (State, ConflictSet) -> Tree (State, ConflictSet)
bj csp = foldTree f
  where f (a, Known cs) chs = Node (a,Known cs) chs
        f (a, Unknown)  chs = Node (a,Known cs') chs
          where cs' = combine (map label chs) []

combine :: [(State, ConflictSet)] -> [Var] -> [Var]
combine []                 acc = acc
combine ((s, Known cs):css) acc =
  if notElemL (maxLevel s) cs then cs else combine css (unionL cs acc)

bj' :: CSP -> Tree (State, ConflictSet) -> Tree (State, ConflictSet)
bj' csp = foldTree f
  where f (a, Known cs) chs = Node (a,Known cs) chs
        f (a, Unknown) chs = if knownConflict cs' then Node (a,cs') [] else Node (a,cs') chs
           where cs' = Known (combine (map label chs) [])

-------------------------------
-- Figure 11. Forward checking.
-------------------------------

fc :: Labeler
fc csp = domainWipeOut csp . lookupCache csp . cacheChecks csp (emptyTable csp)

collect :: [ConflictSet] -> [Var]
collect [] = []
collect (Known cs:css) = unionL cs (collect css)
collect (Unknown:css)  = collect css

domainWipeOut :: CSP -> Tree ((State, ConflictSet), Table) -> Tree (State, ConflictSet)
domainWipeOut csp t = mapTree f t
  where f ((as, cs), tbl) = (as, cs')
          where wipedDomains = [vs | vs <- tbl, all knownConflict vs]
                cs' = if null wipedDomains then cs else Known (collect (headL wipedDomains))

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []

-- main: n = 6; try each algorithm, print length of solutions
nQ :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastQ, simQ :: Int
fastQ = 6
simQ = 4

nQ = simQ

bench :: Int
bench = foldl (\acc l -> acc*8191 + l) 0
          (map (\alg -> length (search alg (queens nQ))) [bt, bm, bjbt, bjbt', fc])

main :: Int
main = bench
