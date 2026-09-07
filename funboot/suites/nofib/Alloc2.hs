-- Alloc2.hs - mirrors benches/alloc.ml of min-caml-hs: a three-element object
-- allocated and dropped 200 x 1000 times, one field accumulated so it cannot be
-- argued away.  Integer only.  1200000.
module Alloc2(main) where
import Prelude
import Data.IOArray

create :: Int -> Int -> IO Int
create n acc =
  if n <= 0 then return acc
  else do o <- newIOArray 3 (0::Int)
          writeIOArray o 0 5
          writeIOArray o 1 n
          writeIOArray o 2 1
          a <- readIOArray o 0
          b <- readIOArray o 2
          create (n-1) (acc + a + b)

loop :: Int -> Int -> IO Int
loop i acc = if i <= 0 then return acc else do c <- create 1000 0; loop (i-1) (acc+c)

main :: IO ()
main = loop 200 0 >>= \r -> putStrLn (show r)
