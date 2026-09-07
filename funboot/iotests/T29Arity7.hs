-- EXPECT: 10
module T29Arity7(main) where
import Prelude
data D = A | B Int Int | C Int Int Int Int
val :: D -> Int
val A = 0
val (B x y) = x + y
val (C p q r s) = p + q + r + s
main :: IO ()
main = putStrLn (show (val (C 1 2 3 4)))
