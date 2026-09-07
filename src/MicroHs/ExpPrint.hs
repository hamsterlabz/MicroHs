-- The combinator-file (.comb) writer is gone with the C runtime that read
-- it; the fun .S is the only output.  What is left is the Exp printer the
-- -v dumps use and the string encoder Translate needs.
module MicroHs.ExpPrint(toStringP, encodeString) where
import Prelude(); import MHSPrelude
import Data.Char(ord, chr)
import MicroHs.EncodeData(encList)
import MicroHs.GenRomCommon(getPatNum)
import Data.Maybe
import Data.Bits
import MicroHs.Exp
import MicroHs.Expr(Lit(..), showLit, errorMessage, HasLoc(..))
import MicroHs.Ident(Ident, showIdent, mkIdent)

scWord :: Int -> Pat -> [Int] -> Int
scWord arity p is =
  let t    = getPatNum p
      args = take 6 (is ++ repeat 0)
      packed = foldr (.|.) 0 [ (a .&. 7) `shiftL` (14 + 3*k) | (a, k) <- zip args [0..] ]
  in  0x2 .|. ((t .&. 0x7f) `shiftL` 4) .|. (arity `shiftL` 11) .|. packed

-- Avoid quadratic concatenation by using difference lists,
-- turning concatenation into function composition.
toStringP :: Exp -> (String -> String)
toStringP ae =
  case ae of
    Var x   -> (showIdent x ++) . (' ' :)
    Lit (LStr s) ->
      -- Encode very short string directly as combinators.
      if length s > 1 then
        toStringP (App (Lit (LPrim "fromUTF8")) (Lit (LUStr (utf8encode s))))
      else
        toStringP (encodeString s)
    Lit (LUStr s) ->
      (quoteString s ++) . (' ' :)
    Lit (LInteger _) -> undefined
    Lit (LRat _) -> undefined
    Lit (LTick s) -> ('!':) . (quoteString s ++) . (' ' :)
    Lit l   -> (showLit l ++) . (' ' :)
    Lam _x _e -> undefined -- (("(\\" ++ showIdent x ++ " ") ++) . toStringP e . (")" ++)
    --App f a -> ("(" ++) . toStringP f . (" " ++) . toStringP a . (")" ++)
    App f a -> toStringP f . toStringP a . ("@" ++)
    Sc a p is -> ('%' :) . (show (scWord a p is) ++) . (' ' :)
    Morph _ -> (show ae ++) . (' ' :)   -- --morph atom (the fun .S backend is the real target)

quoteString :: String -> String
quoteString s =
  let
    achar c =
      if c == '"' || c == '\\' || c < ' ' || c > '~' then
        '\\' : show (ord c) ++ ['&']
      else
        [c]
  in '"' : concatMap achar s ++ ['"']

encodeString :: String -> Exp
encodeString = encList . map (Lit . LInt . ord)

utf8encode :: String -> String
utf8encode = concatMap utf8Char

utf8Char :: Char -> [Char]
utf8Char c | c <= chr 0x7f = [c]
           | otherwise =
  let i = ord c
  in  if i < 0x800 then
        let (i1, i2) = quotRem i 0x40
        in  [chr (i1 + 0xc0), chr (i2 + 0x80)]
      else if i < 0x10000 then
        let (i12, i3) = quotRem i   0x40
            (i1,  i2) = quotRem i12 0x40
        in  [chr (i1 + 0xe0), chr (i2 + 0x80), chr (i3 + 0x80)]
      else if i < 0x110000 then
        let (i123, i4) = quotRem i    0x40
            (i12,  i3) = quotRem i123 0x40
            (i1,   i2) = quotRem i12  0x40
        in  [chr (i1 + 0xf0), chr (i2 + 0x80), chr (i3 + 0x80), chr (i4 + 0x80)]
      else
        error "utf8Char: bad Char"
