-- EXPECT: 0/2
module TC6Let(main) where
import Prelude
data Tok = TStr String | TOther Int
type Loc = Int
addCol :: Loc -> Int -> Loc
addCol l k = l + k
incrLine :: Loc -> Loc
incrLine l = l + 100
tabCol :: Loc -> Loc
tabCol l = l + 8
isDQuote :: String -> Maybe Int
isDQuote s = case s of
               (c : _) | c == toEnum 34 -> Just 1
               _ -> Nothing
decodeEscs :: String -> String
decodeEscs [] = []
decodeEscs (c : cs) = c : decodeEscs cs
lexRest :: Loc -> String -> [Tok]
lexRest _ [] = []
lexRest l (_ : cs) = TOther l : lexRest l cs
lexLitStr :: Loc -> Loc -> (String -> Tok) -> (String -> Maybe Int) -> (String -> String) -> String -> [Tok]
lexLitStr oloc loc mk end post acs = loop loc [] acs
  where loop l rs cs | Just k <- end cs   = mk (let q = post (reverse rs) in decodeEscs q) : lexRest (addCol l k) (drop k cs)
        loop l rs (c : cs)                = loop  (addCol l 1) (c : rs) cs
        loop _ _ []                       = [TOther oloc]
payload :: Tok -> String
payload t = case t of { TStr s -> s ; TOther _ -> "?" }
main :: IO ()
main = do
  let a = lexLitStr 1 1 TStr isDQuote id "\""
      b = lexLitStr 1 1 TStr isDQuote id "ab\""
  putStrLn (show (length (payload (head a))) ++ "/" ++ show (length (payload (head b))))
