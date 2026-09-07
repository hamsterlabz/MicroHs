-- HeapSort.hs - mirrors benches/heapsort.ml of min-caml-hs: twenty thousand
-- ints from the same generator (3877, 29573, 139968), sorted in place, then a
-- position-weighted checksum.  Integer only.  369591726.
module HeapSort(main) where
import Prelude
import Data.IOArray

n :: Int
n = 20000

main :: IO ()
main = do
  a <- newIOArray n (0::Int)
  let fill i seed =
        if i >= n then return ()
        else let s = (seed * 3877 + 29573) `rem` 139968
             in writeIOArray a i s >> fill (i+1) s
      sift root lst = do
        let c = 2*root + 1
        if c > lst then return () else do
          cv  <- readIOArray a c
          c2 <- if c+1 <= lst
                  then do cv1 <- readIOArray a (c+1)
                          return (if cv1 > cv then c+1 else c)
                  else return c
          c2v <- readIOArray a c2
          rv  <- readIOArray a root
          if c2v > rv
            then do writeIOArray a root c2v; writeIOArray a c2 rv; sift c2 lst
            else return ()
      build i = if i < 0 then return () else sift i (n-1) >> build (i-1)
      drain e = if e <= 0 then return () else do
        t  <- readIOArray a 0
        ev <- readIOArray a e
        writeIOArray a 0 ev
        writeIOArray a e t
        sift 0 (e-1)
        drain (e-1)
      csum i acc = if i >= n then return acc
                   else do v <- readIOArray a i
                           csum (i+1) ((acc + v * (i+1)) `rem` 1000000007)
  fill 0 1
  build (n `quot` 2 - 1)
  drain (n-1)
  s <- csum 0 0
  putStrLn (show s)
