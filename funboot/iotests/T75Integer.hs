-- EXPECT: True True False True True 7 True
module T75Integer(main) where
import Prelude
main :: IO ()
main = do
  let a = 3 :: Integer
      b = 4 :: Integer
      big = 123456789012345678901234567890 :: Integer
  putStrLn (show (a == 3) ++ " " ++ show (a /= b) ++ " " ++ show (big == big + 1)
            ++ " " ++ show (big == big) ++ " " ++ show (a + b == 7)
            ++ " " ++ show (a + b) ++ " " ++ show (fromInteger a == (3 :: Int)))
