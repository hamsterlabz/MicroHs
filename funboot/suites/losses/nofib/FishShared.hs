-- FishShared.hs - the repeated rotations named once.
-- Fish.hs - nofib spectral/fish (Escher square-limit tiles), verbatim port
-- to the NanoPrelude dialect. All-Int geometry. The forM_ [1..30] wrapper
-- passes n = min 0 i = 0 every iteration (identical work) and is dropped;
-- the result is the original's own length of the formatted output.
module FishShared where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

type Vec = (Int, Int)

vec_add :: Vec -> Vec -> Vec
vec_add (x1,y1) (x2,y2) = (x1+x2, y1+y2)

vec_sub :: Vec -> Vec -> Vec
vec_sub (x1,y1) (x2,y2) = (x1-x2, y1-y2)

scale_vec2 :: Vec -> Int -> Int -> Vec
scale_vec2 (x,y) a b = (div (x*a) b, div (y*a) b)

type Line_segment = (Int, Int, Int, Int)
type Picture = Vec -> Vec -> Vec -> [Line_segment]

p_tile, q_tile, r_tile, s_tile :: [Line_segment]
p_tile =
 [(0,3,3,4), (3,4,0,8), (0,8,0,3), (6,0,4,4), (4,5,4,10),
  (4,10,7,6), (7,6,4,5), (11,0,10,4), (10,4,9,6), (9,6,8,8), (8,8,4,13),
  (4,13,0,16), (0,16,6,15), (6,15,8,16), (8,16,12,12), (12,12,16,12),
  (10,16,12,14), (12,14,16,13), (12,16,13,15), (13,15,16,14), (14,16,16,15),
  (8,12,16,10), (8,8,12,9), (12,9,16,8), (9,6,12,7), (12,7,16,6),
  (10,4,13,5), (13,5,16,4), (11,0,14,2), (14,2,16,2)]

q_tile =
 [(0,8,4,7), (4,7,6,7), (6,7,8,8), (8,8,12,10), (12,10,16,16),
  (0,12,3,13), (3,13,5,14), (5,14,7,15), (7,15,8,16), (2,16,3,13),
  (4,16,5,14), (6,16,7,15), (0,10,7,11), (9,13,8,15), (8,15,11,15),
  (11,15,9,13), (10,10,8,12), (8,12,12,12), (12,12,10,10), (2,0,4,5),
  (4,5,4,7), (4,0,6,5), (6,5,6,7), (6,0,8,5), (8,5,8,8), (10,0,14,11),
  (12,0,13,4), (13,4,16,8), (16,8,15,10), (15,10,16,16), (13,0,16,6),
  (14,0,16,4), (15,0,16,2), (0,0,8,0), (12,0,16,0), (0,0,0,8), (0,12,0,16)]

r_tile =
 [(0,0,8,8), (12,12,16,16), (0,4,5,10), (0,8,2,12), (0,12,1,14),
  (16,6,11,10), (11,10,6,16), (16,4,14,6), (14,6,8,8), (8,8,5,10),
  (5,10,2,12), (2,12,0,16), (16,8,12,12), (12,12,11,16), (1,1,4,0),
  (2,2,8,0), (3,3,8,2), (8,2,12,0), (5,5,12,3), (12,3,16,0), (11,16,12,12),
  (12,12,16,8), (13,13,16,10), (14,14,16,12), (15,15,16,14)]

s_tile =
 [(0,0,4,2), (4,2,8,2), (8,2,16,0), (0,4,2,1), (0,6,7,4),
  (0,8,8,6), (0,10,7,8), (0,12,7,10), (0,14,7,13), (13,13,16,14),
  (14,11,16,12), (15,9,16,10), (16,0,10,4), (10,4,8,6), (8,6,7,8),
  (7,8,7,13), (7,13,8,16), (12,16,13,13), (13,13,14,11), (14,11,15,9),
  (15,9,16,8), (10,16,11,10), (12,4,10,6), (10,6,12,7), (12,7,12,4),
  (15,5,13,7), (13,7,15,8), (15,8,15,5)]

