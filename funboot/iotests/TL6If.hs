-- EXPECT: done
module TL6If(main) where
import Prelude
loop :: Int -> IO ()
loop n = if n == 0 then putStrLn "done" else loop (n - 1)
main :: IO ()
main = loop 100000
