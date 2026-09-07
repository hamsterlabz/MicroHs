module NanoPrelude(
  Int,
  FloatW, Float,
  module Data.Bool_Type,
  module Data.List_Type,
  module NanoPrelude
) where

-- NanoPrelude is THE standard fun/nano prelude. It depends only on the bare builtin
-- types (Primitives.Int + the *_Type modules), NOT the full-Prelude typeclass
-- hierarchy (Data.Int/Data.Bool drag in Num/Eq/Ord/Integer/Show/Typeable). All
-- operations are monomorphic Int primitives; numeric literals default to Int.
import Prelude()
import Primitives (Int, FloatW)
import Data.Bool_Type
import Data.List_Type

seq :: forall a b . a -> b -> b
seq = primitive "seq"

try :: forall a b . a -> b -> a
try =  primitive "try"

data Cmp = EQ | LT | GT

data Maybe a = Nothing | Just a

isNothing Nothing  = True
isNothing (Just x) = False

isJust Nothing  = False
isJust (Just x) = True

fromJust (Just x) = x
fromJust Nothing = primitive "error4"

maybe n j Nothing  = n
maybe n j (Just x) = j x

id :: forall a . a -> a
id i = i

flip f y x = f x y

const c x = c

infixr 0 $

($) :: forall a b . (a -> b) -> a -> b
f $ x = f x

curry f x y = f (x, y)

uncurry f (x,y) = f x y

infixr 9 .

(.) f g x = f (g x)

-- Bool ops (monomorphic; previously re-exported from Data.Bool).
infixr 3 &&
infixr 2 ||
(||) :: Bool -> Bool -> Bool
(||) False x = x
(||) True  _ = True

(&&) :: Bool -> Bool -> Bool
(&&) False _ = False
(&&) True  x = x

not :: Bool -> Bool
not False = True
not True  = False

otherwise :: Bool
otherwise = True

infixl 6 +,-
infixl 7 *

(+) :: Int -> Int -> Int
(+) = primitive "+"

(-) :: Int -> Int -> Int
(-) = primitive "-"

(*) :: Int -> Int -> Int
(*) = primitive "*" 

infix 4 ==,/=
(==) :: Int -> Int -> Bool
(==) = primitive "=="

(/=) :: Int -> Int -> Bool
(/=) = primitive "/="

infix 4 <,<=,>,>=
(<) :: Int -> Int -> Bool
(<) = primitive "<"
(<=) :: Int -> Int -> Bool
(<=) = primitive "<="
(>) :: Int -> Int -> Bool
(>) = primitive ">"
(>=) :: Int -> Int -> Bool
(>=) = primitive ">="

negate x = 0 - x

-- Floating point. FloatW is the machine float (IEEE binary32 on rv32); the fun backend
-- lowers each primitive below to a RISC-V float atom (f+, f*, itof, ftoi, ...).
-- Like the Int ops above these are monomorphic, so the float operators carry a
-- trailing '.'. Transcendentals (exp/sqrt/sin/...) are NOT primitives on the
-- bare target (they are libc ccalls in the full Prelude); build them in the
-- client from these ops (Taylor/Newton) so the rvfun and pure-C versions stay
-- bit-identical.
type Float = FloatW

infixl 6 +., -.
infixl 7 *., /.
(+.) :: Float -> Float -> Float
(+.) = primitive "f+"
(-.) :: Float -> Float -> Float
(-.) = primitive "f-"
(*.) :: Float -> Float -> Float
(*.) = primitive "f*"
(/.) :: Float -> Float -> Float
(/.) = primitive "f/"

negateD :: Float -> Float
negateD = primitive "fneg"

infix 4 ==., /=., <., <=., >., >=.
(==.) :: Float -> Float -> Bool
(==.) = primitive "f=="
(/=.) :: Float -> Float -> Bool
(/=.) = primitive "f/="
(<.) :: Float -> Float -> Bool
(<.) = primitive "f<"
(<=.) :: Float -> Float -> Bool
(<=.) = primitive "f<="
(>.) :: Float -> Float -> Bool
(>.) = primitive "f>"
(>=.) :: Float -> Float -> Bool
(>=.) = primitive "f>="

-- sqrt is a real FD instruction (FSQRT.S) on the BB datapath FPU, so it is a
-- primitive (unlike exp/log/sin which are not instructions and must be built
-- from the ops above).
sqrtD :: Float -> Float
sqrtD = primitive "fsqrt"

-- sin/cos are real blobs on this target now (range reduction + minimax
-- polynomial, the same kernel the min-caml runtime uses). They were the one
-- gap that kept fft off the fun backend.
sinD :: Float -> Float
sinD = primitive "fsin"
cosD :: Float -> Float
cosD = primitive "fcos"