nil :: Picture
nil a b c = []

grid :: Int -> Int -> [Line_segment] -> Picture
grid m n segments a b c
 = [tup2
   (a `vec_add` (scale_vec2 b x0 m) `vec_add` (scale_vec2 c y0 n))
   (a `vec_add` (scale_vec2 b x1 m) `vec_add` (scale_vec2 c y1 n))
        | (x0, y0, x1, y1) <- segments]

rot :: Picture -> Picture
rot p1 a b c = p1 (a `vec_add` b) c ((0, 0) `vec_sub` b)

beside :: Int -> Int -> Picture -> Picture -> Picture
beside m n p1 q1 a b c
    = append (p1 a (scale_vec2 b m (m+n)) c)
             (q1 (a `vec_add` (scale_vec2 b m (m+n))) (scale_vec2 b n (n+m)) c)

above :: Int -> Int -> Picture -> Picture -> Picture
above m n p1 q1 a b c
    = append (p1 (a `vec_add` (scale_vec2 c n (m+n))) b (scale_vec2 c m (n+m)))
             (q1 a b (scale_vec2 c n (m+n)))

tup2 :: (a, b) -> (c, d) -> (a, b, c, d)
tup2 (a, b) (c, d) = (a, b, c, d)

tile_to_grid :: [Line_segment] -> Picture
tile_to_grid = grid 16 16

p, q, r, s :: Picture
p = tile_to_grid p_tile
q = tile_to_grid q_tile
r = tile_to_grid r_tile
s = tile_to_grid s_tile

quartet a b c d = above 1 1 (beside 1 1 a b) (beside 1 1 c d)

t :: Picture
t = quartet p q r s

-- the rotation chain is built three times over: rot p1 appears on its own and
-- again inside rot (rot p1), which appears again inside rot (rot (rot p1)).
-- Naming each turn once makes the chain one shared spine.
cycle' p1 = let r1 = rot p1
                r2 = rot r1
                r3 = rot r2
            in  quartet p1 r3 r1 r2

u :: Picture
u = cycle' (rot q)
side1 = quartet nil nil (rot t) t
side2 = quartet side1 side1 (rot t) t
corner1 = quartet nil nil nil u
corner2 = quartet corner1 side1 (rot side1) u
pseudocorner = quartet corner2 side2 (rot side2) (rot t)
pseudolimit = cycle' pseudocorner
nonet p1 p2 p3 p4 p5 p6 p7 p8 p9
 = above 1 2 (beside 1 2 p1 (beside 1 1 p2 p3))
   (above 1 1 (beside 1 2 p4 (beside 1 1 p5 p6))
    (beside 1 2 p7 (beside 1 1 p8 p9)))
corner = let rs2 = rot side2
             rt  = rot t
         in  nonet corner2 side2 side2 rs2 u rt rs2 rt (rot q)
squarelimit = cycle' corner

-- fmt, rendered byte-exact ("[\n(a,b,c,d),\n...]")
showI :: Int -> [Int]
showI k = if k < 0 then 45 : showN (0-k) else showN k
  where showN j = if j < 10 then [48+j] else append (showN (div j 10)) [48 + mod j 10]

showTup :: Line_segment -> [Int]
showTup (a,b,c,d) = 40 : append (showI a) (44 : append (showI b)
                    (44 : append (showI c) (44 : append (showI d) [41])))

fmt :: [Line_segment] -> [Int]
fmt []     = [91,93]
fmt (x:xs) = append [91,10] (append (showTup x) (showl xs))
  where
    showl []     = [93]
    showl (y:ys) = append [44,10] (append (showTup y) (showl ys))

bench :: Int
bench = length (fmt (pseudolimit (0, 0) (640, 0) (0, 640)))

main :: Int
main = bench
