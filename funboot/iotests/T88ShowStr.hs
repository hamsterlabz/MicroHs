-- EXPECT: "abc"
-- EXPECT: "abc"
-- EXPECT: '+'
-- EXPECT: ["abc","lit"]
-- EXPECT: ok
module T88ShowStr(main) where
import Prelude
main :: IO ()
main = do
  let src = "x = \"abc\" rest" :: String
      s = takeWhile (/= toEnum 34) (drop 5 src)
  putStrLn (show ("abc" :: String))
  putStrLn (show s)
  putStrLn (show (toEnum 43 :: Char))
  putStrLn (show ([s, "lit"] :: [String]))
  putStrLn "ok"
