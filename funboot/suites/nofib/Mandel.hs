-- Mandel.hs - nofib spectral/mandel (Mandel + PortablePixmap), verbatim
-- port to the NanoPrelude dialect. Double -> Float (binary32); Complex as a
-- pair with magnitude = sqrt(x*x + y*y), identical on both arms. nofib
-- FAST opts: -2.0 -2.0 2.0 2.0 25 25 75. The replicateM_ 100 wrapper
-- repeats identical work and is dropped; the rnf forcing of the PixMap is
-- the consumption boundary, folded into a hash of every RGB triple.
module Mandel where
import Prelude()
import NanoPrelude

type C = (FloatW, FloatW)

mandel :: C -> [C]
mandel c = infiniteMandel
           where
                infiniteMandel = c : (map (\z -> addC (mulC z z) c) infiniteMandel)

addC :: C -> C -> C
addC (a,b) (c,d) = (a +. c, b +. d)

mulC :: C -> C -> C
mulC (a,b) (c,d) = (a *. c -. b *. d, a *. d +. b *. c)

magnitude :: C -> FloatW
magnitude (x,y) = sqrtD (x *. x +. y *. y)

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }

whenDiverge :: Int -> FloatW -> C -> Int
whenDiverge limit radius c
  = walkIt (takeL limit (mandel c))
  where
     walkIt []     = 0
     walkIt (x:xs) = if diverge x radius then 0 else 1 + walkIt xs

diverge :: C -> FloatW -> Bool
diverge cmplx radius = magnitude cmplx >. radius

parallelMandel :: [C] -> Int -> FloatW -> [Int]
parallelMandel mat limit radius
   = map (whenDiverge limit radius) mat

data PixMap = Pixmap Int Int Int [(Int,Int,Int)]

createPixmap :: Int -> Int -> Int -> [(Int,Int,Int)] -> PixMap
createPixmap width height mx colours = Pixmap width height mx colours

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

mandelset :: FloatW -> FloatW -> FloatW -> FloatW -> Int -> Int -> Int -> PixMap
mandelset x y x' y' screenX screenY lIMIT
   = createPixmap screenX screenY lIMIT (map prettyRGB result)
   where
      windowToViewport s t
           = ( x +. ((coerce s *. (x' -. x)) /. fromIntD screenX)
             , y +. ((coerce t *. (y' -. y)) /. fromIntD screenY) )

      coerce :: Int -> FloatW
      coerce s = fromIntD s

      result = parallelMandel
                  [windowToViewport s t | t <- fromTo 1 screenY, s <- fromTo 1 screenX]
                  lIMIT
                  (maxD (x' -. x) (y' -. y) /. fromIntD 2)

      prettyRGB :: Int -> (Int,Int,Int)
      prettyRGB s = let t = lIMIT - s in (s,t,t)

-- rnf boundary: force every field and triple
hashPix :: PixMap -> Int
hashPix (Pixmap w h d rgbs) =
  foldl (\acc (r,g,b) -> ((acc*31 + r)*31 + g)*31 + b)
        ((w*31 + h)*31 + d) rgbs

bench :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastWin, simWin :: Int
fastWin = 25
simWin = 6

bench = hashPix (mandelset (negateD two) (negateD two) two two simWin simWin 75)
  where two = fromIntD 2

main :: Int
main = bench
