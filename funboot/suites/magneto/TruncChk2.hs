module TruncChk2(main) where
import Prelude
main :: IO ()
main = do
  putStrLn ("decodeFloat 100.0 = " ++ show (decodeFloat (100.0 :: Double)) ++ "   (want (13107200,-17))")
  let a = 2.0 :: Double
      b = 3.0 :: Double
      c = 100.0 :: Double
  putStrLn ("truncate (2*3)     = " ++ show (truncate (a*b)     :: Int) ++ "   want 6")
  putStrLn ("truncate (2+3)     = " ++ show (truncate (a+b)     :: Int) ++ "   want 5")
  putStrLn ("truncate (100*100) = " ++ show (truncate (c*c)     :: Int) ++ "   want 10000")
  putStrLn ("truncate (100/2)   = " ++ show (truncate (c/a)     :: Int) ++ "   want 50")
  putStrLn ("truncate (sqrt100) = " ++ show (truncate (sqrt c)  :: Int) ++ "   want 10")
  putStrLn ("truncate (-7.5)    = " ++ show (truncate (0.0-7.5) :: Int) ++ "   want -7")
  putStrLn ("floor    (100/3)   = " ++ show (floor (c/3.0)      :: Int) ++ "   want 33")
  putStrLn ("ceiling  (100/3)   = " ++ show (ceiling (c/3.0)    :: Int) ++ "   want 34")
  putStrLn ("round    (100/3)   = " ++ show (round (c/3.0)      :: Int) ++ "   want 33")
