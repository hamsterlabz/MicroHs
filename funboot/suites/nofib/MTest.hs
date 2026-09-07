module MTest(main) where
import Prelude
main :: IO ()
main = putStrLn (show (truncate (sqrt (16.0::Double)) :: Int))
