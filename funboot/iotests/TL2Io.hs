-- EXPECT: done
module TL2Io(main) where
import Prelude
loop :: Int -> IO ()
loop 0 = putStrLn "done"
loop n = seq (length [n, n]) (loop (n - 1))
main :: IO ()
main = loop 100000
