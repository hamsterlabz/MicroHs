-- Copyright 2023,2024 Lennart Augustsson
-- See LICENSE file for full license.
module System.IO(
  IO, Handle, FilePath,
  IOMode(..),
  stdin, stdout, stderr,
  hGetChar, hPutChar,
  hLookAhead,
  putChar, getChar,
  hClose, hFlush,
  openFile, openFileM, openBinaryFile,
  hPutStr, hPutStrLn,
  putStr, putStrLn,
  print,
  hGetContents, getContents,
  hGetLine, getLine,
  interact,
  writeFile, readFile, appendFile,

  cprint, cuprint,

  mkTextEncoding, hSetEncoding, utf8,

  openTmpFile, openTempFile, openBinaryTempFile,

  withFile,

  BufferMode(..),
  hSetBuffering, hSetBinaryMode, hIsEOF, isEOF,

  ) where
import Prelude()              -- do not import Prelude
import Primitives
import Control.Applicative
import Control.Error
import Control.Monad
import Control.Monad.Fail
import Data.Bool
import Data.Char
import Data.Eq
import Data.Function
import Data.Functor
import Data.Int
import Data.List
import Data.Maybe
import Data.Num
import Data.Ord
import Data.String
import Data.Tuple
import Text.Show
import Foreign.C.String
import Foreign.Marshal.Alloc
import Foreign.Ptr
import System.IO.Unsafe
import System.IO.Internal
import System.IO.Error

data FILE

-- fun backend: no C runtime. A `Ptr/ForeignPtr BFILE` carries an fd; the C leaves
-- become mediated 1-arg effects (helper holds current_fd + a path buffer).
prim_setfd, prim_putbf, prim_pathc, prim_closef :: forall a . Int -> a -> a
prim_setfd  = primitive "io.setfd"
prim_putbf  = primitive "io.putbf"
prim_pathc  = primitive "io.pathc"
prim_closef = primitive "io.close"
prim_getbf  :: forall a . (Int -> a) -> a
prim_getbf  = primitive "io.getbf"
prim_openf  :: forall a . Int -> (Int -> a) -> a
prim_openf  = primitive "io.open"

p2fd :: forall p . p -> Int
p2fd = primUnsafeCoerce
fd2p :: forall p . Int -> p
fd2p = primUnsafeCoerce

primHPrint       :: forall a . Ptr BFILE -> a -> IO ()
primHPrint _ _    = primReturn ()       -- unused on fun (cprint/cuprint)
primStdin        :: ForeignPtr BFILE
primStdin         = fd2p 0
primStdout       :: ForeignPtr BFILE
primStdout        = fd2p 1
primStderr       :: ForeignPtr BFILE
primStderr        = fd2p 2

c_putb :: Int -> Ptr BFILE -> IO ()
c_putb byte p = primUnsafeCoerce (\ k -> prim_setfd (p2fd p) (prim_putbf byte (k ())))
c_getb :: Ptr BFILE -> IO Int
c_getb p = primUnsafeCoerce (\ k -> prim_setfd (p2fd p) (prim_getbf k))
c_closeb :: Ptr BFILE -> IO ()
c_closeb p = primUnsafeCoerce (\ k -> prim_closef (p2fd p) (k ()))
c_flushb :: Ptr BFILE -> IO ()
c_flushb _ = primReturn ()
c_ungetb :: Int -> Ptr BFILE -> IO ()
c_ungetb _ _ = primReturn ()
c_add_FILE :: Ptr FILE -> IO (Ptr BFILE)
c_add_FILE p = primReturn (primUnsafeCoerce p)   -- ptr is the fd; pass through
c_add_utf8 :: Ptr BFILE -> IO (Ptr BFILE)
c_add_utf8 p = primReturn p                      -- ASCII: utf8 transducer = id
ioPathc :: Int -> IO ()
ioPathc b = primUnsafeCoerce (\ k -> prim_pathc b (k ()))
ioOpenFd :: Int -> IO Int
ioOpenFd m = primUnsafeCoerce (\ k -> prim_openf m k)

----------------------------------------------------------

stdin  :: Handle
stdin  = unsafeHandle primStdin  HRead  "stdin"
stdout :: Handle
stdout = unsafeHandle primStdout HWrite "stdout"
stderr :: Handle
stderr = unsafeHandle primStderr HWrite "stderr"

--bFILE :: Ptr FILE -> Handle
--bFILE = Handle . primPerformIO . (c_add_utf8 <=< c_add_FILE)

