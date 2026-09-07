module Rep7 where
import Prelude()
import NanoPrelude
import ClausifyN

lenS :: [StackFrame] -> Int
lenS []     = 0
lenS (_:xs) = 1 + lenS xs

-- the guard alone: spri of a reducible stack
main :: Int
main = spri (Ast (Sym 97) : Lex 61 : Ast (Sym 97) : [])
