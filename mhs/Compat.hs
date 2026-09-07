-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
module Compat(rnfNoErr, rnfErr, NFData, appendDot) where
import Prelude()              -- do not import Prelude
import Primitives
import Data.Text
-- So we can import Compat, which is full of stuff for GHC.

-- Define these here to avoid dragging in Control.DeepSeq
rnfNoErr :: forall a . a -> ()
rnfNoErr = primRnfNoErr

rnfErr :: forall a . a -> ()
rnfErr = primRnfErr

class NFData a

-- The C runtime has a fused "append with a dot" primitive; the fun backend has
-- no C runtime, so use the portable definition (kept here in a comment all along).
appendDot :: Text -> Text -> Text
appendDot x y = x `append` pack "." `append` y

