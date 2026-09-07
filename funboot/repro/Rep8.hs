module Rep8 where
import Prelude()
import NanoPrelude
import ClausifyN

lenS :: [StackFrame] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs

-- one reduction step
main :: Int
main = lenS (red (Ast (Sym 97) : Lex 61 : Ast (Sym 97) : []))
