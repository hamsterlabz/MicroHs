-- TakFP.hs - the Takeuchi function over floats, mirroring benches/takfp.ml of
-- min-caml-hs line for line: same recursion, same 18 12 6, value 7.
module TakFP(main) where
import Prelude

tak :: Double -> Double -> Double -> Double
tak x y z = if y >= x then z
            else tak (tak (x-1.0) y z) (tak (y-1.0) z x) (tak (z-1.0) x y)

main :: IO ()
main = putStrLn (show (truncate (tak 18.0 12.0 6.0) :: Int))
