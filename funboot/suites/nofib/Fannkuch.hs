-- fannkuchredux, the Computer Language Benchmarks Game kernel.  Same algorithm
-- as the MinCaml port it is compared against, line for line: walk every
-- permutation in the standard rotate order, count the pancake flips for each,
-- and report the checksum and the maximum.  Mutable arrays and recursion on
-- both sides, so the two differ in front end and nothing else.
module Fannkuch(main) where
import Prelude
import Data.IOArray

fannkuch :: Int -> IO ()
fannkuch n = do
  perm  <- newIOArray n 0
  perm1 <- newIOArray n 0
  count <- newIOArray n 0
  let setperm1 i = if i >= n then return () else writeIOArray perm1 i i >> setperm1 (i+1)
      setcount i = if i >= n then return () else writeIOArray count i (i+1) >> setcount (i+1)
      copyperm i = if i >= n then return () else
                     readIOArray perm1 i >>= \v -> writeIOArray perm i v >> copyperm (i+1)
      rev i j = if i >= j then return () else do
                  t <- readIOArray perm i
                  u <- readIOArray perm j
                  writeIOArray perm i u
                  writeIOArray perm j t
                  rev (i+1) (j-1)
      flips f = do
        k <- readIOArray perm 0
        if k == 0 then return f else rev 0 k >> flips (f+1)
      rotate i r = if i >= r then return () else
                     readIOArray perm1 (i+1) >>= \v -> writeIOArray perm1 i v >> rotate (i+1) r
      nextperm r =
        if r >= n then return 0 else do
          p0 <- readIOArray perm1 0
          rotate 0 r
          writeIOArray perm1 r p0
          c <- readIOArray count r
          writeIOArray count r (c-1)
          if c-1 > 0 then return 1 else writeIOArray count r (r+1) >> nextperm (r+1)
      loop even maxflips checksum = do
        copyperm 0
        f <- flips 0
        let mx = if f > maxflips then f else maxflips
            cs = if even == 0 then checksum + f else checksum - f
        np <- nextperm 1
        if np == 1 then loop (1-even) mx cs
                   else putStrLn (show cs ++ " " ++ show mx)
  setperm1 0
  setcount 0
  loop (0::Int) 0 0

main :: IO ()
main = fannkuch 7
