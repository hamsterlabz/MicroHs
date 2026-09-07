module Rep2 where
import Prelude()
import NanoPrelude
import ClausifyN(formula, clauses, res, hashS)

-- bisect: does the structure build, does one clause set build, does res build
main :: Int
main = length formula
