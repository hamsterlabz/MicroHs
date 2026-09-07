module RepA where
import Prelude()
import NanoPrelude
import ClausifyN

lenS :: [StackFrame] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs

-- clause 5, the push path: no reduction, just shift
main :: Int
main = lenS (parse' (61 : []) (Ast (Sym 97) : Lex 40 : []))