-- Int <-> Float conversions (truncating, like C's (int)/(float) casts).
fromIntD :: Int -> Float
fromIntD = primitive "itof"
truncateD :: Float -> Int
truncateD = primitive "ftoi"

absD :: Float -> Float
absD x = if x <. fromIntD 0 then negateD x else x

minD :: Float -> Float -> Float
minD x y = if x <=. y then x else y

maxD :: Float -> Float -> Float
maxD x y = if x <=. y then y else x

min x y = if x <= y then x else y

max x y = if x <= y then y else x

abs n = if 0 <= n then n else 0 - n

-- div/mod use the fun fn.div / fn.rem instructions directly (no software long
-- division). Truncating semantics — correct for non-negative operands.
quot :: Int -> Int -> Int
quot = primitive "quot"

rem :: Int -> Int -> Int
rem = primitive "rem"

div :: Int -> Int -> Int
div = quot

mod :: Int -> Int -> Int
mod = rem

divMod x y = (quot x y, rem x y)
quotRem x y = (quot x y, rem x y)
                      
succ x = x + 1

pred x = x - 1

maximum :: [Int] -> Int
maximum [] = 0
maximum (x:ys) = foldr (\ y m -> if y > m then y else m) x ys

enumFrom n = n : enumFrom (n+1)

enumFromTo l h = takeWhile (<= h) (enumFrom l)

head (x : xs) = x
head [] = primitive "error3"

tail (x : xs) = xs
tail [] = []

init :: forall a . [a] -> [a]
init [] = primitive "error1" -- error "init: []"
init [_] = []
init (x:xs) = x : init xs

takeWhile :: forall a . (a -> Bool) -> [a] -> [a]
takeWhile _ [] = []
takeWhile p (x:xs) =
  if p x then
    x : takeWhile p xs
  else
    []

map :: forall a b . (a -> b) -> [a] -> [b]
map f =
  let
    rec [] = []
    rec (a : as) = f a : rec as
  in rec
  
foldr :: forall a b . (a -> b -> b) -> b -> [a] -> b
foldr f z =
  let
    rec [] = z
    rec (x : xs) = f x (rec xs)
  in rec

foldr' _ z [] = z
foldr' f z (a:as) = f a (foldr' f z as)
  
foldl :: forall a b . (b -> a -> b) -> b -> [a] -> b
foldl _ z [] = z
foldl f z (x : xs) = foldl f (f z x) xs

concat :: forall a . [[a]] -> [a]
concat = foldr (++) []

length :: forall a . [a] -> Int
length =
  let
    rec :: forall a . Int -> [a] -> Int
    rec acc [] = acc
    rec acc (n:ns) = rec (acc+1) ns
  in rec 0

sum :: [Int] -> Int
sum = foldr (+) 0
-- sum = foldl (+) 0 -- this will make Mss result worse for SKI+

null :: forall a . [a] -> Bool
null [] = True
null _ = False

foldr1 :: forall a . (a -> a -> a) -> [a] -> a
foldr1 f [] = primitive "error0"
foldr1 f [x] = x
foldr1 f (x:xs) = f x (foldr1 f xs)

all :: forall a . (a -> Bool) -> [a] -> Bool
all p [] = True
all p (x:xs) = p x && all p xs

any :: forall a . (a -> Bool) -> [a] -> Bool
any p []       = False
any p (x : xs) = (p x) || (any p xs)

elem x []       = False
elem x (y : ys) =
  if x == y
    then True
    else elem x ys

replicate :: forall a . Int -> a -> [a]
replicate n x 
    | n <= 0    = []
    | otherwise = x : replicate (n-1) x
    
repeat x = x : repeat x
    
filter :: forall a . (a -> Bool) -> [a] -> [a]
filter p [] = []
filter p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs
    
zip :: forall a b . [a] -> [b] -> [(a, b)]
zip [] ys = []
zip (x : xs) [] = []
zip (x : xs) (y : ys) = (x, y) : zip xs ys

unzip :: forall a b . [(a, b)] -> ([a], [b])
unzip []             = ([],[])
unzip ((x, y) : xys) =
  let  u = unzip xys
  in  (x : (fst u), y : (snd u))
  
scanl :: (b -> a -> b) -> b -> [a] -> [b]
scanl f = rec
  where rec q ls = q : case ls of
                         []   -> []
                         x:xs -> rec (f q x) xs

scanl1 :: (a -> a -> a) -> [a] -> [a]
scanl1 f (x:xs) = scanl f x xs
scanl1 _ []     = []

scanr1 :: (a -> a -> a) -> [a] -> [a]
scanr1 f = rec
  where rec []     = []
        rec [x]    = [x]
        rec (x:xs) = f x q : qs
              where qs@(q:_) = rec xs
  
and []       = True
and (b : bs) = if b then and bs else False

lookup a [] = Nothing
lookup a ((b, c) : rest) =
  if a == b
    then Just c
    else lookup a rest
  
fst :: forall a b . (a, b) -> a
fst (a, _) = a

snd :: forall a b . (a, b) -> b
snd (_, b) = b

-- Effect leaves (fun IO): emitted as riscv-as-atoms -> linked RISC-V helpers.
rawPutByte :: Int -> a -> a       -- CPS: write a byte, return the continuation
rawPutByte = primitive "io.putb"

putStr :: [Int] -> a -> a            -- CPS text output
putStr s k = foldr rawPutByte k s
putStrLn :: [Int] -> a -> a
putStrLn s k = putStr s (rawPutByte 10 k)

-- Value effects (produce a result for the continuation): CPS (Int -> a) -> a.
rdcycle :: (Int -> a) -> a        -- read the cycle counter
rdcycle = primitive "rdcycle"
rdinstret :: (Int -> a) -> a      -- read retired-instruction counter
rdinstret = primitive "rdinstret"
getByte :: (Int -> a) -> a        -- read one byte from stdin (-1 = EOF)
getByte = primitive "io.getb"
