-- Minimax.hs - nofib spectral/minimax (tic-tac-toe game-tree search:
-- Main + Prog + Game + Board + Tree + Wins), verbatim port to the
-- NanoPrelude dialect. The replicateM_ 180000 wrapper repeats identical
-- work (board input is always testBoard) and is dropped. Glue only:
-- derived Eq/Show by hand (Show Evaluation parenthesizes negative Score
-- arguments as GHC does), strings as [Int], and the printed game consumed
-- with the nofib hash.
module Minimax where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

-- Wins.hs
type Win = [[Int]]

wins :: [Win]
wins = [win1,win2,win3,win4,win5,win6,win7,win8]

win1,win2,win3,win4,win5,win6,win7,win8 :: Win
win1 = [[1,1,1],[0,0,0],[0,0,0]]
win2 = [[0,0,0],[1,1,1],[0,0,0]]
win3 = [[0,0,0],[0,0,0],[1,1,1]]
win4 = [[1,0,0],[1,0,0],[1,0,0]]
win5 = [[0,1,0],[0,1,0],[0,1,0]]
win6 = [[0,0,1],[0,0,1],[0,0,1]]
win7 = [[1,0,0],[0,1,0],[0,0,1]]
win8 = [[0,0,1],[0,1,0],[1,0,0]]

-- Tree.hs
data Tree a = Branch a [Tree a]

repTree :: (a -> [a]) -> (a -> [a]) -> a -> Tree a
repTree f g a = Branch a (map (repTree g f) (f a))

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f (Branch a l) = Branch (f a) (map (mapTree f) l)

prune :: Int -> Tree a -> Tree a
prune 0 (Branch a l) = Branch a []
prune n (Branch a l) = Branch a (map (prune (n-1)) l)

-- Board.hs
type Board = [Row]
type Row = [Piece]
data Piece = X | O | Empty

eqPiece :: Piece -> Piece -> Bool
eqPiece X X         = True
eqPiece O O         = True
eqPiece Empty Empty = True
eqPiece _ _         = False

showBoard :: Board -> [Int]
showBoard [r1,r2,r3] = append (showRow r1) (append dashes
                       (append (showRow r2) (append dashes
                       (append (showRow r3) [10,10]))))
  where dashes = [10,45,45,45,45,45,45,10]    -- "\n------\n"

showRow :: Row -> [Int]
showRow [p1,p2,p3] = append (showPiece p1) (124 : append (showPiece p2) (124 : showPiece p3))

showPiece :: Piece -> [Int]
showPiece X     = [88]
showPiece O     = [79]
showPiece Empty = [32]

placePiece :: Piece -> Board -> (Int,Int) -> [Board]
placePiece p board pos =
  if not (empty pos board) then []
  else case board of
    [r1,r2,r3] -> case pos of
      (1,x) -> [[insert p r1 x,r2,r3]]
      (2,x) -> [[r1,insert p r2 x,r3]]
      (3,x) -> [[r1,r2,insert p r3 x]]

insert :: Piece -> Row -> Int -> Row
insert p [p1,p2,p3] 1 = [p,p2,p3]
insert p [p1,p2,p3] 2 = [p1,p,p3]
insert p [p1,p2,p3] 3 = [p1,p2,p]

empty :: (Int,Int) -> Board -> Bool
empty (1,x) [r1,r2,r3] = empty' x r1
empty (2,x) [r1,r2,r3] = empty' x r2
empty (3,x) [r1,r2,r3] = empty' x r3

empty' :: Int -> Row -> Bool
empty' 1 [Empty,_,_] = True
empty' 2 [_,Empty,_] = True
empty' 3 [_,_,Empty] = True
empty' _ _ = False

fullBoard :: Board -> Bool
fullBoard b = all notEmpty (concat b)
        where
        notEmpty x = not (eqPiece x Empty)

newPositions :: Piece -> Board -> [Board]
newPositions piece board = concat (map (placePiece piece board)
                                        [(x,y) | x <- [1,2,3], y <- [1,2,3]])

initialBoard :: Board
initialBoard = [[Empty,Empty,Empty],
                [Empty,Empty,Empty],
                [Empty,Empty,Empty]]

data Evaluation = XWin | OWin | Score Int

eqEval :: Evaluation -> Evaluation -> Bool
eqEval XWin XWin           = True
eqEval OWin OWin           = True
eqEval (Score a) (Score b) = a == b
eqEval _ _                 = False

