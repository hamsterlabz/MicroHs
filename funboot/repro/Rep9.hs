module Rep9 where
import Prelude()
import NanoPrelude
import ClausifyN

lenS :: [StackFrame] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs

-- the while loop
main :: Int
main = lenS (redstar (Ast (Sym 97) : Lex 61 : Ast (Sym 97) : []))
