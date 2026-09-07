-- SpherePlot.hs - a COPY of Sphere.hs (nofib spectral/sphere), plotted (Impala ray tracer for spheres),
-- verbatim port to the NanoPrelude dialect. Double -> Float (binary32).
-- nofib FAST opts: 30 (window size); the replicateM_ 100 wrapper repeats
-- identical work and is dropped. tan comes from the shared 12-term
-- sin/cos series (X2n1 precedent), (**) is an explicit integer power
-- (Specpow is 3.0 throughout this world), round is truncate(x+0.5) on the
-- non-negative colours: all identical op sequences on both arms. Decimal
-- literals are spelled as integer ratios. The benchmark's own hash is the
-- result.
-- MODIFIED ONLY AT THE BOUNDARY.  The tracer is Sphere.hs untouched -- the
-- same camera, world, lights, tracepixel and shading -- and `ray` already
-- yields one colour per pixel in raster order.  Sphere.hs folds those colours
-- into a hash; this one sends them to SDL instead, so the image is literally
-- the benchmark's own output rather than a re-render.
--
-- The colours do NOT go through the benchmark's roundU8 (truncate (x + 0.5)):
-- truncate is broken on this backend, so each component crosses as its
-- binary32 payload and the scaling to 0..255 happens in C.
--
-- One deliberate difference: the window is 200 rather than the RTL sim scale
-- of 3 (nofib FAST is 30).  This runs native, so it can afford a picture.
module SphereA where
import Prelude()
import NanoPrelude

foreign import ccall "sdl_open_cps" sdlOpen :: Int -> a -> a
foreign import ccall "sdl_cr_cps"   sdlCr   :: FloatW -> a -> a
foreign import ccall "sdl_cg_cps"   sdlCg   :: FloatW -> a -> a
foreign import ccall "sdl_cb_cps"   sdlCb   :: FloatW -> a -> a
foreign import ccall "sdl_show_cps" sdlShow :: Int -> a -> a

plotWin :: Int
plotWin = 60

type F = FloatW

d :: Int -> Int -> F
d n m = fromIntD n /. fromIntD m

epsilon, infinity :: F
epsilon  = d 1 1000000
infinity = big *. big
  where big = fromIntD 100000 *. fromIntD 100000    -- 1.0e10; squared = 1.0e20

piD :: F
piD = fromIntD 3 +. d 14159265 100000000

sinD :: F -> F
sinD x = go 0 x x
  where
    x2 = x *. x
    go k term acc =
      if k >= 12 then acc
      else let term' = negateD term *. x2 /. fromIntD ((2*k+2) * (2*k+3))
           in go (k+1) term' (acc +. term')

cosD :: F -> F
cosD x = go 0 (fromIntD 1) (fromIntD 1)
  where
    x2 = x *. x
    go k term acc =
      if k >= 12 then acc
      else let term' = negateD term *. x2 /. fromIntD ((2*k+1) * (2*k+2))
           in go (k+1) term' (acc +. term')

tanD :: F -> F
tanD x = sinD x /. cosD x

-- (**) with the integral exponents this program uses
powD :: F -> F -> F
powD a b = go (truncateD b)
  where go n = if n <= 0 then fromIntD 1 else a *. go (n-1)

roundU8 :: F -> Int
roundU8 x = truncateD (x +. d 1 2)

--------------------------------------------------------------------------------
-- vector operations

type Vector = (F, F, F)

vecadd, vecsub, vecmult :: Vector -> Vector -> Vector
vecadd  (x1,y1,z1) (x2,y2,z2) = (x1+.x2, y1+.y2, z1+.z2)
vecsub  (x1,y1,z1) (x2,y2,z2) = (x1-.x2, y1-.y2, z1-.z2)
vecmult (x1,y1,z1) (x2,y2,z2) = (x1*.x2, y1*.y2, z1*.z2)

vecsum :: [Vector] -> Vector
vecsum = foldr vecadd (zero,zero,zero)
  where zero = fromIntD 0

vecnorm :: Vector -> (Vector, F)
vecnorm (x,y,z) = ((x/.len, y/.len, z/.len), len)
      where len = sqrtD (x*.x +. y*.y +. z*.z)

vecscale :: Vector -> F -> Vector
vecscale (x,y,z) a = (a*.x, a*.y, a*.z)

vecdot :: Vector -> Vector -> F
vecdot (x1,y1,z1) (x2,y2,z2) = x1*.x2 +. y1*.y2 +. z1*.z2

veccross :: Vector -> Vector -> Vector
veccross (x1,y1,z1) (x2,y2,z2) = (y1*.z2-.y2*.z1, z1*.x2-.z2*.x1, x1*.y2-.x2*.y1)

