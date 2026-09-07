-- GenRegexps.hs - nofib imaginary/gen_regexps, NanoPrelude dialect.
-- Strings are lists: Char is an Int code, String is [Int] - ordinary graph
-- structure, per the strings-are-lists ruling. The full rule set is ported
-- (constant, alphabetic [a-b], numeric <u-v> incl. show/pad via divMod);
-- the result is nofib's own NofibUtils.hash (foldl acc*31+c) over the
-- concatenated expansions, so it is one Int on both backends.
-- Pattern is nofib FAST: [a-j][a-j][a-j][0-9]. The replicateM_ 500 timing
-- wrapper is dropped.
module GenRegexps where
import Prelude()
import NanoPrelude

type Str = [Int]   -- char codes

app :: Str -> Str -> Str
app []     ys = ys
app (x:xs) ys = x : app xs ys

concatS :: [Str] -> Str
concatS []       = []
concatS (s:ss) = app s (concatS ss)

spanNe :: Int -> Str -> (Str, Str)
spanNe c [] = ([], [])
spanNe c (x:xs) = if x /= c then let (as, bs) = spanNe c xs in (x:as, bs)
                  else ([], x:xs)

revS :: Str -> Str
revS = go [] where go a []     = a
                   go a (x:xs) = go (x:a) xs

expand :: Str -> [Str]
expand []       = [[]]
expand (60:x)   = numericRule x      -- '<'
expand (91:x)   = alphabeticRule x   -- '['
expand x        = constantRule x

constantRule :: Str -> [Str]
constantRule (c:rest) = [ c:z | z <- expand rest ]

alphabeticRule :: Str -> [Str]
alphabeticRule (a:45:b:93:rest) =   -- '-' ']'
  if a <= b then [ c:z | c <- enumFromTo a b, z <- expand rest ]
  else           [ c:z | c <- revS (enumFromTo b a), z <- expand rest ]

numericRule :: Str -> [Str]
numericRule x =
  [ app (pad (showN i)) z
  | i <- if u < v then enumFromTo u v else revS (enumFromTo v u)
  , z <- expand s ]
  where
    (p, _:q) = spanNe 45 x            -- '-'
    (r, _:s) = spanNe 62 q            -- '>'
    (u, v)   = (mknum p, mknum r)
    mknum    = foldl (\acc c -> acc * 10 + (c - 48)) 0
    showN n  = if n < 10 then [n + 48]
               else app (showN (div n 10)) [mod n 10 + 48]
    width    = max (length (showN u)) (length (showN v))
    pad ds   = app (map (const 48) (enumFromTo 1 (width - length ds))) ds

hashS :: Str -> Int
hashS = foldl (\acc c -> c + acc * 31) 0

-- "[a-j][a-j][a-j][0-9]"
pat0 :: Str
pat0 = 91:97:45:106:93 : 91:97:45:106:93 : 91:97:45:106:93 : 91:48:45:57:93 : []

bench :: Int
bench = hashS (concatS (expand pat0))

main :: Int
main = bench
