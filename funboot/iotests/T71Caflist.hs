-- EXPECT: 3 1 3 [0] 0
module T71Caflist(main) where
import Prelude
xs :: [Int]
xs = [3]
ys :: [Int]
ys = [0]
main :: IO ()
main = putStrLn (show (last xs) ++ " " ++ show (length xs) ++ " "
                 ++ show (last xs) ++ " " ++ show (init (ys ++ [9])) ++ " "
                 ++ show (last (init (ys ++ [9]))))
