-- EXPECT: ((((((((((((((((((((((((((((((x 1) 2) 3) 4) 5) 6) 7) 8) 9) 10) 11) 12) 13) 14) 15) 16) 17) 18) 19) 20) 21) 22) 23) 24) 25) 26) 27) 28) 29) 30)
-- EXPECT: done
module T87PrettyNest(main) where
import Prelude
import Text.PrettyPrint.HughesPJLite
deep :: Int -> Doc
deep 0 = text "x"
deep n = parens (deep (n - 1) <+> text (show n))
main :: IO ()
main = do
  putStrLn (render (deep 30))
  putStrLn "done"
