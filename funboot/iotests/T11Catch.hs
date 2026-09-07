-- EXPECT: caught
module T11Catch(main) where
import Prelude
import Control.Exception
main :: IO ()
main = catch (error "boom") (\ e -> putStrLn ("caught" ++ seq (e :: SomeException) ""))