is_zerovector :: Vector -> Bool
is_zerovector (x,y,z) = x <. epsilon && y <. epsilon && z <. epsilon

--------------------------------------------------------------------------------
-- type declarations

data Light = Directional Vector Vector
           | Point Vector Vector

lightdir :: Light -> Vector
lightdir (Directional dir col) = fst (vecnorm dir)

lightcolour :: Light -> Vector
lightcolour (Directional dir col) = col
lightcolour (Point pos col)       = col

data Surfspec = Ambient Vector
              | Diffuse Vector
              | Specular Vector
              | Specpow F
              | Reflect F
              | Transmit F
              | Refract F
              | Body Vector

headD :: [a] -> a
headD (x:_) = x

ambientsurf :: [Surfspec] -> Vector
ambientsurf ss = headD (append [ s | Ambient s <- ss] [(z,z,z)]) where z = fromIntD 0

diffusesurf :: [Surfspec] -> Vector
diffusesurf ss = headD (append [ s | Diffuse s <- ss] [(z,z,z)]) where z = fromIntD 0

specularsurf :: [Surfspec] -> Vector
specularsurf ss = headD (append [ s | Specular s <- ss] [(z,z,z)]) where z = fromIntD 0

specpowsurf :: [Surfspec] -> F
specpowsurf ss = headD (append [ s | Specpow s <- ss] [fromIntD 8])

reflectsurf :: [Surfspec] -> F
reflectsurf ss = headD (append [ s | Reflect s <- ss] [fromIntD 0])

transmitsurf :: [Surfspec] -> F
transmitsurf ss = headD (append [ s | Transmit s <- ss] [fromIntD 0])

refractsurf :: [Surfspec] -> F
refractsurf ss = headD (append [ s | Refract s <- ss] [fromIntD 1])

bodysurf :: [Surfspec] -> Vector
bodysurf ss = headD (append [ s | Body s <- ss] [(o,o,o)]) where o = fromIntD 1

data Sphere = Sphere Vector F [Surfspec]

spheresurf :: Sphere -> [Surfspec]
spheresurf (Sphere pos rad surf) = surf

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

--------------------------------------------------------------------------------
-- example image with the standard balls

lookat, vup :: Vector
lookat = (fromIntD 0, fromIntD 0, fromIntD 0)
vup    = (fromIntD 0, fromIntD 0, fromIntD 1)

fov :: F
fov = fromIntD 45

world :: [Sphere]
world = testspheres

s2 :: [Surfspec]
s2 = [Ambient (d 35 1000, d 325 10000, d 25 1000), Diffuse (d 5 10, d 45 100, d 35 100),
      Specular (d 8 10, d 8 10, d 8 10), Specpow (fromIntD 3), Reflect (d 5 10)]

testspheres :: [Sphere]
testspheres = [ Sphere (fromIntD 0, fromIntD 0, fromIntD 0) (d 5 10) s2
              , Sphere (d 272166 1000000, d 272166 1000000, d 544331 1000000) (d 166667 1000000) s2
              , Sphere (d 643951 1000000, d 172546 1000000, fromIntD 0) (d 166667 1000000) s2
              , Sphere (d 172546 1000000, d 643951 1000000, fromIntD 0) (d 166667 1000000) s2
              , Sphere (negateD (d 371785 1000000), d 996195 10000000, d 544331 1000000) (d 166667 1000000) s2
              , Sphere (negateD (d 471405 1000000), d 471405 1000000, fromIntD 0) (d 166667 1000000) s2
              , Sphere (negateD (d 643951 1000000), negateD (d 172546 1000000), fromIntD 0) (d 166667 1000000) s2
              , Sphere (d 996195 10000000, negateD (d 371785 1000000), d 544331 1000000) (d 166667 1000000) s2
              , Sphere (negateD (d 172546 1000000), negateD (d 643951 1000000), fromIntD 0) (d 166667 1000000) s2
              , Sphere (d 471405 1000000, negateD (d 471405 1000000), fromIntD 0) (d 166667 1000000) s2
              ]

testlights :: [Light]
testlights = [ Point (fromIntD 4, fromIntD 3, fromIntD 2) lc
             , Point (fromIntD 1, negateD (fromIntD 4), fromIntD 4) lc
             , Point (negateD (fromIntD 3), fromIntD 1, fromIntD 5) lc ]
  where lc = (d 288675 1000000, d 288675 1000000, d 288675 1000000)

lookfrom, background :: Vector
lookfrom   = (d 21 10, d 13 10, d 17 10)
background = (d 78 1000, d 361 1000, d 753 1000)

--------------------------------------------------------------------------------
-- main routine

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

