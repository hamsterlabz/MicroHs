-- EXPECT: 202
module T36Bal(main) where
import Prelude
data T = Nil | One Int | Node Int
sz :: T -> Int
sz Nil = 0
sz (One _) = 1
sz (Node n) = n
g :: T -> Int -> T -> Int
g l k r
  | sz l + sz r <= 1 = 100
g (One _) k r = g (Node 1) k r
g l k (One _) = g l k (Node 1)
g l _ r = 200 + sz l + sz r
main :: IO ()
main = putStrLn (show (g (One 1) 5 (One 2)))
