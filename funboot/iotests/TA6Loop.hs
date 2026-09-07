-- EXPECT: 0/2
module TA6Loop(main) where
import Prelude
isDQ :: String -> Maybe Int
isDQ s = case s of
           (c : _) | c == toEnum 34 -> Just 1
           _ -> Nothing
dec :: String -> String
dec [] = []
dec (c : cs) = c : dec cs
lexStr :: String -> (String, String)
lexStr acs = loop [] acs
  where loop rs cs | Just k <- isDQ cs = (dec (id (reverse rs)), drop k cs)
        loop rs (c : cs) = loop (c : rs) cs
        loop rs [] = (dec (reverse rs), [])
main :: IO ()
main = do
  let (a, _) = lexStr "\"rest"
      (b, _) = lexStr "ab\"rest"
  putStrLn (show (length a) ++ "/" ++ show (length b))
