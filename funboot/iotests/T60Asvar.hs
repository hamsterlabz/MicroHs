-- EXPECT: 7 7 xy
module T60Asvar(main) where
import Prelude
data M = M Int String
main :: IO ()
main =
  case M 7 "xy" of
    m@(M a _) -> case m of
                   M k t -> putStrLn (show a ++ " " ++ show k ++ " " ++ t)
