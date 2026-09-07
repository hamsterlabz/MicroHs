module Rep5 where
import Prelude()
import NanoPrelude

data F = A Int | B

-- an irrefutable pattern binding that destructures a list, as ClausifyN's
-- `parse t = f where [Ast f] = parse' t []` does
sel :: [F] -> Int
sel t = n where [A n] = t

main :: Int
main = sel (A 7 : [])
