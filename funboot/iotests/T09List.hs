-- EXPECT: 55 [1,2,3]
module T09List(main) where
import Prelude
main :: IO ()
main = putStrLn (show (sum [1..10::Int]) ++ " " ++ show (map (+1) [0,1,2::Int]))
