module TruncChk where
import Prelude()
import NanoPrelude

appendL :: [a] -> [a] -> [a]
appendL []     ys = ys
appendL (x:xs) ys = x : appendL xs ys

showN :: Int -> [Int]
showN n = if n < 0 then 45 : showN (0 - n)
          else if n < 10 then [48+n]
          else appendL (showN (div n 10)) [48 + mod n 10]

main :: Int
main =
  putStrLn (showN (truncateD (fromIntD 2 *. fromIntD 3)))            -- 6
   (putStrLn (showN (truncateD (fromIntD 100 *. fromIntD 100)))      -- 10000
    (putStrLn (showN (truncateD (sqrtD (fromIntD 100))))             -- 10
     (putStrLn (showN (truncateD (fromIntD 7 /. fromIntD 2))) 0)))   -- 3
