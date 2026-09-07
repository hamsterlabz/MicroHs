-- EXPECT: abc
module T19Ident(main) where
import Prelude(); import MHSPrelude
import MicroHs.Ident
main :: IO ()
main = putStrLn (showIdent (mkIdent "abc"))
