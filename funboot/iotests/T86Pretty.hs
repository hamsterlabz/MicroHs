-- EXPECT: (hello world)
module T86Pretty(main) where
import Prelude
import Text.PrettyPrint.HughesPJLite
main :: IO ()
main = putStrLn (render (parens (text "hello" <+> text "world")))
