-- MandelPlot.hs - a COPY of Mandel.hs (nofib spectral/mandel) (Mandel + PortablePixmap), verbatim
-- port to the NanoPrelude dialect. Double -> Float (binary32); Complex as a
-- pair with magnitude = sqrt(x*x + y*y), identical on both arms. nofib
-- FAST opts: -2.0 -2.0 2.0 2.0 25 25 75. The replicateM_ 100 wrapper
-- repeats identical work and is dropped; the rnf forcing of the PixMap is
-- the consumption boundary, folded into a hash of every RGB triple.
-- MODIFIED ONLY AT THE CONSUMPTION BOUNDARY.  Mandel.hs folds the pixmap into
-- a hash; this plots it.  Everything above that boundary -- mandel, addC,
-- mulC, magnitude, whenDiverge, mandelset, prettyRGB -- is untouched, so the
-- picture is what the benchmark computes, not a re-derivation of it.
--
-- sdl_open/sdl_put/sdl_show are plain foreign imports.  mhs knows nothing
-- about SDL: it emits a reference to an undefined symbol and the LINKER
-- resolves it against libsdlfun (the asm blobs plus the C half).
module MandelPlot where
import Prelude()
import NanoPrelude

foreign import ccall "sdl_open_cps" sdlOpen :: Int -> a -> a
foreign import ccall "sdl_put_cps"  sdlPut  :: Int -> a -> a
foreign import ccall "sdl_show_cps" sdlShow :: Int -> a -> a

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

-- PLOT boundary, in place of the hash: hand each pixel's escape count to SDL
-- in the order mandelset generates them (row-major), so the C half only keeps
-- a cursor.  prettyRGB s = (s,t,t), so the first component IS the count.
plotPix :: PixMap -> a -> a
plotPix (Pixmap w h d rgbs) k =
  sdlOpen ((w * 65536) + h) (go rgbs (sdlShow 0 k))
  where go []          k2 = k2
        go ((r,_,_):t) k2 = sdlPut r (go t k2)

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
fastWin, simWin, plotW, plotH :: Int
fastWin = 25
simWin = 6
-- the sim scale exists because the RTL runs ~1e4 cycles/s; this runs native,
-- so the plot gets a real window.
plotW = 320
plotH = 240

bench = hashPix (mandelset (negateD two) (negateD two) two two simWin simWin 75)
  where two = fromIntD 2

main :: Int
main = plotPix (mandelset (negateD two) (negateD two) two two plotW plotH 75) 0
  where two = fromIntD 2
