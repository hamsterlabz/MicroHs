-- EXPECT: 2 ab
module T97PatGuard(main) where
import Prelude
isDQ :: String -> Maybe Int
isDQ s = case s of
           (c : _) | c == toEnum 34 -> Just 1
           _ -> Nothing
scan :: String -> (Int, String)
scan acs = loop 0 [] acs
  where loop n rs cs | Just k <- isDQ cs = (n + k, reverse rs)
        loop n rs (c : cs) = loop (n + 1) (c : rs) cs
        loop n rs [] = (n, reverse rs)
main :: IO ()
main = case scan "ab\"z" of
         (n, s) -> putStrLn (show (n - 1) ++ " " ++ s)
