{-# OPTIONS_GHC -Wno-unused-imports #-}
-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
module MicroHs.Exp(
  Exp(..),
  MScheme(..), schemeName, schemeIx, morphMarker, lookupMorphMarker,
  yMarker,
  lazyMarker, wrapLazy, isLazyMarked, stripLazy,
  PrimOp,
  Pat(..),
  substExp,
  app2, app3, cFlip,
  allVarsExp, freeVars,
  lams, apps, spine,
  getHoles, fromSpine, fromPat,
  ) where
import Prelude(); import MHSPrelude hiding((<>))
import Data.Char
import Data.List
import MicroHs.Ident
import MicroHs.Expr(Lit(..), showLit)
import MicroHs.List
import MicroHs.MRnf
import Text.PrettyPrint.HughesPJLite
import Debug.Trace

type PrimOp = String
type Arity = Int
type Idx = Int

data Pat = X | At Pat Pat
  deriving (Eq)

getHoles :: Pat -> Int
getHoles X = 1
getHoles (At a b) = getHoles a + getHoles b

instance Show Pat where
  show X = "X"
  show (At p (At p1 p2)) = show p ++ "(" ++ show (At p1 p2) ++ ")"
  --show (At (At p1 p2) p) = show p1 ++ show p2 ++ show p
  show (At p1 p2) = show p1 ++ show p2

-- Explicit-morphism scheme tag.  One per recognised recursion scheme;
-- selected by the --morph classifier and lowered (in Desugar) into the
-- first-class `Morph` node below.  The fun-ISA backend emits one
-- instruction per tag (fn.cata / fn.ana / fn.para / fn.hylo).
data MScheme = MCata | MAna | MPara | MHylo
  deriving (Eq, Show)

-- Mnemonic suffix for the fun-ISA instruction (fn.cata / fn.ana / …)
-- and the scheme index used by the backend word encoder.
schemeName :: MScheme -> String
schemeName MCata = "cata"
schemeName MAna  = "ana"
schemeName MPara = "para"
schemeName MHylo = "hylo"

schemeIx :: MScheme -> Int
schemeIx MCata = 0
schemeIx MAna  = 1
schemeIx MPara = 2
schemeIx MHylo = 3

-- The --morph classifier (running on the Expr AST, before desugar) marks a
-- morphism head with this reserved EVar; desugar's `dsExpr` lowers it into the
-- first-class `Morph` node.  The "$$" prefix cannot collide with any
-- parser-produced identifier.  Mirrors `./f`'s `convF (Sym "cata") = Morph
-- SCata`.
morphMarker :: MScheme -> Ident
morphMarker s = mkIdent ("$$morph_" ++ schemeName s)

-- Reserved head for the Y primitive, so a classifier working on Expr can
-- emit `Y alg x` directly.  Going through a recursive let instead costs an
-- extra lambda-application and an eta-expandable `\go -> alg go`
-- (Desugar.letRecE), which is not what a Mendler form should compile to:
-- Y(Gt(z)(D7(f))) is three combinator words, and Gt/D7 are ordinary
-- structured combinators (same arity-4 Catalan pattern, different selectors).
yMarker :: Ident
yMarker = mkIdent "$$prim_Y" 

-- --grin carries the per-module {-# LAZY f #-} pragma to the link stage by
-- wrapping the marked binding's body: App (Var $$lazy) body.  Same reserved
-- "$$" convention as morphMarker.  The link stage classifies each def by
-- its top-level marker, then strips markers EVERYWHERE (a marker can end up
-- interior when inlineOnce splices a marked used-once def, where the
-- per-module path would also have abstracted it under the host's strategy).
lazyMarker :: Ident
lazyMarker = mkIdent "$$lazy"

wrapLazy :: Exp -> Exp
wrapLazy e = App (Var lazyMarker) e

isLazyMarked :: Exp -> Bool
isLazyMarked (App (Var i) _) = i == lazyMarker
isLazyMarked _ = False

stripLazy :: Exp -> Exp
stripLazy ae =
  case ae of
    App (Var i) e | i == lazyMarker -> stripLazy e
    App f a -> App (stripLazy f) (stripLazy a)
    Lam x e -> Lam x (stripLazy e)
    _ -> ae

lookupMorphMarker :: Ident -> Maybe MScheme
lookupMorphMarker i =
  lookupBy eqStr (unIdent i) [ (unIdent (morphMarker s), s) | s <- [MCata, MAna, MPara, MHylo] ]
  where eqStr a b = a == b
        lookupBy eq k = foldr (\(a,v) r -> if eq k a then Just v else r) Nothing

data Exp
  = Var Ident
  | App Exp Exp
  | Lam Ident Exp
  | Lit Lit
  | Sc Arity Pat [Idx]
  -- Explicit-morphism primitive.  Nullary head tagged with the scheme;
  -- the algebra and scrutinee travel as App args:
  --     App (App (Morph MCata) <alg>) <scrut>
  -- Mirrors `./f`'s `FExp.Morph Scheme`.  Rides through abstraction as
  -- a leaf (App scK) and the backend emits the fn.<scheme> instruction.
  | Morph MScheme
  deriving (Eq)

instance MRnf Exp where
  mrnf (Var a) = mrnf a
  mrnf (App a b) = mrnf a `seq` mrnf b
  mrnf (Lam a b) = mrnf a `seq` mrnf b
  mrnf (Lit a) = mrnf a
  mrnf (Morph _) = ()

app2 :: Exp -> Exp -> Exp -> Exp
app2 f a1 a2 = App (App f a1) a2

app3 :: Exp -> Exp -> Exp -> Exp -> Exp
app3 f a1 a2 a3 = App (app2 f a1 a2) a3

cFlip :: Exp
cFlip = Lit (LPrim "C")

--cR :: Exp
--cR = Lit (LPrim "R")

instance Show Exp where
  show = render . ppExp

ppExp :: Exp -> Doc
ppExp ae =
  case ae of
--    Let i e b -> sep [ text "let" <+> ppIdent i <+> text "=" <+> ppExp e, text "in" <+> ppExp b ]
    Var i -> ppIdent i
    App f a -> parens $ ppExp f <+> ppExp a
    Lam i e -> parens $ text "\\" <> ppIdent i <> text "." <+> ppExp e
    Lit l -> text (showLit l)
    Sc a p is -> text $ "<" ++ show a ++ ","
                     ++ show p ++ ","
                     ++ show is
                     ++ ">"
    Morph s -> text ("fn." ++ schemeName s)

substExp :: Ident -> Exp -> Exp -> Exp
substExp si se ae =
  case ae of
    Var i -> if i == si then se else ae
    App f a -> App (substExp si se f) (substExp si se a)
    Lam i e -> if si == i then
                 ae
               else if elem i (freeVars se) then
                 let
                   fe = allVarsExp e
                   ase = allVarsExp se
                   j = head [ v | n <- enumFrom (0::Int),
                              let { v = mkIdent ("a" ++ show n) },
                              not (elem v ase), not (elem v fe), v /= si ]
                 in
                   --trace ("substExp " ++ show [si, i, j]) $
                   Lam j (substExp si se (substExp i (Var j) e))
               else
                   Lam i (substExp si se e)
    Lit _ -> ae
    Sc _ _ _ -> ae
    Morph _ -> ae

-- This naive freeVars seems to be the fastest.
freeVars :: Exp -> [Ident]
freeVars ae =
  case ae of
    Var i -> [i]
    App f a -> freeVars f ++ freeVars a
    Lam i e -> deleteAllBy (==) i (freeVars e)
    Lit _ -> []
    Sc _ _ _ -> []
    Morph _ -> []

allVarsExp :: Exp -> [Ident]
allVarsExp ae =
  case ae of
    Var i -> [i]
    App f a -> allVarsExp f ++ allVarsExp a
    Lam i e -> i : allVarsExp e
    Lit _ -> []
    Sc _ _ _ -> []
    Morph _ -> []

lams :: [Ident] -> Exp -> Exp
lams xs e = foldr Lam e xs

apps :: Exp -> [Exp] -> Exp
apps f = foldl App f

-- the spine of an Exp
spine :: Exp -> (Exp, [Exp])
spine ae = spine' ae []
  where
    spine' e acc =
      case e of
        App f a -> spine' f (a : acc)
        _ -> (e, acc)

fromSpine :: (Exp, [Exp]) -> Exp
fromSpine (f, []) = f
fromSpine (f, e : es) = fromSpine (App f e, es)

fromPat :: Pat -> [Idx] -> [Exp] -> Exp
fromPat X [i] es = es !! i
fromPat (At p1 p2) is es =
  let
    (is1, is2) = splitAt (getHoles p1) is
  in
    App (fromPat p1 is1 es) (fromPat p2 is2 es)
fromPat _ _ _ = error "pattern holes and index list mismatch."
