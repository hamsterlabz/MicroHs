-- Mandel2.hs - nofib spectral/mandel2, verbatim port to the NanoPrelude
-- dialect. Double -> Float only (binary32 dot operators). size stays 200.
-- Glue: par as in the source (a `par` b = b), "NS"/"EW" string literals as
-- [Int] with eqStr, fixed size' = maxI 1 size replacing the getArgs trick,
-- and the result consumed exactly as the original: finite tree.
module Mandel2 where
import Prelude()
import NanoPrelude

par :: a -> b -> b
par a b = b

data MandTree = NS   MandTree MandTree
              | EW   MandTree MandTree
              | Leaf Int

size :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastSize, simSize :: Int
fastSize = 200
simSize = 14

size = simSize

eqStr :: [Int] -> [Int] -> Bool
eqStr []     []     = True
eqStr (a:as) (b:bs) = a == b && eqStr as bs
eqStr _      _      = False

nsStr :: [Int]
nsStr = [78,83]

ewStr :: [Int]
ewStr = [69,87]

build_tree :: (Int,Int) -> (Int,Int) -> MandTree
build_tree p1 p2 =
  if rec_col /= (0-1) then
    Leaf rec_col
  else
    if eqStr split nsStr then
      btns1 `par` (btns2 `seq` (NS btns1 btns2))
    else
      btew1 `par` (btew2 `seq` (EW btew1 btew2))
  where
    (x1,y1) = p1
    (x2,y2) = p2
    rec_col = check_perim p1 p2
    split   = if (x2-x1) >= (y2-y1) then nsStr else ewStr
    nsp1    = p1
    nsp2    = (split_x, y2)
    nsp3    = (split_x+1, y1)
    nsp4    = p2
    ewp1    = p1
    ewp2    = (x2, split_y)
    ewp3    = (x1, split_y+1)
    ewp4    = p2
    split_x = div (x2+x1) 2
    split_y = div (y2+y1) 2
    btns1   = build_tree nsp1 nsp2
    btns2   = build_tree nsp3 nsp4
    btew1   = build_tree ewp1 ewp2
    btew2   = build_tree ewp3 ewp4

check_perim :: (Int,Int) -> (Int,Int) -> Int
check_perim p1 p2 =
  if equalp p1 p2 then
    point_colour p1
  else if corners_diff then
    0-1
  else
    check_sides
  where
    (x1,y1) = p1
    (x2,y2) = p2

    corners_diff = if col1 == col2 then
                     if col1 == col3 then
                       if col1 == col4 then
                         False
                       else
                         True
                     else
                       True
                   else
                     True

    col1 = point_colour p1
    col2 = point_colour (x2,y1)
    col3 = point_colour (x2,y2)
    col4 = point_colour (x1,y2)

    check_sides = if check_line (x1+1,y1) right then
                    if check_line (x2,y1+1) down then
                      if check_line (x2-1,y2) left then
                        if check_line (x1,y2-1) up then
                          col1
                        else
                          0-1
                      else
                        0-1
                    else
                      0-1
                  else
                    0-1

    check_line pc pd =
      if finished then
        True
      else if point_colour pc /= col1 then
        False
      else
        check_line (xc+xd, yc+yd) pd
      where
        (xc,yc) = pc
        (xd,yd) = pd
        finished = if equalp pd right then
                     xc >= x2
                   else if equalp pd down then
                     yc <= y2
                   else if equalp pd left then
                     xc <= x1
                   else
                     yc >= y1

point_colour :: (Int,Int) -> Int
point_colour (x, y) = check_radius (np x) (nq y) 0 (fromIntD 0) (fromIntD 0)

check_radius :: FloatW -> FloatW -> Int -> FloatW -> FloatW -> Int
check_radius p q k x y = if kp == num_cols then
                           0
                         else
                           if r >. fromIntD m then
                             kp
                           else
                             check_radius p q kp xn yn
                                  where xn = new_x x y p
                                        yn = new_y x y q
                                        r  = radius xn yn
                                        kp = k + 1

pmn :: FloatW
pmn = negateD (fromIntD 225 /. fromIntD 100)

pmx :: FloatW
pmx = fromIntD 75 /. fromIntD 100

qmn :: FloatW
qmn = negateD (fromIntD 15 /. fromIntD 10)

qmx :: FloatW
qmx = fromIntD 15 /. fromIntD 10

m :: Int
m = 20

equalp :: (Int,Int) -> (Int,Int) -> Bool
equalp (x1, y1) (x2, y2) = (x1 == x2) && (y1 == y2)

num_cols :: Int
num_cols = 26

delta_p :: FloatW
delta_p = (pmx -. pmn) /. fromIntD (size - 1)

delta_q :: FloatW
delta_q = (qmx -. qmn) /. fromIntD (size - 1)

np :: Int -> FloatW
np x = pmn +. fromIntD x *. delta_p

nq :: Int -> FloatW
nq y = qmn +. fromIntD y *. delta_q

radius :: FloatW -> FloatW -> FloatW
radius x y = x *. x +. y *. y

new_x :: FloatW -> FloatW -> FloatW -> FloatW
new_x x y p = x *. x -. y *. y +. p

new_y :: FloatW -> FloatW -> FloatW -> FloatW
new_y x y q = fromIntD 2 *. x *. y +. q

up, down, left, right :: (Int,Int)
up    = ( 0, 0-1)
down  = ( 0, 1)
left  = (0-1, 0)
right = ( 1, 0)

finite :: MandTree -> Bool
finite (Leaf c)   = c == c
finite (NS t1 t2) = finite t1 && finite t2
finite (EW t1 t2) = finite t1 && finite t2

bench :: Int
bench = if finite (build_tree (0,0) (size', div size' 2)) then 1 else 0
  where size' = maxI 1 size

main :: Int
main = bench

maxI :: Int -> Int -> Int
maxI a b = if a >= b then a else b
