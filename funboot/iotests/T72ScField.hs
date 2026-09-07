-- EXPECT: 0 0 True
module T72ScField(main) where
import Prelude
import MicroHs.Exp
data W = W Exp
k3 :: Exp
k3 = Sc 4 X [0]
get :: Exp -> [Int]
get e = case e of
          Sc _ _ is -> is
          _ -> []
main :: IO ()
main = do
  let a = last (get k3)
  putStrLn (show a ++ " " ++ show (last (get k3)) ++ " "
            ++ show (length (filter (== (3::Int)) (get k3)) == 0))
