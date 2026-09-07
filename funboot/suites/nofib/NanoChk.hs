module NanoChk where
import Prelude()
import NanoPrelude
main :: Int
main = putStrLn (showInt (truncD (two *. three)))            -- 6
       (putStrLn (showInt (truncD (two +. three)))           -- 5
       (putStrLn (showInt (truncD (hun *. hun)))             -- 10000
       (putStrLn (showInt (truncD (sqrtD hun))) 0)))         -- 10
  where two = fromIntD 2; three = fromIntD 3; hun = fromIntD 100
