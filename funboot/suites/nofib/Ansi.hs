-- Ansi.hs - nofib spectral/ansi, verbatim port to the NanoPrelude dialect.
-- Interact = [Int] -> [Int] over character codes (ESC=27, ^L=12, BEL=7,
-- BS=8, DEL=127). nofib FAST opts: 150 compositions of `program`; stdin is
-- empty (no .stdin file ships), so every readChar takes the eof branch,
-- exactly as the original run. The interact output stream is consumed with
-- the nofib hash.
module Ansi where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

tailL :: [a] -> [a]
tailL (_:xs) = xs
tailL []     = []

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []

repeatL :: a -> [a]
repeatL x = x : repeatL x

copy :: Int -> a -> [a]
copy n x = takeL n (repeatL x)

showN :: Int -> [Int]
showN k = if k < 10 then [48+k] else append (showN (div k 10)) [48 + mod k 10]

-- Basic screen control codes:

cls :: [Int]
cls = [12]                  -- "\^L" for Sun window

goto :: Int -> Int -> [Int]
goto x y = 27 : 91 : append (showN y) (59 : append (showN x) [72])

at :: (Int,Int) -> [Int] -> [Int]
at (x,y) s = append (goto x y) s

home :: [Int]
home = goto 1 1

highlight :: [Int] -> [Int]
highlight s = append [27,91,55,109] (append s [27,91,48,109])

-- Some general purpose functions for interactive programs:

type Interact = [Int] -> [Int]

end :: Interact
end cs = []

readChar, peekChar :: Interact -> (Int -> Interact) -> Interact
readChar eof use []     = eof []
readChar eof use (c:cs) = use c cs

peekChar eof use []        = eof []
peekChar eof use cs@(c:_)  = use c cs

pressAnyKey :: Interact -> Interact
pressAnyKey prog = readChar prog (\c -> prog)

unreadChar :: Int -> Interact -> Interact
unreadChar c prog cs = prog (c:cs)

writeChar :: Int -> Interact -> Interact
writeChar c prog cs = c : prog cs

writeString :: [Int] -> Interact -> Interact
writeString s prog cs = append s (prog cs)

writes :: [[Int]] -> Interact -> Interact
writes ss = writeString (concat ss)

ringBell :: Interact -> Interact
ringBell = writeChar 7

-- Screen oriented input/output functions:

type Pos = (Int,Int)

clearScreen :: Interact -> Interact
clearScreen = writeString cls

writeAt :: Pos -> [Int] -> Interact -> Interact
writeAt (x,y) s = writeString (append (goto x y) s)

moveTo :: Pos -> Interact -> Interact
moveTo (x,y) = writeString (goto x y)

readAt :: Pos -> Int -> ([Int] -> Interact) -> Interact
readAt (x,y) l use = writeAt (x,y) (copy l 95) (moveTo (x,y) (loop 0 []))
 where loop n s = readChar (ret s) (\c ->
                  if c == 8 then delete n s
                  else if c == 127 then delete n s
                  else if c == 10 then ret s
                  else if n < l then writeChar c (loop (n+1) (c:s))
                  else ringBell (loop n s))
       delete n s = if n > 0 then writeString [8,95,8] (loop (n-1) (tailL s))
                             else ringBell (loop 0 [])
       ret s = use (revL s)

defReadAt :: Pos -> Int -> [Int] -> ([Int] -> Interact) -> Interact
defReadAt (x,y) l def use
                   = writeAt (x,y) (takeL l (append def (repeatL 95)))
                     (readChar (use def) (\c ->
                     if c == 10 then use def
                                else unreadChar c (readAt (x,y) l use)))

promptReadAt :: Pos -> Int -> [Int] -> ([Int] -> Interact) -> Interact
promptReadAt (x,y) l prompt use
                   = writeAt (x,y) prompt (readAt (x + length prompt,y) l use)

defPromptReadAt :: Pos -> Int -> [Int] -> [Int] -> ([Int] -> Interact) -> Interact
defPromptReadAt (x,y) l prompt def use
                   = writeAt (x,y) prompt (
                     defReadAt (x + length prompt,y) l def use)

-- A sample program (string literals as character codes):

str1, str2, str3, str4, str5, str6, str7, str8, str9 :: [Int]
str1 = [68,101,109,111,110,115,116,114,97,116,105,111,110,32,112,114,111,103,114,97,109]  -- "Demonstration program"
str2 = [86,101,114,115,105,111,110,32,49,46,48]                                            -- "Version 1.0"
str3 = [84,104,105,115,32,112,114,111,103,114,97,109,32,105,108,108,117,115,116,114,97,116,101,115,32,97,32,115,105,109,112,108,101,32,97,112,112,114,111,97,99,104]  -- "This program illustrates a simple approach"
str4 = [116,111,32,115,99,114,101,101,110,45,98,97,115,101,100,32,105,110,116,101,114,97,99,116,105,118,101,32,112,114,111,103,114,97,109,115,32,117,115,105,110,103] -- "to screen-based interactive programs using"
str5 = [116,104,101,32,72,117,103,115,32,102,117,110,99,116,105,111,110,97,108,32,112,114,111,103,114,97,109,109,105,110,103,32,115,121,115,116,101,109,46]           -- "the Hugs functional programming system."
str6 = [80,108,101,97,115,101,32,112,114,101,115,115,32,97,110,121,32,107,101,121,32,116,111,32,99,111,110,116,105,110,117,101,32,46,46,46]                            -- "Please press any key to continue ..."
str7 = [80,108,101,97,115,101,32,101,110,116,101,114,32,121,111,117,114,32,110,97,109,101,58,32]                                                                        -- "Please enter your name: "
str8 = [72,101,108,108,111,32]                                                              -- "Hello "
str9 = [73,39,109,32,119,97,105,116,105,110,103,46,46,46,10]                                -- "I'm waiting...\n"

program :: Interact
program = writes [ cls,
                   at (17,5)  (highlight str1),
                   at (48,5)  str2,
                   at (17,7)  str3,
                   at (17,8)  str4,
                   at (17,9)  str5,
                   at (17,11) str6
                 ]
          (pressAnyKey
          (promptReadAt (17,15) 18 str7 (\name ->
          (let reply = append str8 (append name [33]) in
           writeAt (40 - (div (length reply) 2),18) reply
          (moveTo (1,23)
          (writeString str9
          (pressAnyKey
          end)))))))

nIter :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastIter, simIter :: Int
fastIter = 150
simIter = 3

nIter = simIter

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS ((foldr (.) id (takeL nIter (repeatL program))) [])

main :: Int
main = bench
