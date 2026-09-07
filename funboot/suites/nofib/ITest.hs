module ITest(main) where
import Prelude
main :: IO ()
main = do
  putStrLn (show (1000000000 * 10 :: Int))
  putStrLn (show (139968 * 20000 :: Int))
  putStrLn (show (4294967295 :: Int))
