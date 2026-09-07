-- Nmr.hs - a single spin in a uniform field, SEEN FROM THE ROTATING FRAME:
-- pulse, precession, relaxation.
--
-- Built like Magneto.hs and nofib/nbody: flat IOArrays, a fixed dt, and
-- numbers reported so the picture is checkable.  All the physics is here; C
-- only rasterises.
--
-- THE ROTATING FRAME.  In the laboratory M precesses about B0 at the Larmor
-- rate w0 = gamma B0, which for a real spectrometer is hundreds of MHz: the
-- interesting motion is buried under a blur of fast rotation, and the pulse
-- field has to be an OSCILLATING one to keep up with it.  So the whole
-- picture is taken in a frame rotating about z at the transmitter frequency
-- w_rf.  In that frame
--
--     B_eff = ( B1, 0, B0 - w_rf/gamma )
--
-- and two things change.  B1 stops oscillating and stands still along x --
-- that is what the frame is for.  And the z field is no longer B0 but the
-- RESONANCE OFFSET, what is left when the transmitter does not match the
-- Larmor frequency exactly.  On exact resonance it is zero and M does not
-- precess at all in this frame; a small offset makes it turn slowly, which is
-- the precession that is actually visible to a spectroscopist.
--
-- THE MODEL is then the Bloch equation with that effective field:
--
--     dM/dt = gamma (M x B_eff)  -  (Mx,My,0)/T2  -  (0,0,Mz-M0)/T1
--
-- The first term rotates M and changes no length.  The other two are
-- relaxation, which is frame independent -- it does not care who is looking:
-- T2 collapses the TRANSVERSE part and T1 pulls the LONGITUDINAL part back to
-- its equilibrium M0, with T2 <= T1 always.  The picture is the difference
-- between them: the tip spirals inward fast and climbs to the pole slowly.
--
-- THE RUN has two phases.
--   1. EQUILIBRIUM, held long enough to see: M lies along B0 and nothing
--      moves, because M x B is zero when the two are parallel.
--   2. THE PULSE.  B1 is on for tPulse.  Because B1 is much larger than the
--      offset, B_eff points along x and M simply TILTS about it, through
--      gamma |B_eff| tPulse.  This one turns pi/2: a 90 degree pulse, taking
--      M from the pole to the equator along a clean meridian -- in the lab
--      frame the same motion is a corkscrew, which is why nobody draws it
--      there.
--   3. FREE EVOLUTION.  B1 off, so the only field left is the offset along z.
--      M precesses about it SLOWLY -- a few turns over the whole run, not
--      thousands -- while T2 shrinks the transverse component and T1 restores
--      Mz.  The tip spirals in and up, back to where it started.
--
-- THE PRECESSION IS A BORIS ROTATION, the 3D form of the one Magneto uses:
--     M' = M + M x t,  M+ = M + M' x s,  t = gamma B dt/2,  s = 2t/(1+|t|^2)
-- which is an exact rotation about B, so precession alone cannot change |M|.
-- That matters: any change in |M| then belongs to relaxation, which is the
-- physics, rather than to the integrator, which would be a bug.  Euler would
-- have grown |M| every step (AtomPlot draws that failure).
module Nmr(main) where
import Prelude
import Data.IOArray

foreign import ccall "sdl_open"  sdlOpen  :: Int -> IO ()
foreign import ccall "sdl_scale" sdlScale :: Double -> IO ()
foreign import ccall "sdl_px"    sdlPx    :: Double -> IO ()
foreign import ccall "sdl_py"    sdlPy    :: Double -> IO ()
foreign import ccall "sdl_pt"    sdlPt    :: Int -> IO ()
foreign import ccall "sdl_frame" sdlFrame :: Int -> IO ()
foreign import ccall "sdl_num"   sdlNum   :: Double -> IO ()
foreign import ccall "sdl_show"  sdlShow  :: Int -> IO ()

plotWin, plotFrames, stepsPerFrame, pulseStart, pulseSteps, trailEvery :: Int
plotWin       = 640
plotFrames    = 120
stepsPerFrame = 100     -- 120 * 100 = 12000 steps
-- THE PULSE LENGTH IS THE TIP ANGLE.  M rotates about B_eff = (b1,0,bOff) by
-- gamma |B_eff| t, and |B_eff| = 10.001 here, so pi/2 needs t = 0.157 s = 16
-- steps.
-- THE PULSE WAITS.  Held off for 15 frames so the run opens on equilibrium:
-- M at full length along B0, motionless because a vector parallel to the
-- field feels no torque.  Firing at t = 0 hides the state the pulse acts on.
pulseStart    = 1500    -- 15 frames of equilibrium first
trailEvery    = 10      -- record the tip every 10 steps: 1200 samples
pulseSteps    = 16

