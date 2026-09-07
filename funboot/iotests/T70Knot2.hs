-- EXPECT: [1,2,1,2] 10
module T70Knot2(main) where
import Prelude
main :: IO ()
main = do
  let a = 1 : b
      b = 2 : a
  putStrLn (show (take 4 (a :: [Int])) ++ " " ++ show (sum (take 4 a) + 4))
