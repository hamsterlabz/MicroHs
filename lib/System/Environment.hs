-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
module System.Environment(
  getArgs,
  getProgName,
  withArgs,
  lookupEnv,
  getEnv,
  ) where
import Prelude(); import MiniPrelude
import Primitives
import Data.Char(chr)
import Foreign.C.String
import Foreign.Ptr
import System.IO

-- fun backend: read the real Linux argv via the runtime's argv helpers (the
-- C-runtime getArgRef array isn't populated on fun).
prim_argc :: forall a . (Int -> a) -> a
prim_argc   = primitive "io.argc"
prim_argsel :: forall a . Int -> a -> a
prim_argsel = primitive "io.argsel"
prim_argrd  :: forall a . (Int -> a) -> a
prim_argrd  = primitive "io.argrd"

-- fun backend: pure CPS — a value effect must NOT be composed with the IO monad's
-- `>>=` in a recursion (the shared bare effect atom loops under primBind). Each
-- reader takes a continuation and applies the value effect directly.
argcK :: forall a . (Int -> IO a) -> IO a
argcK k = primUnsafeCoerce (\ c -> prim_argc (\ n -> primUnsafeCoerce (k n) c))
argSelK :: forall a . Int -> IO a -> IO a
argSelK i io = primUnsafeCoerce (\ c -> prim_argsel i (primUnsafeCoerce io c))
argRdK :: forall a . (Int -> IO a) -> IO a
argRdK k = primUnsafeCoerce (\ c -> prim_argrd (\ b -> primUnsafeCoerce (k b) c))

goK :: forall a . (String -> IO a) -> IO a
goK kont = argRdK (\ b -> if b < 0 then kont [] else goK (\ cs -> kont (chr b : cs)))
readArgK :: forall a . Int -> (String -> IO a) -> IO a
readArgK i kont = argSelK i (goK kont)

argsFromK :: forall a . Int -> Int -> ([String] -> IO a) -> IO a
argsFromK i n kont =
  if i >= n then kont []
  else readArgK i (\ a -> argsFromK (i+1) n (\ as -> kont (a : as)))

getArgs :: IO [String]
getArgs = argcK (\ n -> argsFromK 1 n primReturn)    -- skip argv[0]

getProgName :: IO String
getProgName = readArgK 0 primReturn

withArgs :: forall a . [String] -> IO a -> IO a
withArgs as ioa = do
  aa <- primGetArgRef
  old <- primArrRead aa 0
  primArrWrite aa 0 $ head old : as         -- keep program name
  a <- ioa
  primArrWrite aa 0 old
  return a

foreign import ccall "getenv" c_getenv :: CString -> IO CString

-- fun backend: no env access (getenv is C FFI). getMhsDir then uses the data dir.
lookupEnv :: String -> IO (Maybe String)
lookupEnv _ = primReturn Nothing

getEnv :: String -> IO String
getEnv var = do
  mval <- lookupEnv var
  case mval of
    Nothing  -> error $ "getEnv: not found " ++ var
    Just val -> return val
