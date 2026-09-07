-- SpecNorm.hs - mirrors benches/spectralnorm.ml of min-caml-hs: twenty
-- alternating multiplies by A and its transpose from the all-ones vector at
-- N = 150, answer sqrt(vBv/vv) scaled by 1e9.  Float, so see the note in the
-- comparison: Double here is binary32 while the min-caml rv64 target is binary64.
module SpecNorm(main) where
import Prelude
import Data.IOArray

n :: Int
n = 150

aij :: Int -> Int -> Double
aij i j = let s = i + j in 1.0 / fromIntegral (s * (s + 1) `quot` 2 + i + 1)

main :: IO ()
main = do
  u <- newIOArray n (1.0::Double)
  v <- newIOArray n (0.0::Double)
  t <- newIOArray n (0.0::Double)
  let av x y i =
        if i >= n then return () else do
          let inner j acc = if j >= n then return acc
                            else do xj <- readIOArray x j
                                    inner (j+1) (acc + aij i j * xj)
          s <- inner 0 0.0
          writeIOArray y i s
          av x y (i+1)
      atv x y i =
        if i >= n then return () else do
          let inner j acc = if j >= n then return acc
                            else do xj <- readIOArray x j
                                    inner (j+1) (acc + aij j i * xj)
          s <- inner 0 0.0
          writeIOArray y i s
          atv x y (i+1)
      atav x y = av x t 0 >> atv t y 0
      loop k = if k >= 10 then return () else atav u v >> atav v u >> loop (k+1)
      dot x y i acc = if i >= n then return acc
                      else do a <- readIOArray x i
                              b <- readIOArray y i
                              dot x y (i+1) (acc + a*b)
  loop 0
  vbv <- dot u v 0 0.0
  vv  <- dot v v 0 0.0
  putStrLn (show (truncate (sqrt (vbv / vv) * 1000000000.0) :: Int))
