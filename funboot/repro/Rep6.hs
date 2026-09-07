module Rep6 where
import Prelude()
import NanoPrelude
import ClausifyN

lenS :: [StackFrame] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs

-- parse' is exported (no export list in ClausifyN), so call it directly
main :: Int
main = lenS (parse' formula [])
