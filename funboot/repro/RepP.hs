module RepP where
import Prelude()
import NanoPrelude
import ClausifyN

szF :: Formula -> Int
szF (Sym c)   = 1
szF (Not p)   = 1 + szF p
szF (Dis p q) = 1 + szF p + szF q
szF (Con p q) = 1 + szF p + szF q
szF (Imp p q) = 1 + szF p + szF q
szF (Eqv p q) = 1 + szF p + szF q

main :: Int
main = szF (parse formula)
