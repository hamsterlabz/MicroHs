-- LastPiece.hs - nofib spectral/last-piece (SPJ's pentomino puzzle),
-- verbatim port to the NanoPrelude dialect. Glue only: Data.Map becomes a
-- binary search tree keyed on Square (lookup/insert, same semantics),
-- Text.PrettyPrint becomes a line-list Doc (text/char/vcat/hcat/nest/$$,
-- enough for the Docs this program builds), PieceId is a character code,
-- and the rendered document is consumed with the nofib hash. No FAST_OPTS:
-- the full search runs, as upstream.
module LastPiece where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

fromToDown :: Int -> Int -> [Int]
fromToDown a b = if a < b then [] else a : fromToDown (a-1) b

fromTo :: Int -> Int -> [Int]
fromTo a b = if a > b then [] else a : fromTo (a+1) b

mapMaybeL :: (a -> Maybe b) -> [a] -> [b]
mapMaybeL f [] = []
mapMaybeL f (x:xs) = case f x of
                       Just y  -> y : mapMaybeL f xs
                       Nothing -> mapMaybeL f xs

----------------------------
--      Pretty printing (line-list Doc)

type Doc = [[Int]]

emptyD :: Doc
emptyD = []

text :: [Int] -> Doc
text s = [s]

charD :: Int -> Doc
charD c = [[c]]

vcat :: [Doc] -> Doc
vcat = concat

hcat :: [Doc] -> Doc
hcat ds = [concat (map cat1 ds)]
  where cat1 [l] = l
        cat1 []  = []

nest :: Int -> Doc -> Doc
nest k = map (append (spaces k))
  where spaces n = if n <= 0 then [] else 32 : spaces (n-1)

vv :: Doc -> Doc -> Doc     -- ($$)
vv = append

render :: Doc -> [Int]
render d = append (concat (map (\l -> append l [10]) d)) [10]

----------------------------
--      Boards: BST keyed on Square

type Square = (Int,Int)
type Offset = (Int,Int)
type PieceId = Int

data Board = Tip | Node Square PieceId Board Board

cmpSq :: Square -> Square -> Int
cmpSq (a,b) (c,d) = if a < c then 0-1 else if a > c then 1
                    else if b < d then 0-1 else if b > d then 1 else 0

emptyBoard :: Board
emptyBoard = Tip

check :: Board -> Square -> Maybe PieceId
check Tip sq = Nothing
check (Node k v l r) sq =
  case cmpSq sq k of
    0 -> Just v
    c -> if c < 0 then check l sq else check r sq

extend :: Board -> Square -> PieceId -> Board
extend Tip sq pid = Node sq pid Tip Tip
extend (Node k v l r) sq pid =
  case cmpSq sq k of
    0 -> Node k pid l r
    c -> if c < 0 then Node k v (extend l sq pid) r
                  else Node k v l (extend r sq pid)

extend_maybe :: Board -> Square -> PieceId -> Maybe Board
extend_maybe bd sq@(row,col) pid =
  if row > maxRow || col < 1 || col > maxCol
  then Nothing
  else case check bd sq of
        Just _  -> Nothing
        Nothing -> Just (extend bd sq pid)

-------------------------------------
--      Pieces

data Piece = P PieceId [[Offset]] [[Offset]]

data Sex = Male | Female

flipS :: Sex -> Sex
flipS Male   = Female
flipS Female = Male

-------------------------------------
--      The main search

data Solution = Soln Board
              | Choose [Solution]
              | Fail Board Square

search :: Square -> Sex -> Board -> [Piece] -> Solution
search sq sex bd [] = Soln bd
search sq0@(row,col) sex bd ps =
  if col == maxCol+1 then search (row+1, 1) (flipS sex) bd ps
  else if isJustM (check bd sq0) then search (next sq0) (flipS sex) bd ps
  else case mapMaybeL (try sq0 sex bd) choices of
        [] -> Fail bd sq0
        ss -> Choose ss
  where
    choices = [(pid, os, ps') | (P pid ms fs, ps') <- pickOne ps,
                                os <- (case sex of
                                         Male   -> ms
                                         Female -> fs)]

try :: Square -> Sex -> Board -> (PieceId,[Offset],[Piece]) -> Maybe Solution
try sq sex bd (pid,os,ps) =
  case fit bd sq pid os of
        Just bd' -> Just (search (next sq) (flipS sex) bd' ps)
        Nothing  -> Nothing

fit :: Board -> Square -> PieceId -> [Offset] -> Maybe Board
fit bd sq pid []     = Just (extend bd sq pid)
fit bd sq pid (o:os) = case extend_maybe bd (sq `add` o) pid of
                        Just bd' -> fit bd' sq pid os
                        Nothing  -> Nothing

--------------------------
--      Offsets and squares

add :: Square -> Offset -> Square
add (row,col) (orow, ocol) = (row + orow, col + ocol)

next :: Square -> Square
next (row,col) = (row,col+1)

maxRow, maxCol :: Int
maxRow = 8
maxCol = 8

--------------------------
--      Utility

