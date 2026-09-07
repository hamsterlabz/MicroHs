module FTest(main) where
import Prelude
main :: IO ()
main = do
  putStrLn (show (truncate (18.0 - 1.0 :: Double) :: Int))
  putStrLn (show (if (12.0::Double) >= 18.0 then 1 else 0 :: Int))
  putStrLn (show (truncate (7.0 :: Double) :: Int))
  putStrLn (show (truncate (0.1 + 0.2 :: Double) * 0 + (if (0.1+0.2::Double) == 0.3 then 1 else 0) :: Int))
