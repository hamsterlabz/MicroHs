-- EXPECT: 5 42 7
module TA9Arr(main) where
import Prelude
import Data.IORef
import Primitives(primArrAlloc, primArrRead, primArrWrite, primArrSize)
main :: IO ()
main = do
  a <- primArrAlloc 5 (0::Int)
  primArrWrite a 0 (42::Int)
  primArrWrite a 4 (7::Int)
  n <- primArrSize a
  x <- primArrRead a 0
  y <- primArrRead a 4
  putStrLn (show n ++ " " ++ show x ++ " " ++ show y)
