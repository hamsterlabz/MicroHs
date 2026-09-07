-- EXPECT: ok
module T66PapCon(main) where
import Prelude
data M = M Int String
main :: IO ()
main = seq (M 1) (putStrLn "ok")
