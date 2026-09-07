module Put(main) where
import Prelude
import System.IO
main :: IO ()
main = hPutChar stdout (toEnum 65)
