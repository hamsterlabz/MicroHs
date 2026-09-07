-- EXPECT: ok
module FloatChk(main) where
import Prelude
chk :: String -> Double -> Double -> IO ()
chk nm got want =
  putStrLn (nm ++ (if got > want - 0.01 && got < want + 0.01 then " OK" else " BAD"))
main :: IO ()
main = do
  let a = 2.0 :: Double
      b = 3.0 :: Double
      c = 100.0 :: Double
  chk "mul"  (a * b)   6.0
  chk "add"  (a + b)   5.0
  chk "sub"  (b - a)   1.0
  chk "div"  (c / a)   50.0
  chk "big"  (c * c)   10000.0
  chk "sqrt" (sqrt c)  10.0
  chk "itof" (fromIntegral (7::Int)) 7.0
