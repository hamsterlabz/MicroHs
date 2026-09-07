-- NSieve.hs - mirrors benches/nsieve.ml of min-caml-hs: the plain sieve over a
-- flag array, m = 20000, 2262 primes.  Integer only, so both front ends compute
-- it exactly and the reduction counts are comparable.
module NSieve(main) where
import Prelude
import Data.IOArray

m :: Int
m = 20000

main :: IO ()
main = do
  flags <- newIOArray m (1::Int)
  let mark i j = if j >= m then return () else writeIOArray flags j 0 >> mark i (j+i)
      sieve i acc =
        if i >= m then return acc
        else do f <- readIOArray flags i
                if f == 0 then sieve (i+1) acc
                          else mark i (i+i) >> sieve (i+1) (acc+1)
  c <- sieve 2 (0::Int)
  putStrLn (show c)
