-- Morphx.hs — generalized F-algebra morphism library.
--
-- TWO sets of generic morphisms:
--
-- 1. Fix-based forms (Milewski textbook shape).  Operate over
--    `Fix f` and rely on the Functor typeclass:
--
--        cata fmap alg = alg . fmap (cata fmap alg) . unFix
--
-- 2. Merged-fmap forms (no Fix newtype, no Functor typeclass).
--    Each ADT supplies its OWN `fmap` that descends one layer of
--    the recursive structure, combining `project` + structural
--    fmap into a single user-supplied function.  The cata is then
--
--        cata fmap alg = alg . fmap (cata fmap alg)
--
--    where `fmap :: (t -> a) -> t -> f a` projects the ADT into
--    its pattern functor and applies the recursive call to each
--    recursive position in one step.  No project / embed
--    auxiliary functions are needed; the user-supplied fmap IS
--    the entire bridge between the ADT and the pattern functor.

module Morphx
  ( -- * Fix-based generic morphisms (textbook form)
    Fix (..)
  , Algebra
  , Coalgebra
  , cata
  , ana
  , hylo
  , para
    -- * Merged-fmap forms (per-ADT custom fmap; no Fix, no Functor)
  , cata'
  , ana'
  , hylo'
  , para'
    -- * Mendler-style (open-recursion; no pattern functor at all)
  , mcata
  , mana
  , mhylo
  , mcata2
  ) where
import Prelude()
import NanoPrelude hiding ((<), (<=), (>), (>=), min, max)
import Data.Records

-- The fixed point of an endofunctor `f`:  Fix f ≅ f (Fix f).
newtype Fix f = Fix { unFix :: f (Fix f) }

type Algebra   f a = f a -> a
type Coalgebra f a = a -> f a

-- ---- Fix-based morphisms (used by *MorphXFix.hs) ---------

cata :: ((Fix f -> a) -> f (Fix f) -> f a)
     -> Algebra f a -> Fix f -> a
cata fmap_ alg = alg . fmap_ (cata fmap_ alg) . unFix

ana :: ((a -> Fix f) -> f a -> f (Fix f))
    -> Coalgebra f a -> a -> Fix f
ana fmap_ coalg = Fix . fmap_ (ana fmap_ coalg) . coalg

hylo :: ((a -> b) -> f a -> f b)
     -> Algebra f b -> Coalgebra f a -> a -> b
hylo fmap_ alg coalg = alg . fmap_ (hylo fmap_ alg coalg) . coalg

para :: ((Fix f -> (Fix f, a)) -> f (Fix f) -> f (Fix f, a))
     -> (f (Fix f, a) -> a)
     -> Fix f -> a
para fmap_ alg = alg . fmap_ (\t -> (t, para fmap_ alg t)) . unFix

-- ---- Merged-fmap morphisms (used by *MorphX.hs) ----------
--
-- The user-supplied `fmap` IS the entire bridge between the
-- direct recursive ADT `t` and its pattern functor `f`:
--
--   for cata-direction:  fmap :: (t -> a) -> t -> f a
--   for ana-direction :  fmap :: (a -> t) -> f a -> t
--
-- The library's cata' / ana' / hylo' / para' carry no Fix
-- newtype and no dependence on the Functor typeclass.

cata' :: ((t -> a) -> t -> f a)
      -> (f a -> a)
      -> t -> a
cata' fmap_ alg = c where c = alg . fmap_ c

ana' :: ((a -> t) -> f a -> t)
     -> (a -> f a)
     -> a -> t
ana' fmap_ coalg = a where a = fmap_ a . coalg

hylo' :: ((a -> b) -> f a -> f b)
      -> (f b -> b)
      -> (a -> f a)
      -> a -> b
hylo' fmap_ alg coalg = h where h = alg . fmap_ h . coalg

para' :: ((t -> (t, a)) -> t -> f (t, a))
      -> (f (t, a) -> a)
      -> t -> a
para' fmap_ alg = p where p = alg . fmap_ (\t -> (t, p t))

-- ---- Mendler-style (open recursion) ----------------------
--
-- The algebra takes the recurse function explicitly and
-- pattern-matches the ADT itself.  No pattern functor needed,
-- so no intermediate F-constructor is ever allocated.  In the
-- direct-ADT setting this is operationally just fix; the value
-- of the framing is conceptual (algebras as open-recursive
-- step functions) and the INLINE pragma makes GHC tie the knot
-- at the call site, exposing the algebra to specialisation.
--
-- The algebra has the shape  (recurse) -> (value) -> result.
-- Apply `recurse` to any recursive subterm to fold it; ignore
-- it where laziness or short-circuiting is wanted.

mcata :: ((t -> a) -> t -> a) -> t -> a
mcata phi = c where c = phi c

mana :: ((a -> t) -> a -> t) -> a -> t
mana phi = c where c = phi c

mhylo :: ((a -> b) -> a -> b) -> a -> b
mhylo phi = c where c = phi c

-- Two-input Mendler cata — for paired walks (zipsum etc).
-- Same shape; the algebra takes a binary recurse.
mcata2 :: ((t1 -> t2 -> a) -> t1 -> t2 -> a) -> t1 -> t2 -> a
mcata2 phi = c where c = phi c
