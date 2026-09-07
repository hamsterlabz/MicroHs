-- PuzzleBits.hs - Puzzle's search with an O(1) visited set.
-- Puzzle.hs - nofib spectral/puzzle (U2 bridge crossing), verbatim port to
-- the NanoPrelude dialect. Glue only: records become plain constructor +
-- accessors, derived Eq becomes eqState/eqBank, [Bono .. Adam] enumerations
-- become explicit lists, ShowSL strings are [Int] character lists built to
-- the exact original bytes, and the final foldr seq forcing becomes length
-- of the same rendered string.
module PuzzleBits where
import Prelude()
import NanoPrelude
import GExtra ((.&.), (.|.), shiftL)

data ItemType = Bono | Edge | Larry | Adam
data BankType = LeftBank | RightBank

data StateType = State BankType BankType BankType BankType

type History = [(Int, StateType)]
type Solutions = [History]
type ShowSL = [Int] -> [Int]

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

bonoPos, edgePos, larryPos, adamPos :: StateType -> BankType
bonoPos  (State b _ _ _) = b
edgePos  (State _ e _ _) = e
larryPos (State _ _ l _) = l
adamPos  (State _ _ _ a) = a

initialState, finalState :: StateType
initialState = State LeftBank LeftBank LeftBank LeftBank
finalState = State RightBank RightBank RightBank RightBank

eqBank :: BankType -> BankType -> Bool
eqBank LeftBank  LeftBank  = True
eqBank RightBank RightBank = True
eqBank _         _         = False

eqState :: StateType -> StateType -> Bool
eqState (State a b c d) (State e f g h) =
  eqBank a e && eqBank b f && eqBank c g && eqBank d h

position :: ItemType -> StateType -> BankType
position Bono  = bonoPos
position Edge  = edgePos
position Larry = larryPos
position Adam  = adamPos

updateState :: StateType -> ItemType -> BankType -> StateType
updateState (State b e l a) Bono  pos = State pos e l a
updateState (State b e l a) Edge  pos = State b pos l a
updateState (State b e l a) Larry pos = State b e pos a
updateState (State b e l a) Adam  pos = State b e l pos

opposite :: BankType -> BankType
opposite LeftBank = RightBank
opposite RightBank = LeftBank

-- The coalgebra carries the visited set.
--
-- notSeen scanned the whole path, calling eqState (four eqBank comparisons) per
-- step, for every candidate at every node -- and the search is 99.97% of this
-- benchmark.  But StateType is four banks of two values: the ENTIRE state space
-- is 16 values, so a path's visited set is a 16-bit mask and the test is one
-- AND.  Threading it down the path is exactly equivalent to rescanning the
-- path, since the path is precisely what notSeen looked at.
bankBit :: BankType -> Int
bankBit LeftBank  = 0
bankBit RightBank = 1

stateIx :: StateType -> Int
stateIx (State b e l a) =
  bankBit b + 2 * bankBit e + 4 * bankBit l + 8 * bankBit a

notSeenB :: StateType -> Int -> Bool
notSeenB st seen = (seen .&. shiftL 1 (stateIx st)) == 0

notSeen :: StateType -> History -> Bool
notSeen state = all (\(_, s) -> not (eqState state s))

-- string glue: exact bytes of the original literals
sp :: Int -> [Int]
sp k = replicate k 32

itemName :: ItemType -> [Int]
itemName Bono  = [66,111,110,111]                -- "Bono"
itemName Edge  = [84,104,101,32,69,100,103,101]  -- "The Edge"
itemName Larry = [76,97,114,114,121]             -- "Larry"
itemName Adam  = [65,100,97,109]                 -- "Adam"

showStr :: [Int] -> ShowSL
showStr = append

showCh :: Int -> ShowSL
showCh c = \s -> c : s

showN :: Int -> [Int]
showN k = if k < 10 then [48+k] else append (showN (div k 10)) [48 + mod k 10]

showsI :: Int -> ShowSL
showsI k = append (showN k)

writeItem :: ItemType -> BankType -> ShowSL
writeItem item LeftBank
  = showStr (append (sp (8 - length nm))
      (append nm (append [32,124] (append (sp 20) [124,10]))))
  where nm = itemName item
writeItem item RightBank
  = showStr (append (sp 9)
      (append [124] (append (sp 20) (append [124,32] (append nm [10])))))
  where nm = itemName item

dashesLine :: [Int]
dashesLine = append (replicate 40 45) [10]

writeState :: StateType -> ShowSL
writeState state
  = showStr dashesLine
  . writeItem Bono (bonoPos state)
  . writeItem Edge (edgePos state)
  . writeItem Larry (larryPos state)
  . writeItem Adam (adamPos state)
  . showStr dashesLine

totalTime :: History -> Int
totalTime ((time, _) : _) = time

writeHistory :: History -> ShowSL
writeHistory [] = id
writeHistory history
  = foldr
    (\(time, state) acc ->
       showStr [84,105,109,101,58,32]   -- "Time: "
     . showsI (total - time)
     . showCh 10
     . writeState state . acc) id history
     where
       total = totalTime history

minSolutions :: Solutions -> Solutions
minSolutions [] = []
minSolutions (history : next)
  = revL (minAcc (totalTime history) [history] next)
      where
        minAcc minSoFar mins [] = mins
        minAcc minSoFar mins (h : rest)
          = if minSoFar < total then minAcc minSoFar mins rest
            else if minSoFar == total then minAcc minSoFar (h : mins) rest
            else minAcc total [h] rest
            where
              total = totalTime h

writeSolutions :: Solutions -> Int -> ShowSL
writeSolutions [] _ = id
writeSolutions (item : next) count
  = showStr [83,111,108,117,116,105,111,110,32]   -- "Solution "
  . showsI count . showCh 10
  . writeHistory item
  . writeSolutions next (count + 1)

u2times :: ItemType -> Int
u2times Bono = 10
u2times Edge = 5
u2times Larry = 2
u2times Adam = 1

items :: [ItemType]
items = [Bono, Edge, Larry, Adam]

succAdam :: ItemType -> [ItemType]
succAdam Bono  = [Edge, Larry, Adam]
succAdam Edge  = [Larry, Adam]
succAdam Larry = [Adam]
succAdam Adam  = []

transfer :: StateType -> StateType -> BankType -> Int -> History -> Int -> Solutions
transfer source dest location countdown history seen =
  if eqState source dest
    then [(countdown, dest) : history]
    else append moveOne moveTwo
  where
    newHistory = (countdown, dest) : history
    newLocation = opposite location
    newSeen = seen .|. shiftL 1 (stateIx dest)

    moveOne = concat
              [transfer
                 source newDest
                 newLocation newTime newHistory newSeen

              | item <- items,
                eqBank (position item dest) location,
                let newDest = updateState dest item newLocation,
                notSeenB newDest seen,
                let newTime = countdown + u2times item]

    moveTwo = concat
              [transfer
                 source newDest
                 newLocation newTime newHistory newSeen

              | i <- [Bono, Edge, Larry],
                j <- succAdam i,
                eqBank (position i dest) location &&
                eqBank (position j dest) location,
                let
                  newDest
                    = updateState
                        (updateState dest i newLocation)
                        j newLocation,
                notSeenB newDest seen,
                let newTime = countdown + u2times i]

bench :: Int
bench = length (writeSolutions mins 1 [])
  where
    solutions = transfer initialState finalState RightBank 0 [] 0
    mins = minSolutions solutions

main :: Int
main = bench

revL :: [a] -> [a]
revL = foldl (\acc x -> x : acc) []
