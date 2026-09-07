module V1(main) where
import Prelude()
import Primitives
main :: IO ()
main = primUnsafeCoerce (\ k -> k ())
