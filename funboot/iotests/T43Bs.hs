-- EXPECT: 5 True LT
module T43Bs(main) where
import Prelude
import Data.Word
import qualified Data.ByteString as B
main :: IO ()
main = do
  let a = B.pack [104,101]
      b = B.pack [108,108,111]
      c = B.append a b
  putStrLn (show (B.length c) ++ " " ++ show (c == B.pack [104,101,108,108,111])
            ++ " " ++ show (compare a b))
