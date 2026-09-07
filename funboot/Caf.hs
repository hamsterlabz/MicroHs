module Caf(main) where
import Prelude
import Primitives
import Data.IORef
import System.IO.Unsafe
prim_putb :: forall a . Int -> a -> a
prim_putb = primitive "io.putb"
putI :: Int -> IO ()
putI c = primUnsafeCoerce (\ k -> prim_putb c (k ()))
ref :: IORef Int
ref = unsafePerformIO (newIORef 53)
main :: IO ()
main = primThen (writeIORef ref 55) (primBind (readIORef ref) (\ v -> primThen (putI v) (putI 10)))
