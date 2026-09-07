-- Fft2.hs - mirrors benches/fft.ml of min-caml-hs: Cooley-Tukey over n = 1024,
-- bit-reversal then log2 n butterfly passes against precomputed twiddles, with
-- complex numbers held as two parallel arrays.  Float, so see the note on the
-- numeric models: Double here is binary32.
module Fft2(main) where
import Prelude
import Data.IOArray

n, half :: Int
n = 1024
half = 512

bitrev :: Int -> Int -> Int -> Int
bitrev acc nbits i = if nbits == 0 then acc
                     else bitrev (acc*2 + (i `rem` 2)) (nbits-1) (i `quot` 2)

main :: IO ()
main = do
  xre <- newIOArray n (0.0::Double); xim <- newIOArray n (0.0::Double)
  yre <- newIOArray n (0.0::Double); yim <- newIOArray n (0.0::Double)
  wre <- newIOArray half (0.0::Double); wim <- newIOArray half (0.0::Double)
  let mkx i = if i >= n then return ()
              else writeIOArray xre i (sin (fromIntegral i)) >> writeIOArray xim i 0.0 >> mkx (i+1)
      mkw k = if k >= half then return ()
              else let a = (0.0 - 6.28318530717958) * fromIntegral k / fromIntegral n
                   in writeIOArray wre k (cos a) >> writeIOArray wim k (sin a) >> mkw (k+1)
      permute i = if i >= n then return () else do
        let j = bitrev 0 10 i
        a <- readIOArray xre j; b <- readIOArray xim j
        writeIOArray yre i a; writeIOArray yim i b
        permute (i+1)
      pass m = if m > n then return () else do
        let hm = m `quot` 2
            step = n `quot` m
            bfly ofs i = if i >= hm then return () else do
              let j = ofs + i; k = j + hm; tw = i * step
              br <- readIOArray yre k; bi <- readIOArray yim k
              cr <- readIOArray wre tw; ci <- readIOArray wim tw
              let pr = br*cr - bi*ci
                  pj = br*ci + bi*cr
              ar <- readIOArray yre j; ai <- readIOArray yim j
              writeIOArray yre j (ar+pr); writeIOArray yim j (ai+pj)
              writeIOArray yre k (ar-pr); writeIOArray yim k (ai-pj)
              bfly ofs (i+1)
            block ofs = if ofs >= n then return () else bfly ofs 0 >> block (ofs+m)
        block 0
        pass (m*2)
      csum i acc = if i >= n then return acc
                   else do a <- readIOArray yre i; b <- readIOArray yim i
                           csum (i+1) (acc + a*a + b*b)
  mkx 0; mkw 0; permute 0; pass 2
  c <- csum 0 0.0
  putStrLn (show (truncate (c / 1000.0) :: Int))
