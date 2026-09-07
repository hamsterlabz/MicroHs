-- EXPECT: before
module T47Err(main) where
import Prelude
main :: IO ()
main = do
  putStrLn "before"
  putStrLn (if length [1::Int] > 0 then error "BOOM-XYZ" else "no")
