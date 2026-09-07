-- NBodyPlot.hs - a COPY of NBody2.hs, plotted.  mirrors benches/nbody.ml of min-caml-hs: the same five bodies
-- with the reference initial conditions, the same momentum offset, the same
-- advance at dt = 0.01 for 1000 steps, reporting energy before and after
-- scaled by 1e9.  A body is an index into flat coordinate arrays, as in the
-- min-caml port.  Float, so see the note on the numeric models.
-- MODIFIED ONLY AT THE BOUNDARY.  The integrator is NBody2.hs untouched --
-- same five bodies, same reference initial conditions, same momentum offset,
-- same advance/move at dt = 0.01.  What is added is a dot per body per step,
-- so the path each one traces is the orbit the benchmark actually integrates.
--
-- 12000 steps instead of 1000: at dt = 0.01 in years, 1000 steps is 10 years
-- and Jupiter (period 11.86) does not close its orbit.
--
-- NOTHING HERE CONVERTS A FLOAT TO AN Int.  truncate is broken on this
-- backend -- every arithmetic operation checks out when tested by comparison
-- (mul, add, sub, div, sqrt, fromIntegral all OK) but a truncated value comes
-- back garbage.  That, not the integrator, is what put the sun 10 AU off
-- centre and made the orbits wander.  So coordinates cross to C as floats:
-- the blob hands over the FloatW payload, which IS the binary32 bit pattern,
-- and the scaling and rounding happen there.  The energy is reported the same
-- way, because the benchmark's own show . truncate path cannot be trusted.
module NBodyPlot(main) where
import Prelude
import Data.IOArray

foreign import ccall "sdl_open" sdlOpen :: Int -> IO ()
foreign import ccall "sdl_show" sdlShow :: Int -> IO ()
foreign import ccall "sdl_px"   sdlPx   :: Double -> IO ()
foreign import ccall "sdl_py"   sdlPy   :: Double -> IO ()
foreign import ccall "sdl_pt"   sdlPt   :: Int -> IO ()
foreign import ccall "sdl_num"  sdlNum  :: Double -> IO ()
-- a frame every plotEvery steps, keeping the canvas: the trail is the orbit
foreign import ccall "sdl_frame" sdlFrame :: Int -> IO ()

plotW, plotH, plotSteps, plotEvery :: Int
plotW = 640
plotH = 640
plotSteps = 12000
plotEvery = 100        -- 12000 / 100 = 120 frames

n :: Int
n = 5