eval :: Int -> Evaluation
eval 3 = XWin
eval x = if x == 0-3 then OWin else Score x

static :: Board -> Evaluation
static board = interpret 0 (map (score board) wins)

interpret :: Int -> [Evaluation] -> Evaluation
interpret x [] = Score x
interpret x (Score y:l) = interpret (x+y) l
interpret x (XWin:l) = XWin
interpret x (OWin:l) = OWin

score :: Board -> Win -> Evaluation
score board win = eval (sum (map sum (map2 (map2 scorePiece) board win)))

scorePiece :: Piece -> Int -> Int
scorePiece X sc    = sc
scorePiece Empty _ = 0
scorePiece O sc    = 0-sc

map2 :: (a -> b -> c) -> [a] -> [b] -> [c]
map2 f [] x = []
map2 f x [] = []
map2 f (x:xs) (y:ys) = f x y : map2 f xs ys

-- Game.hs
type Player = Evaluation -> Evaluation -> Evaluation
type Move = (Board,Evaluation)

alternate :: Piece -> Player -> Player -> Board -> [Move]
alternate player f g board =
  if fullBoard board then []
  else if eqEval (static board) XWin then []
  else if eqEval (static board) OWin then []
  else move : alternate opposition g f board'
        where
        move = best f possibles scores
        (board',ev') = move
        scores = map (bestMove opposition g f) possibles
        possibles = newPositions player board
        opposition = opposite player

opposite :: Piece -> Piece
opposite X = O
opposite O = X

best :: Player -> [Board] -> [Evaluation] -> Move
best f (b:bs) (s:ss) = best' b s bs ss
        where
        best' b' s' [] [] = (b',s')
        best' b' s' (b'':bs') (s'':ss') =
          if eqEval s' (f s' s'') then best' b' s' bs' ss'
          else best' b'' s'' bs' ss'

showMove :: Move -> [Int]
showMove (b,e) = append (showEval e) (10 : showBoard b)

bestMove :: Piece -> Player -> Player -> Board -> Evaluation
bestMove p f g = (mise f g) . cropTree . mapTree static . searchTree p

cropTree :: Tree Evaluation -> Tree Evaluation
cropTree (Branch a []) = Branch a []
cropTree (Branch (Score x) l) = Branch (Score x) (map cropTree l)
cropTree (Branch x l) = Branch x []

searchTree :: Piece -> Board -> Tree Board
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastDepth, simDepth :: Int
fastDepth = 5
simDepth = 2

searchTree p board = prune simDepth (repTree (newPositions p) (newPositions (opposite p)) board)

mise :: Player -> Player -> Tree Evaluation -> Evaluation
mise f g (Branch a []) = a
mise f g (Branch _ l) = foldr f (g OWin XWin) (map (mise g f) l)

max' :: Evaluation -> Evaluation -> Evaluation
max' XWin _ = XWin
max' _ XWin = XWin
max' b OWin = b
max' OWin b = b
max' a b = case a of
  Score x -> case b of
    Score y -> if x > y then a else b

min' :: Evaluation -> Evaluation -> Evaluation
min' OWin _ = OWin
min' _ OWin = OWin
min' b XWin = b
min' XWin b = b
min' a b = case a of
  Score x -> case b of
    Score y -> if x < y then a else b

-- derived Show Evaluation, byte-exact (negative Score argument bracketed)
showI :: Int -> [Int]
showI n = if n < 0 then 45 : showP (0-n) else showP n
  where showP k = if k < 10 then [48+k] else append (showP (div k 10)) [48 + mod k 10]

showEval :: Evaluation -> [Int]
showEval XWin = [88,87,105,110]                -- "XWin"
showEval OWin = [79,87,105,110]                -- "OWin"
showEval (Score n) =
  if n < 0 then append [83,99,111,114,101,32,40] (append (showI n) [41])  -- "Score (-n)"
  else append [83,99,111,114,101,32] (showI n)                            -- "Score n"

-- Prog.hs
prog :: [Int]
prog = append [79,88,79,10]                    -- "OXO\n"
       (concat (map showMove game))
        where
        game = alternate X max' min' testBoard

testBoard :: Board
testBoard = [[Empty,O,Empty],[Empty,X,Empty],[Empty,Empty,Empty]]

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS prog

main :: Int
main = bench
