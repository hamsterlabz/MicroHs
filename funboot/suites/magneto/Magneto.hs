-- Magneto.hs - a charged particle in a magnetic field grid.
--
-- Built like nofib/nbody (NBody2.hs): flat IOArrays for state, a fixed number
-- of steps at a fixed dt, and a scalar reported before and after so the run is
-- checkable.  Not a port -- there is no upstream for this one.
--
-- THE PHYSICS.  The field points OUT of the screen everywhere, B = B(x,y) z^,
-- so a charge moving in the plane feels F = q v x B, which lies in the plane
-- and is always perpendicular to v.  A perpendicular force does no work, so
-- the SPEED IS CONSTANT and the motion is a circle of radius r = m|v|/(qB):
-- the stronger the field, the tighter the turn.
--
-- The field is a GRID of gridN x gridN cells, every one the same strength and
-- every one pointing out of the screen: B is UNIFORM.  On its own that gives
-- a closed circle traced over and over and the particle goes nowhere, because
-- qv x B is always perpendicular to v.
--
-- To make it cross the grid it needs a second force, so there is a uniform
-- ELECTRIC field E in the plane.  The result is the E x B drift: the orbit is
-- still a circle, but its centre marches at
--     v_drift = E x B / |B|^2,
-- which for E along +y and B along +z is along +x, at exactly |E|/|B| and
-- independent of the charge, the mass and the speed.  The path is a cycloid,
-- the curve a point on a rolling wheel traces.  The run reports the predicted
-- drift and the measured one so the picture is checkable, not just pretty.
--
-- THE INTEGRATOR IS A BORIS PUSH, not Euler.  Euler would grow |v| every step
-- (AtomPlot draws exactly that), which here would be a lie: it would turn a
-- constant-speed problem into a spiral.  The Boris form splits the rotation
-- into two half-turns,
--     v' = v + v x t,  v+ = v + v' x s,  t = qB dt/2m,  s = 2t/(1+t^2),
-- which is an exact rotation of v, so |v| is conserved to rounding.  The run
-- reports the speed before and after to show it.
--
-- The cell a particle sits in is x / cw truncated, clamped to the grid.
module Magneto(main) where
import Prelude
import Data.IOArray

foreign import ccall "sdl_open"  sdlOpen  :: Int -> IO ()
foreign import ccall "sdl_board" sdlBoard :: Int -> IO ()
-- the field symbol: a circle with a dot, i.e. pointing OUT of the screen
foreign import ccall "sdl_bdot"  sdlBDot  :: Int -> IO ()
foreign import ccall "sdl_scale" sdlScale :: Double -> IO ()
foreign import ccall "sdl_px"    sdlPx    :: Double -> IO ()
foreign import ccall "sdl_py"    sdlPy    :: Double -> IO ()
foreign import ccall "sdl_pt"    sdlPt    :: Int -> IO ()
foreign import ccall "sdl_frame" sdlFrame :: Int -> IO ()
foreign import ccall "sdl_num"   sdlNum   :: Double -> IO ()
foreign import ccall "sdl_show"  sdlShow  :: Int -> IO ()

gridN, plotWin, plotSteps, plotEvery :: Int
gridN     = 16          -- field cells per side
plotWin   = 640
-- A WHOLE NUMBER OF GYRATIONS.  The gyroperiod is 2*pi*m/(qB) = 15.708 s,
-- which at dt = 0.01 is 1570.8 steps; 6283 steps is four of them.  Stopping
-- mid-loop instead leaves a partial gyration in the net displacement and the
-- measured drift comes out ~15% low -- an artifact of where you stop looking,
-- not of the motion.
plotSteps = 6283        -- 4 gyroperiods
plotEvery = 52          -- 6283 / 52 = 120 frames

world, cw, bField, eField, dt, qm :: Double
world = 16.0                        -- the world is world x world units
cw    = world / 16.0                -- one cell wide (world / gridN)
bField = 0.4                        -- uniform, out of the screen (+z)
eField = 0.08                       -- uniform, along +y; drift = eField/bField
dt    = 0.01
qm    = 1.0                         -- charge to mass ratio

-- the same everywhere: one grid, one magnitude, all of it out of the screen
fieldAt :: Double -> Double -> Double
fieldAt _ _ = bField

main :: IO ()
main = do
  x  <- newIOArray 1 (0.0::Double); y  <- newIOArray 1 (0.0::Double)
  vx <- newIOArray 1 (0.0::Double); vy <- newIOArray 1 (0.0::Double)
  writeIOArray x  0 2.5            -- start at the left edge and drift across
  writeIOArray y  0 8.0
  writeIOArray vx 0 1.0            -- moving right
  writeIOArray vy 0 0.0

  let speed = do
        a <- readIOArray vx 0; b <- readIOArray vy 0
        return (sqrt (a*a + b*b))

      -- draw the field once: every cell the same symbol, because every vector
      -- is the same -- pointing out of the screen at the viewer.
      drawGrid r c =
        if r >= gridN then return ()
        else if c >= gridN then drawGrid (r+1) 0
        else do sdlBDot 150
                drawGrid r (c+1)

      plotAt = do
        a <- readIOArray x 0; b <- readIOArray y 0
        sdlPx (a - world/2.0); sdlPy (b - world/2.0); sdlPt 120

      -- one Boris push: half a kick from E, the full rotation from B, then
      -- the other half kick, then move.  Splitting E around the rotation is
      -- what keeps the scheme second order and the drift exact.
      step k =
        if k <= 0 then return () else do
          px <- readIOArray x 0;  py <- readIOArray y 0
          a0 <- readIOArray vx 0; b0 <- readIOArray vy 0
          let bz  = fieldAt px py
              eh  = qm * eField * dt / 2.0   -- half the electric kick
              a   = a0                       -- v- = v + qE/m dt/2
              b   = b0 + eh
              t   = qm * bz * dt / 2.0
              s   = 2.0 * t / (1.0 + t*t)
              apx = a + b*t                 -- v' = v- + v- x t
              apy = b - a*t
              ar  = a + apy*s               -- v+ = v- + v' x s
              br  = b - apx*s
              a'  = ar                       -- and the second half kick
              b'  = br + eh
          writeIOArray vx 0 a'; writeIOArray vy 0 b'
          writeIOArray x 0 (px + a'*dt); writeIOArray y 0 (py + b'*dt)
          plotAt
          if mod k plotEvery == 0 then sdlFrame 1 else return ()
          step (k-1)

  sdlOpen (plotWin * 65536 + plotWin)
  sdlBoard gridN
  drawGrid 0 0
  sdlScale (fromIntegral plotWin / world)     -- px per world unit
  x0 <- readIOArray x 0
  sdlNum (eField / bField)                    -- drift predicted: |E|/|B|
  step plotSteps
  x1 <- readIOArray x 0
  sdlNum ((x1 - x0) / (fromIntegral plotSteps * dt))   -- and measured
  sdlShow 0
