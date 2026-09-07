-- EXPECT: 2 [1,0]
module T56Recpat(main) where
import Prelude
data D = D Int [Int]
go :: Int -> D
go n =
  let d@(D k xs) = D n (if n <= 0 then [] else n - 1 : ys)
      D _ ys = go (n - 1)
  in if n <= 0 then D 0 [] else d
main :: IO ()
main = case go 2 of
         D k xs -> putStrLn (show k ++ " " ++ show xs)