bOff, b1, gam, t1, t2, m0, dt :: Double
-- the RESONANCE OFFSET, B0 - w_rf/gamma, not B0 itself: in the rotating frame
-- that is all that is left along z.  Zero would be exact resonance and no
-- precession at all; this is a small deliberate offset so the precession is
-- visible.
-- OFF RESONANCE BY MORE.  The offset IS the difference between the
-- transmitter and the Larmor frequency, and it is the whole precession rate
-- in this frame: at 0.15 the two were nearly matched and M barely turned
-- before it relaxed.  0.6 rad/s is a 10.5 s period, so the FID rings about
-- ten times over the run.  It stays far below b1 = 10, which is what keeps
-- the pulse hard and the tip axis along x.
bOff = 0.6
b1   = 10.0             -- the pulse field, static along +x in this frame
gam  = 1.0
-- A LONGER FID.  T2 is what sets its length -- the transverse signal decays
-- as exp(-t/T2) and that decay IS the FID envelope.  At 25 s it was gone in a
-- couple of turns; 45 s lets it ring for most of the run while still ending
-- decayed (exp(-105/45) = 0.10).  T2 <= T1 always.
t1   = 60.0             -- longitudinal recovery
t2   = 45.0             -- transverse decay: the FID envelope
m0   = 1.0
dt   = 0.01

-- THE VIEW.  An oblique projection with fixed constants, no trig: x to the
-- right, y back-and-right, z up (screen y counts down, hence the negation).
projX :: Double -> Double -> Double -> Double
projX mx my _  = mx + 0.55 * my
projY :: Double -> Double -> Double -> Double
projY mx my mz = 0.0 - (mz - 0.42 * my)

-- EVERY LINE IS DRAWN IN mhs.  C plots one point; a segment is n points along
-- it, projected here.  Keeping it this side means the 3D scene -- axes, field
-- arrows, the vector itself -- is the program's, not the renderer's.
plotP :: Int -> Double -> Double -> Double -> IO ()
plotP col x y z = do sdlPx (projX x y z); sdlPy (projY x y z); sdlPt col

seg :: Int -> Int -> Double -> Double -> Double -> Double -> Double -> Double -> IO ()
seg col n x0 y0 z0 x1 y1 z1 = go 0
  where go i = if i > n then return () else do
                 let f = fromIntegral i / fromIntegral n
                 plotP col (x0 + (x1-x0)*f) (y0 + (y1-y0)*f) (z0 + (z1-z0)*f)
                 go (i+1)

-- an arrow: the shaft, then two barbs pulled back from the tip
arrow :: Int -> Double -> Double -> Double -> Double -> Double -> Double -> IO ()
arrow col x0 y0 z0 x1 y1 z1 = do
  seg col 60 x0 y0 z0 x1 y1 z1
  let dx = x1-x0; dy = y1-y0; dz = z1-z0
      hx = x1 - 0.16*dx; hy = y1 - 0.16*dy; hz = z1 - 0.16*dz
  seg col 8 x1 y1 z1 (hx + 0.05*dz) (hy - 0.05*dx) (hz + 0.05*dy)
  seg col 8 x1 y1 z1 (hx - 0.05*dz) (hy + 0.05*dx) (hz - 0.05*dy)

-- THE FIELD, drawn the way Magneto draws it: a grid of identical vectors, so
-- the eye sees at once that it is uniform.  Magneto looked ALONG B and drew
-- circle-and-dot; here the view is from the side, so the same field is a grid
-- of arrows pointing up +z, which is where B0 lies.
field :: IO ()
field = row (0-2)
  where
    row i = if i > 2 then return () else do col i (0-2); row (i+1)
    col i j = if j > 2 then return () else do
                let x = fromIntegral i * 0.62
                    y = fromIntegral j * 0.62
                arrow 57 x y (0.0-1.25) x y (0.0-0.55)   -- dim: background
                col i (j+1)

axes :: IO ()
axes = do
  arrow 210 0.0 0.0 0.0 1.35 0.0 0.0        -- x
  arrow 210 0.0 0.0 0.0 0.0 1.35 0.0        -- y
  arrow 210 0.0 0.0 0.0 0.0 0.0 1.35        -- z, and B0 lies along it
  seg   210 6 1.35 0.0 0.0 1.20 0.0 0.12    -- a nick to mark x
  seg   210 6 0.0 0.0 1.35 0.10 0.0 1.22    -- and z

