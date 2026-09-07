-- ClausifyN.hs - nofib spectral/clausify (Runciman's clausal form), verbatim
-- port to the NanoPrelude dialect. Named ClausifyN to avoid colliding with
-- the flite Clausify bench. nofib FAST opts: 1 (one copy of the formula);
-- the forM_ [1..67] wrapper repeats identical work and is dropped. Glue
-- only: chars as codes, insert monomorphized at its two use types (symbol
-- lists and clause pairs, derived Ord by hand), and the printed clauses
-- consumed with the nofib hash.
module ClausifyN where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

repeatL :: a -> [a]
repeatL x = x : repeatL x

elemL :: Int -> [Int] -> Bool
elemL x = any (\y -> y == x)

data StackFrame = Ast Formula | Lex Int

data Formula =
  Sym Int |
  Not Formula |
  Dis Formula Formula |
  Con Formula Formula |
  Imp Formula Formula |
  Eqv Formula Formula

type Clause = ([Int],[Int])

-- separate positive and negative literals, eliminating duplicates
clause :: Formula -> Clause
clause p = clause' p ([] , [])
           where
           clause' (Dis p' q)      x   = clause' p' (clause' q x)
           clause' (Sym s)       (c,a) = (insertC s c , a)
           clause' (Not (Sym s)) (c,a) = (c , insertC s a)

-- the main pipeline
clauses :: [Int] -> [Int]
clauses = concat . map disp . unicl . split . disin . negin . elim . parse

conjunct :: Formula -> Bool
conjunct (Con p q) = True
conjunct p = False

disin :: Formula -> Formula
disin (Dis p (Con q r)) = Con (disin (Dis p q)) (disin (Dis p r))
disin (Dis (Con p q) r) = Con (disin (Dis p r)) (disin (Dis q r))
disin (Dis p q) =
  if conjunct dp || conjunct dq then disin (Dis dp dq)
  else (Dis dp dq)
  where
  dp = disin p
  dq = disin q
disin (Con p q) = Con (disin p) (disin q)
disin p = p

disp :: Clause -> [Int]
disp (l,r) = append (interleave l spaces) (append [60,61] (append (interleave spaces r) [10]))

elim :: Formula -> Formula
elim (Sym s) = Sym s
elim (Not p) = Not (elim p)
elim (Dis p q) = Dis (elim p) (elim q)
elim (Con p q) = Con (elim p) (elim q)
elim (Imp p q) = Dis (Not (elim p)) (elim q)
elim (Eqv f f') = Con (elim (Imp f f')) (elim (Imp f' f))

-- insertion into an ordered list, at the two types used
insertC :: Int -> [Int] -> [Int]
insertC x [] = [x]
insertC x p@(y:ys) =
  if x < y then x : p
  else if x > y then y : insertC x ys
  else p

-- derived Ord on ([Int],[Int]): lexicographic
cmpL :: [Int] -> [Int] -> Int
cmpL []     []     = 0
cmpL []     (_:_)  = 0-1
cmpL (_:_)  []     = 1
cmpL (a:as) (b:bs) = if a < b then 0-1 else if a > b then 1 else cmpL as bs

cmpCl :: Clause -> Clause -> Int
cmpCl (a,b) (c,d) = case cmpL a c of
                      0 -> cmpL b d
                      r -> r

insertCl :: Clause -> [Clause] -> [Clause]
insertCl x [] = [x]
insertCl x p@(y:ys) =
  case cmpCl x y of
    r -> if r < 0 then x : p
         else if r > 0 then y : insertCl x ys
         else p

interleave :: [Int] -> [Int] -> [Int]
interleave (x:xs) ys = x : interleave ys xs
interleave []     _  = []

negin :: Formula -> Formula
negin (Not (Not p)) = negin p
negin (Not (Con p q)) = Dis (negin (Not p)) (negin (Not q))
negin (Not (Dis p q)) = Con (negin (Not p)) (negin (Not q))
negin (Dis p q) = Dis (negin p) (negin q)
negin (Con p q) = Con (negin p) (negin q)
negin p = p

opri :: Int -> Int
opri 40  = 0    -- '('
opri 61  = 1    -- '='
opri 62  = 2    -- '>'
opri 124 = 3    -- '|'
opri 38  = 4    -- '&'
opri 126 = 5    -- '~'

parse :: [Int] -> Formula
parse t = f where [Ast f] = parse' t []

parse' :: [Int] -> [StackFrame] -> [StackFrame]
parse' [] s = redstar s
parse' (32:t) s = parse' t s
parse' (40:t) s = parse' t (Lex 40 : s)
parse' (41:t) s = parse' t (x:s')
                   where
                   (x : Lex 40 : s') = redstar s
parse' (c:t) s = if 97 <= c && c <= 122 then parse' t (Ast (Sym c) : s)
                 else if spri s > opri c then parse' (c:t) (red s)
                 else parse' t (Lex c : s)

red :: [StackFrame] -> [StackFrame]
red (Ast p : Lex 61  : Ast q : s) = Ast (Eqv q p) : s
red (Ast p : Lex 62  : Ast q : s) = Ast (Imp q p) : s
red (Ast p : Lex 124 : Ast q : s) = Ast (Dis q p) : s
red (Ast p : Lex 38  : Ast q : s) = Ast (Con q p) : s
red (Ast p : Lex 126 : s) = Ast (Not p) : s

redstar :: [StackFrame] -> [StackFrame]
redstar = while (\s -> spri s /= 0) red

spaces :: [Int]
spaces = repeatL 32

split :: Formula -> [Formula]
split p = split' p []
          where
          split' (Con p' q) a = split' p' (split' q a)
          split' p' a = p' : a

spri :: [StackFrame] -> Int
spri (Ast x : Lex c : s) = opri c
spri s = 0

tautclause :: Clause -> Bool
tautclause (c,a) = not (null [x | x <- c, x `elemL` a])

unicl :: [Formula] -> [Clause]
unicl a = foldr unicl' [] a
          where
          unicl' p x = if tautclause cp then x else insertCl cp x
                       where
                       cp = clause p

while :: (a -> Bool) -> (a -> a) -> a -> a
while p f x = if p x then while p f (f x) else x

-- SIM SCALE (user ruling 2026-07-30): clausal conversion of this formula is
-- exponential by design, so the number of parenthesised groups is the knob.
-- fastGroups = 3 reproduces the upstream formula byte for byte:
--   "(a = a = a) = (a = a = a) = (a = a = a)"
fastGroups, simGroups :: Int
fastGroups = 3
simGroups = 1

group1 :: [Int]
group1 = [40,97,32,61,32,97,32,61,32,97,41]     -- "(a = a = a)"

eqSep :: [Int]
eqSep = [32,61,32]                              -- " = "

formula :: [Int]
formula = joinEq simGroups
  where joinEq k = if k <= 1 then group1
                   else append group1 (append eqSep (joinEq (k-1)))

res :: Int -> [Int]
res n = concat (map clauses xs)
 where xs = takeL n (repeatL formula)

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS (res 1)

main :: Int
main = bench
