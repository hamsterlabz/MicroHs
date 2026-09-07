module Rep3 where
import Prelude()
import NanoPrelude
import ClausifyN(formula, clauses)

main :: Int
main = length (clauses formula)
