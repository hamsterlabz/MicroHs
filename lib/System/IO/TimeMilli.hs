module System.IO.TimeMilli(getTimeMilli) where
import Prelude(); import MiniPrelude

-- fun backend: no wall-clock FFI; timing reports show 0ms (compile unaffected).
getTimeMilli :: IO Int
getTimeMilli = return 0
