-- EXPECT: 15
module T30Arity8(main) where
import Prelude
data E = A2 | B2 Int Int | C2 Int Int Int Int Int
val :: E -> Int
val A2 = 0
val (B2 x y) = x + y
val (C2 p q r s t) = p + q + r + s + t
main :: IO ()
main = putStrLn (show (val (C2 1 2 3 4 5)))
