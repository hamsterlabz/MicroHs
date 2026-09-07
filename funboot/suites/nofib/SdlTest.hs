module SdlTest(main) where
import Prelude
foreign import ccall "sdl_open" sdlOpen :: Int -> IO ()
foreign import ccall "sdl_dot"  sdlDot  :: Int -> IO ()
foreign import ccall "sdl_show" sdlShow :: Int -> IO ()
main :: IO ()
main = do
  putStrLn "open"
  sdlOpen (320*65536 + 240)
  putStrLn "dots"
  let go i = if i >= (200::Int) then return ()
             else sdlDot ((i+50)*1048576 + (i+50)*1024 + 30) >> go (i+1)
  go 0
  putStrLn "show"
  sdlShow 0
  putStrLn "done"
