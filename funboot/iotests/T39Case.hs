-- EXPECT: 2
module T39Case(main) where
import Prelude
data T = Nil | One Int Int | Node T Int Int Int T
sz :: T -> Int
sz Nil = 0
sz (One _ _) = 1
sz (Node _ s _ _ _) = s
f :: T -> Int
f x =
  case x of
    (Node a _ _ _ b) | sz a < sz b -> 1
                     | otherwise   -> 2
    _ -> undefined
main :: IO ()
main = putStrLn (show (f (Node Nil 1 0 0 Nil)))
