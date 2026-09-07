module RepB where
import Prelude()
import NanoPrelude
import ClausifyN

lenS :: [StackFrame] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs

-- clause 4, the close-paren path with its irrefutable pattern
main :: Int
main = lenS (parse' (41 : []) (Ast (Sym 97) : Lex 40 : []))