main :: IO ()
main = do
  m  <- newIOArray 3 (0.0::Double)
  -- THE TRAIL IS SAMPLED FINELY, every trailEvery steps rather than once per
  -- frame: ten precession turns drawn at 12 points each is a polygon, not a
  -- spiral.  1200 samples is ~120 per turn.
  tr <- newIOArray (3 * 1300) (0.0::Double)
  writeIOArray m 0 0.0            -- t = 0: ALIGNED WITH THE FIELD, along +z,
  writeIOArray m 1 0.0            -- which is what equilibrium means -- there
  writeIOArray m 2 m0             -- is no torque, so nothing moves yet

  let lenM = do
        mx <- readIOArray m 0; my <- readIOArray m 1; mz <- readIOArray m 2
        return (sqrt (mx*mx + my*my + mz*mz))

      -- one Bloch step: an exact rotation about B_eff, then relaxation
      step k =
        if k > stepsPerFrame then return () else do
          mx <- readIOArray m 0; my <- readIOArray m 1; mz <- readIOArray m 2
          nk <- readIOArray tr 0
          return ()
          step (k+1)

  -- the physics, one step, with the global step index passed in
  let bloch gk = do
        mx <- readIOArray m 0; my <- readIOArray m 1; mz <- readIOArray m 2
        let bx = if gk > pulseStart && gk <= pulseStart + pulseSteps
                 then b1 else 0.0
            bz = bOff
            tx = gam * bx * dt / 2.0
            tz = gam * bz * dt / 2.0
            tt = tx*tx + tz*tz
            sx = 2.0 * tx / (1.0 + tt)
            sz = 2.0 * tz / (1.0 + tt)
            px = my*tz
            py = mz*tx - mx*tz
            pz = 0.0 - my*tx
            ax = mx + px; ay = my + py; az = mz + pz
            qx = ay*sz
            qy = az*sx - ax*sz
            qz = 0.0 - ay*sx
            rx = mx + qx; ry = my + qy; rz = mz + qz
            fx = rx * (1.0 - dt/t2)
            fy = ry * (1.0 - dt/t2)
            fz = rz + (m0 - rz) * (dt/t1)
        writeIOArray m 0 fx; writeIOArray m 1 fy; writeIOArray m 2 fz

      run gk n =
        if n <= 0 then return gk else do
          bloch gk
          if mod gk trailEvery == 0
            then do mx <- readIOArray m 0; my <- readIOArray m 1; mz <- readIOArray m 2
                    let i = div gk trailEvery
                    writeIOArray tr (3*i) mx; writeIOArray tr (3*i+1) my
                    writeIOArray tr (3*i+2) mz
            else return ()
          run (gk+1) (n-1)

      -- redraw the whole scene: the frame is a picture of NOW, so the field,
      -- the axes and the vector are drawn afresh every time; only the trail
      -- carries history, and it is kept here rather than on the canvas.
      trail i n = if i >= n then return () else do
        x <- readIOArray tr (3*i); y <- readIOArray tr (3*i+1); z <- readIOArray tr (3*i+2)
        plotP 120 x y z
        trail (i+1) n

      scene n = do
        field
        axes
        trail 0 n
        mx <- readIOArray m 0; my <- readIOArray m 1; mz <- readIOArray m 2
        -- M itself, as a vector from the origin.  Drawn three times a pixel
        -- apart: it is the subject of the picture and a one-pixel dotted line
        -- loses against the field behind it.
        arrow 170 0.0 0.0 0.0 mx my mz
        arrow 170 0.006 0.0 0.0 (mx+0.006) my mz
        arrow 170 0.0 0.0 0.006 mx my (mz+0.006)
        sdlFrame 0                              -- write, then clear for the next

      frames f gk =
        if f > plotFrames then return () else do
          gk' <- run gk stepsPerFrame
          scene (div gk' trailEvery + 1)
          frames (f+1) gk'

  sdlOpen (plotWin * 65536 + plotWin)
  sdlScale (fromIntegral plotWin / 3.2)
  l0 <- lenM
  sdlNum l0                       -- |M| at equilibrium: 1, and aligned with B
  scene 0                         -- frame 0: equilibrium, before the pulse
  frames 0 1
  mzEnd <- readIOArray m 2
  sdlNum mzEnd
  lEnd <- lenM
  sdlNum lEnd
  sdlShow 0
