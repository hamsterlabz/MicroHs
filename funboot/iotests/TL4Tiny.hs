-- EXPECT: done
module TL4Tiny(main) where
import Prelude
loop :: Int -> IO ()
loop 0 = putStrLn "done"
loop n = loop (n - 1)
main :: IO ()
main = loop 3