hClose :: Handle -> IO ()
hClose h =
  -- Don't close the std handles, the runtime assume they remain open.
  if h == stdin then
    return ()
  else if h == stdout || h == stderr then
    hFlush h       -- closing would have flushed
  else
    hCloseReal h

hCloseReal :: Handle -> IO ()
hCloseReal h = do
  m <- getHandleState h
  case m of
    HClosed -> ioErrH h OtherError "hClose: Handle already closed"
    HSemiClosed -> return ()
    _ -> do
      killHandle h
      withHandleAny h c_closeb
  setHandleState h HClosed

hFlush :: Handle -> IO ()
hFlush h = withHandleWr h c_flushb

hGetChar :: Handle -> IO Char
hGetChar h = withHandleRd h $ \ p -> do
  c <- c_getb p
  if c == (-1::Int) then
    ioErrH h EOF "hGetChar"
   else
    return (chr c)

-- Standard, and the only way a reader can stop at end of file without
-- catching an error: peek one byte and put it back.
hIsEOF :: Handle -> IO Bool
hIsEOF h = withHandleRd h $ \ p -> do
  c <- c_getb p
  if c == (-1::Int) then
    return True
   else do
    c_ungetb c p
    return False

isEOF :: IO Bool
isEOF = hIsEOF stdin

hLookAhead :: Handle -> IO Char
hLookAhead h = withHandleRd h $ \ p -> do
  c <- hGetChar h
  c_ungetb (ord c) p
  return c

hPutChar :: Handle -> Char -> IO ()
hPutChar h c = withHandleWr h $ c_putb (ord c)

openFILEM :: FilePath -> IOMode -> IO (Maybe (Ptr FILE))
openFILEM p m = do
  -- fun backend: stream the path bytes to the helper buffer, then open.
  let mn = case m of
             ReadMode -> 0
             WriteMode -> 1
             AppendMode -> 2
             ReadWriteMode -> 3
  mapM_ (\ c -> ioPathc (ord c)) p
  fd <- ioOpenFd mn
  if fd < 0 then
    return Nothing
   else
    return (Just (fd2p fd))

openFileM :: FilePath -> IOMode -> IO (Maybe Handle)
openFileM fn m = do
  mf <- openFILEM fn m
  case mf of
    Nothing -> return Nothing
    Just p -> do { q <- c_add_utf8 =<< c_add_FILE p; Just <$> mkHandle fn q (ioModeToHMode m) }

openFile :: String -> IOMode -> IO Handle
openFile p m = do
  mh <- openFileM p m
  case mh of
    Nothing -> ioErr NoSuchThing "openFile" p
    Just h -> return h

putChar :: Char -> IO ()
putChar = hPutChar stdout

getChar :: IO Char
getChar = hGetChar stdin

cprint :: forall a . a -> IO ()
cprint a = withHandleWr stdout $ \ p -> primRnfNoErr a `seq` primHPrint p a

cuprint :: forall a . a -> IO ()
cuprint a = withHandleWr stdout $ \ p -> primHPrint p a

print :: forall a . (Show a) => a -> IO ()
print a = putStrLn (show a)

putStr :: String -> IO ()
putStr = hPutStr stdout

hPutStr :: Handle -> String -> IO ()
hPutStr h = mapM_ (hPutChar h)

putStrLn :: String -> IO ()
putStrLn = hPutStrLn stdout

hPutStrLn :: Handle -> String -> IO ()
hPutStrLn h s = hPutStr h s >> hPutChar h '\n'

hGetLine :: Handle -> IO String
hGetLine h = loop ""
  where loop s = do
          c <- hGetChar h
          if c == '\n' then
            return (reverse s)
           else
            loop (c:s)

getLine :: IO String
getLine = hGetLine stdin

writeFile :: FilePath -> String -> IO ()
writeFile p s = do
  h <- openFile p WriteMode
  hPutStr h s
  hClose h

appendFile :: FilePath -> String -> IO ()
appendFile p s = do
  h <- openFile p AppendMode
  hPutStr h s
  hClose h

{-
-- Faster, but uses a lot more C memory.
writeFileFast :: FilePath -> String -> IO ()
writeFileFast p s = do
  h <- openFile p WriteMode
  (cs, l) <- newCAStringLen s
  n <- c_fwrite cs 1 l h
  free cs
  hClose h
  when (l /= n) $
    error "writeFileFast failed"
-}

