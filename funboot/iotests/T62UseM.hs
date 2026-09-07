-- EXPECT: 1 one 1
module T62UseM(main) where
import Prelude
data M = M Int String
top :: M -> Int
top (M k _) = k
f :: Int -> String -> (Int, String, Int)
f n s = let m@(M a b) = M n s in (a, b, top m)
main :: IO ()
main = case f 1 "one" of
         (a, b, k) -> putStrLn (show a ++ " " ++ b ++ " " ++ show k)
