-- fun backend stub: the real MD5 is C FFI (md5Array/md5BFILE/md5String), which
-- the fun target has no runtime for. The checksum is only used for the
-- compilation cache; a single-shot fun compile doesn't reuse a cache, so a
-- trivial (length-based) checksum suffices and removes all FFI from this module.
module System.IO.MD5(MD5CheckSum, md5File, md5Handle, md5String, md5Combine) where
import Prelude(); import MiniPrelude
import System.IO

newtype MD5CheckSum = MD5 [Int]

instance Eq MD5CheckSum where
  MD5 a == MD5 b  =  a == b

instance Ord MD5CheckSum where
  MD5 a <= MD5 b  =  a <= b

instance Show MD5CheckSum where
  show (MD5 ws) = "MD5" ++ show ws

md5String :: String -> MD5CheckSum
md5String s = MD5 [length s]

md5Handle :: Handle -> IO MD5CheckSum
md5Handle _ = return (MD5 [0])

md5File :: FilePath -> IO (Maybe MD5CheckSum)
md5File _ = return (Just (MD5 [0]))

md5Combine :: [MD5CheckSum] -> MD5CheckSum
md5Combine ms = MD5 [length ms]
