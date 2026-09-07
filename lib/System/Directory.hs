module System.Directory(
  removeFile,
  doesFileExist,
  findExecutable,
  doesDirectoryExist,
  getDirectoryContents,
  listDirectory,
  setCurrentDirectory,
  getCurrentDirectory,
  withCurrentDirectory,
  createDirectory,
  createDirectoryIfMissing,
  copyFile,
  getHomeDirectory,
  makeAbsolute,
  ) where
import Prelude(); import MiniPrelude
import Control.Exception(bracket)
import Control.Monad(when)
import Data.List(intercalate)
import Foreign.C.String
import Foreign.Marshal.Alloc
import Foreign.Ptr
import System.IO
import System.Environment

data DIR
data Dirent

foreign import ccall "unlink"   c_unlink   :: CString -> IO Int
foreign import ccall "opendir"  c_opendir  :: CString -> IO (Ptr DIR)
foreign import ccall "closedir" c_closedir :: Ptr DIR -> IO Int
foreign import ccall "readdir"  c_readdir  :: Ptr DIR -> IO (Ptr Dirent)
foreign import ccall "c_d_name" c_d_name   :: Ptr Dirent -> IO CString
foreign import ccall "chdir"    c_chdir    :: CString -> IO Int
foreign import ccall "mkdir"    c_mkdir    :: CString -> Int -> IO Int
foreign import ccall "getcwd"   c_getcwd   :: CString -> Int -> IO CString

removeFile :: FilePath -> IO ()
removeFile fn = do
  r <- withCAString fn c_unlink
  when (r /= 0) $
    error "removeFile failed"

doesFileExist :: FilePath -> IO Bool
doesFileExist fn = do
  mh <- openFileM fn ReadMode
  case mh of
    Nothing -> return False
    Just h  -> do { hClose h; return True }

doesDirectoryExist :: FilePath -> IO Bool
doesDirectoryExist fn = withCAString fn $ \ cfn -> do
  dp <- c_opendir cfn
  return False
  if dp == nullPtr then
    return False
   else do
    c_closedir dp
    return True

getDirectoryContents :: FilePath -> IO [String]
getDirectoryContents fn = withCAString fn $ \ cfn -> do
  dp <- c_opendir cfn
  when (dp == nullPtr) $
    error $ "getDirectoryContents: cannot open " ++ fn
  let loop r = do
        de <- c_readdir dp
        if de == nullPtr then do
          c_closedir dp
          return $ reverse r
         else do
          sp <- c_d_name de
          s <- peekCAString sp
          loop (s:r)
  loop []

listDirectory :: FilePath -> IO [String]
listDirectory d = filter (\ n -> n /= "." && n /= "..") <$> getDirectoryContents d

setCurrentDirectory :: FilePath -> IO ()
setCurrentDirectory d = do
  r <- withCAString d c_chdir
  when (r /= 0) $
    error $ "setCurrentDirectory failed: " ++ d

getCurrentDirectory :: IO FilePath
getCurrentDirectory = do
  let len = 10000
  allocaBytes len $ \ p -> do
    cwd <- c_getcwd p len -- can return NULL if buffer to small
    when (cwd == nullPtr) $
      error "getCurrentDirectory"
    peekCAString cwd

withCurrentDirectory :: FilePath -> IO a -> IO a
withCurrentDirectory dir io =
  bracket getCurrentDirectory setCurrentDirectory $ \ _ -> do
    setCurrentDirectory dir
    io

createDirectory :: FilePath -> IO ()
createDirectory d = do
  r <- withCAString d $ \ s -> c_mkdir s 0o775       -- rwxrwxr-x
  when (r /= 0) $
    error $ "Cannot create directory " ++ show d

createDirectoryIfMissing :: Bool -> FilePath -> IO ()
createDirectoryIfMissing False d = do
  _ <- withCAString d $ \ s -> c_mkdir s 0o775       -- rwxrwxr-x
  return ()
createDirectoryIfMissing True d = do
  let ds = scanl1 (\ x y -> x ++ "/" ++ y) . split [] $ d
      split r [] = [r]
      split r ('/':cs) = r : split [] cs
      split r (c:cs) = split (r ++ [c]) cs
  mapM_ (createDirectoryIfMissing False) ds

-- XXX does not copy flags
copyFile :: FilePath -> FilePath -> IO ()
copyFile src dst = do
  hsrc <- openBinaryFile src ReadMode
  hdst <- openBinaryFile dst WriteMode
  file <- hGetContents hsrc  -- this also closes the file
  hPutStr hdst file
  hClose hdst

getHomeDirectory :: IO FilePath
getHomeDirectory =
  if _isWindows then do
    user <- getEnv "USERNAME"
    return $ "C:/Users/" ++ user    -- it's a guess
  else
    getEnv "HOME"

-- findExecutable: the driver uses this only to locate an assembler. mhs never
-- had it (GHC supplied System.Directory when gmhs was GHC-built), so the
-- self-compiled compiler could not typecheck its own Main. PATH search, with
-- Nothing when the name is not found -- which is the right answer on a target
-- that has no assembler to find.
findExecutable :: FilePath -> IO (Maybe FilePath)
findExecutable n = do
  mp <- lookupEnv "PATH"
  case mp of
    Nothing -> return Nothing
    Just path -> go (splitOn (:[]) ':' path)
  where
    go [] = return Nothing
    go (d:ds) = do
      let f = d ++ "/" ++ n
      ok <- doesFileExist f
      if ok then return (Just f) else go ds
    splitOn _ c str = case break (== c) str of
      (a, [])     -> [a]
      (a, _:rest) -> a : splitOn (:[]) c rest

-- makeAbsolute: prefix the cwd when the path is relative, then fold away the
-- "." and ".." segments so the result is what the driver compares against.
makeAbsolute :: FilePath -> IO FilePath
makeAbsolute p =
  case p of
    '/':_ -> return (normalise p)
    _     -> do
      cwd <- getCurrentDirectory
      return (normalise (cwd ++ "/" ++ p))

normalise :: FilePath -> FilePath
normalise p = "/" ++ intercalate "/" (reverse (foldl step [] (segs p)))
  where
    step acc "."  = acc
    step acc ".." = case acc of { [] -> []; (_:t) -> t }
    step acc s    = s : acc
    segs s = case break (== '/') s of
      (a, [])     -> [a | not (null a)]
      (a, _:rest) -> [a | not (null a)] ++ segs rest
