-- EXPECT: done
module TL3NoSeq(main) where
import Prelude
loop :: Int -> IO ()
loop 0 = putStrLn "done"
loop n = loop (n - 1)
main :: IO ()
main = loop 100000
