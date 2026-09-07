-- sum (map f xs) : exactly  cata algS (cata algM xs)  after the library's
-- morphism primitives, so the fold/fold law has its shape.
module FuseTest where

import Prelude()
import NanoPrelude

main :: Int
main = sum (map (\ x -> x + 1) (enumFromTo 0 199))