main :: IO ()
main = do
  let pin = 3.141592653589793
      solar = 4.0 * pin * pin
      dpy = 365.24
  x <- newIOArray n (0.0::Double); y <- newIOArray n (0.0::Double); z <- newIOArray n (0.0::Double)
  vx <- newIOArray n (0.0::Double); vy <- newIOArray n (0.0::Double); vz <- newIOArray n (0.0::Double)
  m <- newIOArray n (0.0::Double)
  writeIOArray m 0 solar
  let body i px py pz pvx pvy pvz pm = do
        writeIOArray x i px; writeIOArray y i py; writeIOArray z i pz
        writeIOArray vx i (pvx*dpy); writeIOArray vy i (pvy*dpy); writeIOArray vz i (pvz*dpy)
        writeIOArray m i (pm*solar)
  body 1 4.84143144246472090 (0.0-1.16032004402742839) (0.0-0.103622044471123109)
         0.00166007664274403694 0.00769901118419740425 (0.0-0.0000690460016972063023)
         0.000954791938424326609
  body 2 8.34336671824457987 4.12479856412430479 (0.0-0.403523417114321381)
         (0.0-0.00276742510726862411) 0.00499852801234917238 0.0000230417297573763929
         0.000285885980666130812
  body 3 12.8943695621391310 (0.0-15.1111514016986312) (0.0-0.223307578892655734)
         0.00296460137564761618 0.00237847173959480950 (0.0-0.0000296589568540237556)
         0.0000436624404335156298
  body 4 15.3796971148509165 (0.0-25.9193146099879641) 0.179258772950371181
         0.00268067772490389322 0.00162824170038242295 (0.0-0.0000951592254519715870)
         0.0000515138902046611451
  let px i acc = if i >= n then return acc
                 else do a <- readIOArray vx i; b <- readIOArray m i; px (i+1) (acc + a*b)
      py i acc = if i >= n then return acc
                 else do a <- readIOArray vy i; b <- readIOArray m i; py (i+1) (acc + a*b)
      pz i acc = if i >= n then return acc
                 else do a <- readIOArray vz i; b <- readIOArray m i; pz (i+1) (acc + a*b)
  p1 <- px 0 0.0; p2 <- py 0 0.0; p3 <- pz 0 0.0
  writeIOArray vx 0 (negate p1 / solar)
  writeIOArray vy 0 (negate p2 / solar)
  writeIOArray vz 0 (negate p3 / solar)
  let energy i acc =
        if i >= n then return acc else do
          mi <- readIOArray m i
          a <- readIOArray vx i; b <- readIOArray vy i; c <- readIOArray vz i
          let sp = 0.5 * mi * (a*a + b*b + c*c)
          let pair j ac = if j >= n then return ac else do
                xi <- readIOArray x i; xj <- readIOArray x j
                yi <- readIOArray y i; yj <- readIOArray y j
                zi <- readIOArray z i; zj <- readIOArray z j
                mj <- readIOArray m j
                let dx = xi-xj; dy = yi-yj; dz = zi-zj
                pair (j+1) (ac - mi*mj / sqrt (dx*dx + dy*dy + dz*dz))
          pv <- pair (i+1) 0.0
          energy (i+1) (acc + sp + pv)
      advance dt i =
        if i >= n then return () else do
          let vel j = if j >= n then return () else do
                xi <- readIOArray x i; xj <- readIOArray x j
                yi <- readIOArray y i; yj <- readIOArray y j
                zi <- readIOArray z i; zj <- readIOArray z j
                mi <- readIOArray m i; mj <- readIOArray m j
                let dx = xi-xj; dy = yi-yj; dz = zi-zj
                    d2 = dx*dx + dy*dy + dz*dz
                    mag = dt / (d2 * sqrt d2)
                a1 <- readIOArray vx i; b1 <- readIOArray vy i; c1 <- readIOArray vz i
                writeIOArray vx i (a1 - dx*mj*mag)
                writeIOArray vy i (b1 - dy*mj*mag)
                writeIOArray vz i (c1 - dz*mj*mag)
                a2 <- readIOArray vx j; b2 <- readIOArray vy j; c2 <- readIOArray vz j
                writeIOArray vx j (a2 + dx*mi*mag)
                writeIOArray vy j (b2 + dy*mi*mag)
                writeIOArray vz j (c2 + dz*mi*mag)
                vel (j+1)
          vel (i+1)
          advance dt (i+1)
      move i dt = if i >= n then return () else do
        a <- readIOArray x i; b <- readIOArray vx i; writeIOArray x i (a + dt*b)
        c <- readIOArray y i; d <- readIOArray vy i; writeIOArray y i (c + dt*d)
        e <- readIOArray z i; f <- readIOArray vz i; writeIOArray z i (e + dt*f)
        move (i+1) dt
      -- one dot per body per step; body 0 is the sun, the four planets get
      -- distinct entries in the C-side colour ramp
      plotBodies i = if i >= n then return () else do
        bx <- readIOArray x i; by <- readIOArray y i
        sdlPx bx; sdlPy by; sdlPt (18 + i * 26)
        plotBodies (i+1)
      steps k = if k <= 0 then return ()
                else advance 0.01 0 >> move 0 0.01 >> plotBodies 0 >>
                     (if k `mod` plotEvery == 0 then sdlFrame 1 else return ()) >>
                     steps (k-1)
  sdlOpen (plotW * 65536 + plotH)
  e0 <- energy 0 0.0
  sdlNum e0
  steps plotSteps
  e1 <- energy 0 0.0
  sdlNum e1
  sdlShow 0
