module SqrtTest(main) where
import Prelude
main :: IO ()
main = do
  let two = 2.0 :: Double
      three = 3.0 :: Double
      hun = 100.0 :: Double
  putStrLn (show (truncate (two * three) :: Int))        -- 6
  putStrLn (show (truncate (two + three) :: Int))        -- 5
  putStrLn (show (truncate (two - three) :: Int))        -- -1
  putStrLn (show (truncate (hun * hun) :: Int))          -- 10000
  putStrLn (show (truncate (hun / two) :: Int))          -- 50
  putStrLn (show (truncate (sqrt (hun * hun)) :: Int))   -- 100
