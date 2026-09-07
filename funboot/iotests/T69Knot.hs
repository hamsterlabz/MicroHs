-- EXPECT: [3,3,3,3,3]
module T69Knot(main) where
import Prelude
main :: IO ()
main = putStrLn (show (take 5 (let xs = 3 : xs in xs :: [Int])))