-- Lazy readFile
readFile :: FilePath -> IO String
readFile p = do
  h <- openFile p ReadMode
  cs <- hGetContents h
  --hClose h  can't close with lazy hGetContents
  return cs

-- fun backend: eager CPS read (a value effect must not be composed with the IO
-- monad's >>= in a recursion). Reads the whole handle into a String.
cgetbK :: forall a . Ptr BFILE -> (Int -> IO a) -> IO a
cgetbK p k = primUnsafeCoerce (\ co -> prim_setfd (p2fd p) (prim_getbf (\ b -> primUnsafeCoerce (k b) co)))

contentsK :: forall a . Ptr BFILE -> (String -> IO a) -> IO a
contentsK p kont = cgetbK p (\ c -> if c < 0 then kont [] else contentsK p (\ cs -> kont (chr c : cs)))

hGetContents :: Handle -> IO String
hGetContents h = withHandleRd h (\ p -> contentsK p primReturn)
  
getContents :: IO String
getContents = hGetContents stdin

interact :: (String -> String) -> IO ()
interact f = getContents >>= putStr . f

openBinaryFile :: String -> IOMode -> IO Handle
openBinaryFile fn m = do
  mf <- openFILEM fn m
  case mf of
    Nothing -> ioErr NoSuchThing "openBinaryFile" fn
    Just p -> do { q <- c_add_FILE p; mkHandle fn q (ioModeToHMode m) }

--------

ioErrH :: Handle -> IOErrorType -> String -> IO a
ioErrH h typ desc   = ioError $ IOError (Just h) typ "" desc Nothing Nothing

ioErr :: IOErrorType -> String -> String -> IO a
ioErr typ desc name = ioError $ IOError Nothing  typ "" "" Nothing (Just $ name ++ ": " ++ desc)

--------
-- For compatibility

data TextEncoding = UTF8

utf8 :: TextEncoding
utf8 = UTF8

mkTextEncoding :: String -> IO TextEncoding
mkTextEncoding "UTF-8//ROUNDTRIP" = return UTF8
mkTextEncoding _ = error "unknown text encoding"

-- Always in UTF8 mode
hSetEncoding :: Handle -> TextEncoding -> IO ()
hSetEncoding _ _ = return ()

--------

-- XXX needs bracket
withFile :: forall r . FilePath -> IOMode -> (Handle -> IO r) -> IO r
withFile fn md io = do
  h <- openFile fn md
  r <- io h
  hClose h
  return r

--------

splitTmp :: String -> (String, String)
splitTmp tmpl = 
  case span (/= '.') (reverse tmpl) of
    (rsuf, "") -> (tmpl, "")
    (rsuf, _:rpre) -> (reverse rpre, '.':reverse rsuf)

-- Create a temporary file, take a prefix and a suffix
-- and returns a malloc()ed string.
foreign import ccall "tmpname" c_tmpname :: CString -> CString -> IO CString

-- Create and open a temporary file.
openTmpFile :: String -> IO (String, Handle)
openTmpFile tmpl = do
  let (pre, suf) = splitTmp tmpl
  ctmp <- withCAString pre $ withCAString suf . c_tmpname
  tmp <- peekCAString ctmp
  free ctmp
  h <- openFile tmp ReadWriteMode
  return (tmp, h)

-- Sloppy implementation of openTempFile
openTempFile' :: (FilePath -> IOMode -> IO Handle) -> FilePath -> String -> IO (String, Handle)
openTempFile' open tmp tmplt = do
  let (pre, suf) = splitTmp tmplt
      loop n = do
        let fn = tmp ++ "/" ++ pre ++ show n ++ suf
        mh <- openFileM fn ReadMode
        case mh of
          Just h -> do
            hClose h
            loop (n+1 :: Int)
          Nothing -> do
            h <- open fn ReadWriteMode
            return (fn, h)
  loop 0

openTempFile :: FilePath -> String -> IO (String, Handle)
openTempFile = openTempFile' openFile

openBinaryTempFile :: FilePath -> String -> IO (String, Handle)
openBinaryTempFile = openTempFile' openBinaryFile

data BufferMode = NoBuffering | LineBuffering | BlockBuffering (Maybe Int)
  deriving (Eq, Ord, Show)

-- This currently does nothing.
hSetBuffering :: Handle -> BufferMode -> IO ()
hSetBuffering _ _ = return ()

-- Handles here are byte streams: there is no text mode to switch out of.
hSetBinaryMode :: Handle -> Bool -> IO ()
hSetBinaryMode _ _ = return ()
