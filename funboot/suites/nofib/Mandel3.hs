-- Mandel3.hs - mirrors benches/mandelbrot.ml of min-caml-hs: the same escape
-- test over the same 200x200 grid on [-1.5,0.5]x[-1,1], fifty iterations,
-- reporting the population count of the bitmap.  15909 of 40000 inside.
module Mandel3(main) where
import Prelude

n :: Int
n = 200

inside :: Double -> Double -> Double -> Double -> Int -> Int
inside cr ci zr zi k =
  if k >= 50 then 1
  else if zr*zr + zi*zi > 4.0 then 0
  else inside cr ci (zr*zr - zi*zi + cr) (2.0*zr*zi + ci) (k+1)

row :: Int -> Int -> Int -> Int
row i j acc =
  if j >= n then acc
  else let cr = 2.0 * fromIntegral j / fromIntegral n - 1.5
           ci = 2.0 * fromIntegral i / fromIntegral n - 1.0
       in row i (j+1) (acc + inside cr ci 0.0 0.0 0)

grid :: Int -> Int -> Int
grid i acc = if i >= n then acc else grid (i+1) (acc + row i 0 0)

main :: IO ()
main = putStrLn (show (grid 0 0))
