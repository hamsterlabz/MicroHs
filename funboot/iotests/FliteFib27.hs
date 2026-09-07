-- EXPECT: 317811
module FliteFib27(main) where
import Prelude
fib :: Int -> Int
fib n =
  if n <= 1
     then 1
     else fib (n - 1) + fib (n - 2)
main :: IO ()
main = putStrLn (show (fib 27))
