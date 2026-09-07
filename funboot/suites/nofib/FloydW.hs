-- FloydW.hs - mirrors benches/floydwarshall.ml of min-caml-hs: the triple loop
-- over a dense 120x120 matrix from the same generator, reporting the sum of all
-- finite distances.  Integer only.  92096188.
module FloydW(main) where
import Prelude
import Data.IOArray

n, inf :: Int
n   = 120
inf = 100000000

main :: IO ()
main = do
  d <- newIOArray (n*n) inf
  let ix i j = i*n + j
      fill i j seed =
        if i >= n then return ()
        else if j >= n then fill (i+1) 0 seed
        else let s = (seed * 3877 + 29573) `rem` 139968
             in do if i == j then writeIOArray d (ix i j) 0
                             else if s < 46656 then writeIOArray d (ix i j) (s+1)
                                               else return ()
                   fill i (j+1) s
      loopk k = if k >= n then return () else loopi k 0 >> loopk (k+1)
      loopi k i = if i >= n then return () else loopj k i 0 >> loopi k (i+1)
      loopj k i j =
        if j >= n then return () else do
          a <- readIOArray d (ix i k)
          b <- readIOArray d (ix k j)
          c <- readIOArray d (ix i j)
          if a + b < c then writeIOArray d (ix i j) (a+b) else return ()
          loopj k i (j+1)
      summ i j acc =
        if i >= n then return acc
        else if j >= n then summ (i+1) 0 acc
        else do v <- readIOArray d (ix i j)
                summ i (j+1) (if v >= inf then acc else acc + v)
  fill 0 0 1
  loopk 0
  s <- summ 0 0 0
  putStrLn (show s)
