-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
module Control.Error(error, errorWithoutStackTrace, undefined, ErrorCall(..)) where
import Prelude()              -- do not import Prelude
import Primitives
import Data.Char_Type
import Data.List_Type
import Control.Exception.Internal
import {-# SOURCE #-} Data.Typeable
import Text.Show

newtype ErrorCall = ErrorCall String
  deriving (Typeable)

instance Show ErrorCall where
  show (ErrorCall s) = ("error: "::String) ++ s

instance Exception ErrorCall

-- The fun backend has no exception machinery: `raise` halts the machine.  An
-- uncaught error must still SAY what it was, so print the message on stderr with
-- the same byte effects System.IO uses, and then halt.  The effects are applied
-- to their continuation directly (a bare effect atom shared as a value re-walks
-- under primBind -- see System.Environment's argcK).
prim_setfd :: forall a . Int -> a -> a
prim_setfd = primitive "io.setfd"
prim_putbf :: forall a . Int -> a -> a
prim_putbf = primitive "io.putbf"

putErrK :: forall a . [Char] -> a -> a
putErrK s k = prim_setfd 2 (go s)
  where go [] = k
        go (c : cs) = prim_putbf (primOrd c) (go cs)

error :: forall a . String -> a
error s = putErrK ("error: "::String) (putErrK s (putErrK ("\n"::String) (throw (ErrorCall s))))

undefined :: forall a . a
undefined = error "undefined"

-- GHC compatibility
errorWithoutStackTrace :: forall a . String -> a
errorWithoutStackTrace s = throw (ErrorCall s)