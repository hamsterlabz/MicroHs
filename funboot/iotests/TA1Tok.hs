-- EXPECT: [z][=][""]/z=""
module TA1Tok(main) where
import Prelude
import qualified MicroHs.Lex as L
import MicroHs.Ident(SLoc(..))
main :: IO ()
main = do
  let ts = L.lex (SLoc "T" 1 1) "z = \"\"\n"
      xs = map L.showToken ts
  putStrLn (concatMap (\ t -> "[" ++ t ++ "]") (take 3 xs)
            ++ "/" ++ concat (take 3 xs))
