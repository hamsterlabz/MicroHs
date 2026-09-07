-- EXPECT: aaa bbb ccc
-- EXPECT: aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa tail
-- EXPECT: l1
-- EXPECT:   x y
-- EXPECT: done
module T89Sep(main) where
import Prelude
import Text.PrettyPrint.HughesPJLite
main :: IO ()
main = do
  putStrLn (render (sep [text "aaa", text "bbb", text "ccc"]))
  putStrLn (render (sep [text (replicate 60 (toEnum 97)), text "tail"]))
  putStrLn (render (vcat [text "l1", nest 2 (sep [text "x", text "y"])]))
  putStrLn "done"