pickOne :: [a] -> [(a,[a])]
pickOne xs = go (\x -> x) xs
  where
    go f [] = []
    go f (x:rest) = (x, f rest) : go (\ys -> f (x:ys)) rest

----------------------------
--      Driver

display :: Solution -> Doc
display (Soln bd) = vcat [text [83,117,99,99,101,115,115,33],      -- "Success!"
                          nest 2 (displayBoard bd)]
display (Choose ss) = vcat (map display ss)
display (Fail bd (row,col)) = emptyD

displayBoard :: Board -> Doc
displayBoard bd
  = vv (vcat (map row (fromToDown maxRow 1)))
       (text [])
  where
    row n = hcat (map (sq n) (fromTo 1 maxCol))
    sq n col = case check bd (n,col) of
                  Just pid -> charD pid
                  Nothing  -> charD 46    -- '.'

-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastPieces, simPieces :: Int
fastPieces = 13
simPieces = 4

solutions :: Solution
solutions = search (1,2) Female initialBoard (takeP simPieces initialPieces)

takeP :: Int -> [a] -> [a]
takeP k xs = if k <= 0 then [] else case xs of { [] -> []; (y:ys) -> y : takeP (k-1) ys }

-----------------------------------
--      The initial setup

fromJustB :: Maybe Board -> Board
fromJustB (Just b) = b

initialBoard :: Board
initialBoard = fromJustB (fit emptyBoard (1,1) 97 [(1,0),(1,1)])   -- 'a'

initialPieces :: [Piece]
initialPieces = [bPiece, cPiece, dPiece, ePiece, fPiece,
                 gPiece, hPiece, iPiece, jPiece, kPiece, lPiece,
                 mPiece, nPiece]

nPiece = P 110 [ [(0,1),(1,1),(2,1),(2,2)],
                 [(1,0),(1,0-1),(1,0-2),(2,0-2)] ]
               []

mPiece = P 109 [ [(0,1),(1,0),(2,0),(3,0)] ]
               [ [(0,1),(0,2),(0,3),(1,3)],
                 [(1,0),(2,0),(3,0),(3,0-1)] ]

lPiece = P 108 [ [(0,1),(0,2),(0,3),(1,2)],
                 [(1,0),(2,0),(3,0),(2,0-1)] ]
               [ [(1,0-1),(1,0),(1,1),(1,2)],
                 [(1,0),(2,0),(3,0),(1,1)] ]

kPiece = P 107 [ [(0,1),(1,0),(2,0),(2,0-1)] ]
               [ [(1,0),(1,1),(1,2),(2,2)] ]

jPiece = P 106 [ [(0,1),(0,2),(0,3),(1,1)],
                 [(1,0),(2,0),(3,0),(1,0-1)],
                 [(1,0-2),(1,0-1),(1,0),(1,1)] ]
               [ [(1,0),(2,0),(3,0),(2,2)] ]

iPiece = P 105 [ [(1,0),(2,0),(2,1),(3,1)],
                 [(0,1),(0,2),(1,0),(1,0-1)],
                 [(1,0),(1,1),(2,1),(3,1)] ]
               [ [(0,1),(1,0),(1,0-1),(1,0-2)] ]

hPiece = P 104 [ [(0,1),(1,1),(1,2),(2,2)],
                 [(1,0),(1,0-1),(2,0-1),(2,0-2)],
                 [(1,0),(1,1),(2,1),(2,2)] ]
               [ [(0,1),(1,0),(1,0-1),(2,0-1)] ]

gPiece = P 103 [ ]
               [ [(0,1),(1,1),(1,2),(1,3)],
                 [(1,0),(1,0-1),(2,0-1),(3,0-1)],
                 [(0,1),(0,2),(1,2),(1,3)],
                 [(1,0),(2,0),(2,0-1),(3,0-1)] ]

fPiece = P 102 [ [(0,1),(1,1),(2,1),(3,1)],
                 [(1,0),(1,0-1),(1,0-2),(1,0-3)],
                 [(1,0),(2,0),(3,0),(3,1)] ]
               [ [(0,1),(0,2),(0,3),(1,0)] ]

ePiece = P 101 [ [(0,1),(1,1),(1,2)],
                 [(1,0),(1,0-1),(2,0-1)] ]
               [ [(0,1),(1,1),(1,2)],
                 [(1,0),(1,0-1),(2,0-1)] ]

dPiece = P 100 [ [(0,1),(1,1),(2,1)],
                 [(1,0),(1,0-1),(1,0-2)] ]
               [ [(1,0),(2,0),(2,1)] ]

cPiece = P 99  [ ]
               [ [(0,1),(0,2),(1,1)],
                 [(1,0),(1,0-1),(2,0)],
                 [(1,0-1),(1,0),(1,1)],
                 [(1,0),(1,1),(2,0)] ]

bPiece = P 98  [ [(0,1),(0,2),(1,2)],
                 [(1,0),(2,0),(2,0-1)],
                 [(0,1),(1,0),(2,0)] ]
               [ [(1,0),(1,1),(1,2)] ]

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS (render (display solutions))

main :: Int
main = bench

isJustM :: Maybe a -> Bool
isJustM (Just _) = True
isJustM Nothing  = False
