-- AtomPlot.hs - a COPY of Atom.hs (nofib spectral/atom), plotted, verbatim port to the NanoPrelude dialect.
-- Double -> Float only. n stays 1000 (nofib FAST). The Num [a] instance is
-- the same code monomorphized (addL/mulL keep the original tails, including
-- (gs*gs)); runExperiment keeps the deliberate self-call. Glue: the printed
-- positions are consumed by a fold at the output boundary in place of
-- putStr (show ...).
-- MODIFIED ONLY AT THE BOUNDARY.  The dynamics are Atom.hs untouched: the
-- same testforce (-k x), the same propagate, the same runExperiment stream.
-- Atom.hs folds the positions into a hash; this plots the PHASE PORTRAIT,
-- position against velocity, which is the honest picture of what propagate
-- does.
--
-- It should spiral OUTWARD, and that is not an error in the plot: propagate
-- is forward Euler -- newpos from the old velocity, newvel from the force at
-- the old position -- which adds energy to a harmonic oscillator every step.
-- A closed ellipse would mean a symplectic integrator, and this is not one.
--
-- Nothing here converts a float to an Int (truncate is broken on this
-- backend): position and velocity cross as binary32 payloads and C scales.
--
-- One deliberate difference: plotSteps steps rather than the RTL sim scale of
-- 20, so the spiral has room to show.
module AtomPlot where
import Prelude()
import NanoPrelude

foreign import ccall "sdl_open_cps"  sdlOpen  :: Int -> a -> a
foreign import ccall "sdl_scale_cps" sdlScale :: FloatW -> a -> a
foreign import ccall "sdl_px_cps"    sdlPx    :: FloatW -> a -> a
foreign import ccall "sdl_py_cps"    sdlPy    :: FloatW -> a -> a
foreign import ccall "sdl_pt_cps"    sdlPt    :: Int -> a -> a
foreign import ccall "sdl_show_cps"  sdlShow  :: Int -> a -> a
-- a frame every plotEvery steps, KEEPING the canvas (argument 1): the spiral
-- is the picture, so each frame has to include everything drawn before it
foreign import ccall "sdl_frame_cps" sdlFrame :: Int -> a -> a

plotWin, plotSteps, plotEvery :: Int
plotWin   = 640
plotSteps = 3000
plotEvery = 25          -- 3000 / 25 = 120 frames

data AtomState = State [FloatW] [FloatW]

type ForceLaw a = a -> [AtomState] -> [[FloatW]]

zipWithL :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithL f (a:as) (b:bs) = f a b : zipWithL f as bs
zipWithL _ _ _ = []

-- instance Num [a]: negate, (+), (*) as written in the source
addL :: [FloatW] -> [FloatW] -> [FloatW]
addL l []          = l
addL [] l          = l
addL (f:fs) (g:gs) = (f +. g) : addL fs gs

mulL :: [FloatW] -> [FloatW] -> [FloatW]
mulL _ []          = []
mulL [] _          = []
mulL (f:fs) (g:gs) = (f *. g) : mulL gs gs

infixl 9 .*
(.*) :: FloatW -> [FloatW] -> [FloatW]
c .* []     = []
c .* (f:fs) = c *. f : c .* fs

testforce :: ForceLaw [FloatW]
testforce k [] = []
testforce k (State pos vel : atoms) =
  negateD (fromIntD 1) .* mulL k pos : testforce k atoms

runExperiment :: ForceLaw a -> FloatW -> a -> AtomState -> [AtomState]
runExperiment law dt param init0 =
  init0 : zipWithL (propagate dt) (law param stream) stream
  where stream = runExperiment law dt param init0

propagate :: FloatW -> [FloatW] -> AtomState -> AtomState
propagate dt aforce (State pos vel) = State newpos newvel
  where newpos = addL pos (dt .* vel)
        newvel = addL vel (dt .* aforce)

test :: [AtomState]
test = runExperiment testforce (fromIntD 2 /. fromIntD 100)
                     [fromIntD 1] (State [fromIntD 1] [fromIntD 0])

n :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastN, simN :: Int
fastN = 1000
simN = 20

n = simN

-- output boundary: show AtomState prints the positions; consume them
hpos :: Int -> [FloatW] -> Int
hpos acc []     = acc
hpos acc (x:xs) = hpos (acc*31 + truncateD (x *. fromIntD 1000)) xs

bench :: Int
bench = foldl (\acc st -> case st of State pos _ -> hpos acc pos) 0 (takeL n test)

-- the plot: one dot per step at (position, velocity).  The colour walks with
-- time, so the direction the spiral is growing is visible.
firstF :: [FloatW] -> FloatW
firstF (x:_) = x
firstF []    = fromIntD 0

plotPhase :: Int -> [AtomState] -> a -> a
plotPhase _ []                     k = k
plotPhase i (State pos vel : rest) k =
  sdlPx (firstF pos)
    (sdlPy (firstF vel)
      (sdlPt (20 + (i * 7))
        (frameAt i (plotPhase (i+1) rest k))))

frameAt :: Int -> a -> a
frameAt i k = if mod i plotEvery == 0 then sdlFrame 1 k else k

main :: Int
main = sdlOpen ((plotWin * 65536) + plotWin)
         (sdlScale (fromIntD 150)
           (plotPhase 0 (takeL plotSteps test) (sdlShow 0 0)))

takeL :: Int -> [a] -> [a]
takeL k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeL (k-1) ys }
