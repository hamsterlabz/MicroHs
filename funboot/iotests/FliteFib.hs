-- EXPECT: 10946
-- flite benchmark Fib.hs, algorithm verbatim; the large main (fib 20).
-- Only the glue differs: the bare harness checks the returned Int, this
-- prints it, because the Linux runtime's main is IO.
module FliteFib(main) where
import Prelude
fib :: Int -> Int
fib n =
  if n <= 1
     then 1
     else fib (n - 1) + fib (n - 2)
main :: IO ()
main = putStrLn (show (fib 20))