ray :: Int -> [((Int, Int),Vector)]
ray winsize = [ ((i,j), f i j) | i <- fromTo 0 (winsize-1), j <- fromTo 0 (winsize-1)]
    where
      lights = testlights
      (firstray, scrnx, scrny) = camparams lookfrom lookat vup fov (fromIntD winsize)
      f i j = tracepixel world lights (fromIntD i) (fromIntD j) firstray scrnx scrny

dtor :: F -> F
dtor x = x *. piD /. fromIntD 180

camparams :: Vector -> Vector -> Vector -> F -> F -> (Vector, Vector, Vector)
camparams lookfrom' lookat' vup' fov' winsize = (firstray, scrnx, scrny)
    where
      initfirstray = vecsub lookat' lookfrom'
      (lookdir, dist) = vecnorm initfirstray
      (scrni, _) = vecnorm (veccross lookdir vup')
      (scrnj, _) = vecnorm (veccross scrni lookdir)
      xfov = fov'
      yfov = fov'
      xwinsize = winsize
      ywinsize = winsize
      magx = fromIntD 2 *. dist *. tanD (dtor (xfov /. fromIntD 2)) /. xwinsize
      magy = fromIntD 2 *. dist *. tanD (dtor (yfov /. fromIntD 2)) /. ywinsize
      scrnx = vecscale scrni magx
      scrny = vecscale scrnj magy
      firstray = vecsub initfirstray
                        (vecadd (vecscale scrnx (d 5 10 *. xwinsize))
                                (vecscale scrny (d 5 10 *. ywinsize)))

tracepixel :: [Sphere] -> [Light] -> F -> F -> Vector -> Vector -> Vector -> Vector
tracepixel spheres lights x y firstray scrnx scrny
              = if hit
                  then shade lights sp pos dir dist (fromIntD 1, fromIntD 1, fromIntD 1)
                  else background
    where
      pos = lookfrom
      (dir, _) = vecnorm (vecadd (vecadd firstray (vecscale scrnx x))
                         (vecscale scrny y))
      (hit, dist, sp) = trace spheres pos dir

--------------------------------------------------------------------------------
-- first intersection

trace :: [Sphere] -> Vector -> Vector -> (Bool,F,Sphere)
trace spheres pos dir
              = if null dists
                  then (False, infinity, headD spheres)
                  else (True, mindist, sp)
    where
      (mindist, sp) = foldr f (headD dists) (tail' dists)
      tail' (_:xs) = xs
      f (d1,s1) (d2,s2') = if d1 <. d2 then (d1,s1) else (d2,s2')
      sphmap []     = []
      sphmap (x:xs) = if is_hit
                        then (where_hit, x):sphmap xs
                        else sphmap xs
              where (is_hit, where_hit) = sphereintersect pos dir x
      dists = sphmap spheres

--------------------------------------------------------------------------------
-- shader

shade :: [Light] -> Sphere -> Vector -> Vector -> F -> Vector -> Vector
shade lights sp lookpos dir dist contrib = rcol
    where
      hitpos = vecadd lookpos (vecscale dir dist)
      ambientlight = (fromIntD 1, fromIntD 1, fromIntD 1)
      surf = spheresurf sp
      amb = vecmult ambientlight (ambientsurf surf)
      norm = spherenormal hitpos sp
      refl = vecadd dir (vecscale norm (negateD (fromIntD 2) *. vecdot dir norm))
      diff = vecsum (map (\l -> lightray l hitpos norm refl surf) lights)
      transmitted = transmitsurf surf
      simple = vecadd amb diff
      trintensity = vecscale (bodysurf surf) transmitted
      (is_tir, trcol) = let index = refractsurf surf in
                        if transmitted <. epsilon
                          then (False, simple)
                          else transmitray lights simple hitpos dir
                                           index trintensity contrib norm
      reflsurf = vecscale (specularsurf surf) (reflectsurf surf)
      reflectiv = if is_tir
                    then vecadd trintensity reflsurf
                    else reflsurf
      rcol = if is_zerovector reflectiv
               then trcol
               else reflectray hitpos refl lights reflectiv contrib trcol

transmitray :: [Light] -> Vector -> Vector -> Vector -> F -> Vector -> Vector -> Vector -> (Bool, Vector)
transmitray lights colour pos dir index intens contrib norm
      = if is_zerovector newcontrib
          then (False, colour)
          else (False, vecadd (vecmult newcol intens) colour)
      where
      newcontrib         = vecmult intens contrib
      (is_tir, newdir)   = refractray index dir norm
      nearpos            = vecadd pos (vecscale newdir epsilon)
      (is_hit, dist, sp) = trace world nearpos newdir
      newcol = if is_hit then shade lights sp nearpos newdir dist newcontrib
               else background

reflectray :: Vector -> Vector -> [Light] -> Vector -> Vector -> Vector -> Vector
reflectray pos newdir lights intens contrib colour
      = if is_zerovector newcontrib
          then colour
          else vecadd colour (vecmult newcol intens)
      where
      newcontrib = vecmult intens contrib
      nearpos = vecadd pos (vecscale newdir epsilon)
      (is_hit, dist, sp) = trace world nearpos newdir
      newcol = if is_hit
                then shade lights sp nearpos newdir dist newcontrib
                else background

refractray :: F -> Vector -> Vector -> (Bool,Vector)
refractray newindex olddir innorm
              = if disc <. fromIntD 0
                  then (True, (fromIntD 0, fromIntD 0, fromIntD 0))
                  else (False, vecadd (vecscale norm t) (vecscale olddir nr))
      where
      dotp = negateD (vecdot olddir innorm)
      (norm, k, nr) = if dotp <. fromIntD 0
                        then (vecscale innorm (negateD (fromIntD 1)), negateD dotp, fromIntD 1 /. newindex)
                        else (innorm, dotp, newindex)
      disc = fromIntD 1 -. nr *. nr *. (fromIntD 1 -. k *. k)
      t = nr *. k -. sqrtD disc

lightray :: Light -> Vector -> Vector -> Vector -> [Surfspec] -> Vector
lightray l pos norm refl surf =
     let
       (ldir, dist) = lightdirection l pos
       cosangle = vecdot ldir norm
       (is_inshadow, lcolour) = shadowed pos ldir (lightcolour l)
     in
       if is_inshadow then (fromIntD 0, fromIntD 0, fromIntD 0)
       else
         let
           diff = diffusesurf surf
           spow = specpowsurf surf
         in
           if cosangle <=. fromIntD 0 then
             let bodycol = bodysurf surf
                 cosalpha = negateD (vecdot refl ldir)
                 diffcont = vecmult (vecscale diff (negateD cosangle)) lcolour
                 speccont = if cosalpha <=. fromIntD 0 then (fromIntD 0, fromIntD 0, fromIntD 0)
                            else vecmult (vecscale bodycol (powD cosalpha spow)) lcolour
             in vecadd diffcont speccont
           else
             let spec = specularsurf surf
                 cosalpha = vecdot refl ldir
                 diffcont = vecmult (vecscale diff cosangle) lcolour
                 speccont = if cosalpha <=. fromIntD 0 then (fromIntD 0, fromIntD 0, fromIntD 0)
                            else vecmult (vecscale spec (powD cosalpha spow)) lcolour
             in vecadd diffcont speccont

lightdirection :: Light -> Vector -> (Vector, F)
lightdirection (Directional dir col) pt = (fst (vecnorm dir), infinity)
lightdirection (Point pos col) pt       = vecnorm (vecsub pos pt)

shadowed :: Vector -> Vector -> a -> (Bool,a)
shadowed pos dir lcolour = if not is_hit
                            then (False, lcolour)
                            else (True, lcolour)
    where
      (is_hit, dist, sp) = trace world (vecadd pos (vecscale dir epsilon)) dir

--------------------------------------------------------------------------------
-- sphere specific items

sphereintersect :: Vector -> Vector -> Sphere -> (Bool,F)
sphereintersect pos dir sp = if disc <. fromIntD 0
                               then (False, fromIntD 0)
                               else if slo <. fromIntD 0
                                      then if shi <. fromIntD 0
                                             then (False, fromIntD 0)
                                             else (True, shi)
                                      else (True, slo)
      where
      slo = negateD bm -. sqrtD disc
      shi = negateD bm +. sqrtD disc
      Sphere spos rad _ = sp
      m = vecsub pos spos
      m2 = vecdot m m
      bm = vecdot m dir
      disc = bm *. bm -. m2 +. rad *. rad

spherenormal :: Vector -> Sphere -> Vector
spherenormal pos sp = vecscale (vecsub pos spos) (fromIntD 1 /. rad)
    where
      Sphere spos rad _ = sp

--------------------------------------------------------------------------------
-- the benchmark's own hash is the result

hashV :: [Vector] -> Int
hashV = foldr (\(r,g,b) acc -> u8 r + u8 g*7 + u8 b*23 + acc*61) 0
  where
    u8 x = roundU8 (fromIntD 255 *. x)

winsize :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastWin, simWin :: Int
fastWin = 30
simWin = 3

winsize = simWin

bench :: Int
bench = hashV (map snd (ray winsize))

-- the plot: one pixel per traced colour, in the order `ray` produces them
plotPix :: [Vector] -> a -> a
plotPix []          k = k
plotPix ((r,g,b):t) k = sdlCr r (sdlCg g (sdlCb b (plotPix t k)))

main :: Int
main = sdlOpen ((plotWin * 65536) + plotWin)
         (plotPix (map snd (ray plotWin)) (sdlShow 0 0))
