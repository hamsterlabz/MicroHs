-- Soli2.hs - mirrors benches/soli.ml of min-caml-hs: peg solitaire over the
-- standard 33-hole board, depth first until 31 moves are made and the last peg
-- sits in the centre.  A peg is an int (0 out, 1 empty, 2 peg) and the board is
-- one flat array, as in the min-caml port.  Integer only.  1.
module Soli2(main) where
import Prelude
import Data.IOArray

main :: IO ()
main = do
  b  <- newIOArray 81 (0::Int)
  dx <- newIOArray 4 (0::Int)
  dy <- newIOArray 4 (0::Int)
  let ix i j = i*9 + j
      fill i j1 j2 = if j1 > j2 then return ()
                     else writeIOArray b (ix i j1) 2 >> fill i (j1+1) j2
      solve m =
        if m == 31 then do c <- readIOArray b (ix 4 4)
                           return (if c == 2 then 1 else 0)
        else loopI 1
       where
        loopI i = if i > 7 then return (0::Int) else do
          r <- loopJ i 1
          if r == 1 then return 1 else loopI (i+1)
        loopJ i j = if j > 7 then return (0::Int) else do
          v <- readIOArray b (ix i j)
          if v /= 2 then loopJ i (j+1) else do
            r <- loopK i j 0
            if r == 1 then return 1 else loopJ i (j+1)
        loopK i j k = if k > 3 then return (0::Int) else do
          d1 <- readIOArray dx k
          d2 <- readIOArray dy k
          let i1 = i + d1; i2 = i1 + d1
              j1 = j + d2; j2 = j1 + d2
          v1 <- readIOArray b (ix i1 j1)
          v2 <- readIOArray b (ix i2 j2)
          if v1 /= 2 || v2 /= 1 then loopK i j (k+1) else do
            writeIOArray b (ix i  j ) 1
            writeIOArray b (ix i1 j1) 1
            writeIOArray b (ix i2 j2) 2
            r <- solve (m+1)
            if r == 1 then return 1 else do
              writeIOArray b (ix i  j ) 2
              writeIOArray b (ix i1 j1) 2
              writeIOArray b (ix i2 j2) 1
              loopK i j (k+1)
  writeIOArray dx 0 0;    writeIOArray dy 0 1
  writeIOArray dx 1 1;    writeIOArray dy 1 0
  writeIOArray dx 2 0;    writeIOArray dy 2 (0-1)
  writeIOArray dx 3 (0-1);writeIOArray dy 3 0
  fill 1 3 5; fill 2 3 5
  fill 3 1 7; fill 4 1 7; fill 5 1 7
  fill 6 3 5; fill 7 3 5
  writeIOArray b (ix 4 4) 1
  r <- solve 0
  putStrLn (show r)
