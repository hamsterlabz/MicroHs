-- Whole-program optimization at the link stage (--grin).
--
-- The GRIN discipline (Boquist 1999; Podlovics/Hruska/Penzes, Acta
-- Cybernetica 2020): analyses and transformations run with the ENTIRE
-- program in hand.  Under --grin the per-module abstraction step is skipped
-- (Compile keeps the desugared lambda bindings, still after the per-module
-- inlineOnce) and mainCompile calls grinProgram over the whole [LDef] at
-- link; bracket abstraction then also runs at link.
--
-- Stage 1 is deliberately just two ingredients, both already proven here:
--   * prune:      keep only defs reachable from main.  Run FIRST, so the
--                 use counts below are counts over the live program; a
--                 library export used once by the program but also named by
--                 dead library code is invisible per module and used-once
--                 globally.
--   * inlineOnce: the SAME per-module pass Compile already runs, applied to
--                 the whole pruned program, where its use counts and its
--                 work-safety rule (never splice a thunk under a lambda)
--                 become global.  This is the cross-module half of the
--                 splice that the per-module pass cannot see.
-- Iterated to a bounded fixpoint: splicing removes references, the next
-- prune drops the dead def, and new used-once candidates appear.
module MicroHs.Grin(grinProgram) where
import Prelude(); import MHSPrelude
import MicroHs.Compile(inlineOnce)
import MicroHs.Exp
import MicroHs.Ident
import qualified MicroHs.IdentMap as M

type LDef = (Ident, Exp)

maxRounds :: Int
maxRounds = 5

grinProgram :: Int -> Ident -> [LDef] -> ([LDef], [String])
grinProgram optlvl mainName ds0 =
  let cap = if optlvl >= 2 then 128 else 8
      -- genRomMem synthesizes `_funMain = primPerformIO main` AFTER this
      -- pipeline, so primPerformIO is a root the graph itself never names.
      roots = mainName : [ i | (i, _) <- ds0, i == pioName ]
      pioName = mkIdent "Primitives.primPerformIO"
      measure ds = (length ds, sum [ sizeE e | (_, e) <- ds ])
      -- inlineOnce runs ONCE globally, exactly as it runs once per module:
      -- it resolves splice chains internally, and ITERATING it compounds
      -- splices until caller trees outgrow the arity-6 combi packing (its
      -- own comment warns of this; measured: sphere +10.8% instret +7.2%
      -- when it sat inside the fixpoint loop).  Only the collapse passes
      -- (specialize + beta) iterate.
      loop k ds
        | k == (0::Int) = (ds, maxRounds)
        | otherwise =
          let env = betaEnv ds
              ds' = prune roots (map (\ (i, e) -> (i, beta env e))
                                    (grinInline True cap (specialize env ds)))
          in  if measure ds' == measure ds then (ds, maxRounds - k)
              else loop (k - 1) ds'
      ds1 = prune roots ds0
      (dsN, rounds) = loop maxRounds ds1
      stats = [ "grin: defs " ++ show (length ds0)
                ++ " -> reachable " ++ show (length ds1)
                ++ " -> final " ++ show (length dsN)
                ++ " (" ++ show rounds ++ " rounds, cap " ++ show cap ++ ")" ]
  in  (dsN, stats)

-- inlineOnce's algorithm (Compile.hs), reimplemented with one extra knob:
-- lams=False refuses to splice used-once LAM-bodied defs (function
-- inlining).  Atom chains and work-safe used-once thunks still splice.
-- Under investigation: cross-module function splices cost sphere +10.8%
-- (instret +7.2%) while carrying permsort's -10%; the knob separates the
-- two populations for measurement.
grinInline :: Bool -> Int -> [LDef] -> [LDef]
grinInline lams cap ds = [ (i, sub e) | (i, e) <- ds ]
  where
    bump m i = M.insert i (maybe (1::Int) (+1) (M.lookup i m)) m
    uses = foldl bump M.empty (concatMap (freeVars . snd) ds)
    isAtom (App _ _) = False
    isAtom (Lam _ _) = False
    isAtom _         = True
    isThunk (App _ _) = True
    isThunk _         = False
    underLam (Lam _ b) = freeVars b
    underLam (App f a) = underLam f ++ underLam a
    underLam _         = []
    lamUsed = M.fromList [ (i, ()) | i <- concatMap (underLam . snd) ds ]
    inMap i m = case M.lookup i m of { Just _ -> True; Nothing -> False }
    workSafe i e = not (isThunk e) || not (inMap i lamUsed)
    lamOK e = lams || (case e of { Lam _ _ -> False; _ -> True })
    -- Atom policy for the GLOBAL round: only Var-bodied atoms (aliases)
    -- splice.  A Lit-bodied atom is a prim reference, and the backend
    -- expands inline arith prims into a multi-word RV blob PER OCCURRENCE:
    -- splicing a shared float prim into every use site duplicated the blob
    -- (sphere +10.8% cycles), and even used-once prim splices measurably
    -- perturbed packing (life +1.2% via div/mod).  Prims stay linked,
    -- exactly as cross-module references are in the base compile.
    -- Only Var-bodied atoms (aliases) splice.  Lit atoms are prim
    -- references and the backend expands inline arith prims into a
    -- multi-word RV blob PER OCCURRENCE; every static splice policy tried
    -- for them helped one bench and hurt another (sphere +10.8% at
    -- unlimited, mandel +7.3% at cap 4, kahan loses -5.5% at cap 1)
    -- because the cost depends on loop hotness, invisible here.  Prims
    -- stay linked, exactly as cross-module references are in base.
    atomOK _ e = case e of
                   Var _ -> True
                   _     -> False
    cand = M.fromList [ (i, e) | (i, e) <- ds
                      , (isAtom e && atomOK i e)
                        || (M.lookup i uses == Just 1
                            && sizeE e <= cap && workSafe i e
                            && lamOK e)
                      , not (elem i (freeVars e)) ]
    resolved = M.fromList [ (i, sub e) | (i, e) <- ds, inMap i cand ]
    sub (Var i)   = case M.lookup i resolved of { Just e -> e; Nothing -> Var i }
    sub (App f a) = App (sub f) (sub a)
    sub (Lam x b) = Lam x (sub b)
    sub e         = e

-- NOT IN THE PIPELINE.  Measured negative and kept only as the record.
--
-- Isolated against the same fresh bases (grin with vs without this pass):
-- InsertSortPure +5.87 % (395,468 -> 418,681), against Knights -0.89 % and
-- Parser -0.18 %; Ordlist, Permsort and Braun unchanged.  Answers were exact
-- throughout, so the whole-program condition below is SOUND -- it is simply
-- not PROFITABLE, and no static cost model can tell the cases apart: bracket
-- abstraction emits the same-size term either way (InsertSortPure.insert
-- raised 1->2 measures sc 10->10, sz 31->31), so the cost is purely dynamic.
-- Gating on scCount and on term size were both tried and neither fires.
--
-- Whole-program arity raising (GRIN's arityRaising, in the form this machine
-- would reward if it paid).  A definition written  f = \a -> <body>  but APPLIED everywhere
-- with more arguments than it binds costs one intermediate application node
-- per call: the reduction of f pops one argument, instantiates <body> into
-- cells, and only then meets the remaining arguments.  Widening f to the
-- arity its call sites actually use lets one combi word pop them together and
-- emit the whole reduct, which is the machine's whole point.
--
-- Sound because of a condition only a LINK-stage pass can check: f is raised
-- only when EVERY application of f passes at least m arguments and f never
-- occurs as a bare value.  Then no partial application of f is ever named or
-- shared, so nothing that was evaluated once becomes evaluated per call --
-- the failure mode that made splicing thunks under a lambda cost +6.6%.
--
-- Capped at 6 because the combi word holds six argument slots (wCombi
-- refuses more, loudly).
etaCap :: Int
etaCap = 6

etaRaise :: [LDef] -> [LDef]
etaRaise ds =
  let defAr e = case e of { Lam _ b -> 1 + defAr b; _ -> 0 }
      spineOf e = go e [] where { go (App f a) as = go f (a : as); go h as = (h, as) }
      calls e = case spineOf e of
                  (Var f, as@(_:_)) -> (f, length as) : concatMap calls as
                  _ -> case e of
                         App h a -> calls h ++ calls a
                         Lam _ b -> calls b
                         _       -> []
      -- a bare occurrence: the name used as a value rather than as a head
      bares e = case spineOf e of
                  (Var _, as@(_:_)) -> concatMap bareArg as
                  (Var v, [])       -> [v]
                  _ -> case e of
                         App h a -> bares h ++ bares a
                         Lam _ b -> bares b
                         _       -> []
      bareArg a = case a of { Var v -> [v]; _ -> bares a }
      allCalls = concatMap (calls . snd) ds
      allBares = concatMap (bares . snd) ds
      want i d = let ns = [ n | (g, n) <- allCalls, g == i ]
                 in  if null ns || elem i allBares then Nothing
                     else let m = minimum ns
                          in  if m > d && m <= etaCap then Just m else Nothing
      raise m e =
        let d = defAr e
            used = allVarsExp e
            fresh = [ v | k <- enumFrom (0::Int)
                        , let v = mkIdent ("_eta" ++ show k)
                        , not (elem v used) ]
            xs = take (m - d) fresh
            go 0 b = lams xs (apps b (map Var xs))
            go n (Lam v b) = Lam v (go (n - 1) b)
            go _ b = b
        in  go d e
  in  [ (i, case want i (defAr e) of
              Just m -> raise m e
              Nothing -> e)
      | (i, e) <- ds ]


-- Keep only definitions reachable from the roots.
prune :: [Ident] -> [LDef] -> [LDef]
prune roots ds =
  let dm = M.fromList ds
      go seen [] = seen
      go seen (i:is) =
        case M.lookup i seen of
          Just _ -> go seen is
          Nothing ->
            case M.lookup i dm of
              Nothing -> go (M.insert i () seen) is
              Just e  -> go (M.insert i () seen) (freeVars e ++ is)
      keepSet = go M.empty roots
      isKept i = case M.lookup i keepSet of { Just _ -> True; Nothing -> False }
  in  filter (isKept . fst) ds

sizeE :: Exp -> Int
sizeE ae =
  case ae of
    App f a -> 1 + sizeE f + sizeE a
    Lam _ e -> 1 + sizeE e
    _       -> 1

-- Safe compile-time beta reduction, bottom-up.  (\x -> b) a reduces only
-- when the substitution can neither duplicate nor delay work:
--   * a is an ATOM (Var/Lit/Sc/Morph): a reference or a value; substituting
--     it anywhere, any number of times, copies no work.  This is the case
--     that collapses dictionary dispatch once a known dictionary reference
--     has been spliced into the selector's head.
--   * otherwise a is a THUNK, and it may move only into a body that uses x
--     at most once and NOT under a lambda: one shared evaluation stays one
--     evaluation (same work-safety rule as inlineOnce).
--   * x unused: the argument is dropped.  Lazily sound: an undemanded thunk
--     never runs, which is exactly what K does at run time.
-- The env carries small, NON-recursive top-level values (dictionaries,
-- selectors): a saturated application headed by one unfolds at the call
-- site (GRIN's late inlining), which is what exposes the selector redex a
-- shared dictionary otherwise hides.  Fuel bounds pathological chains.
-- substExp (Exp.hs) is capture-avoiding.
betaFuel :: Int
betaFuel = 400

callCap :: Int
callCap = 24

unfoldSlack :: Int
unfoldSlack = 6

betaEnv :: [LDef] -> M.Map Exp
betaEnv ds =
  let dm = M.fromList ds
      out i = case M.lookup i dm of { Just e -> freeVars e; Nothing -> [] }
      -- i is recursive if it can reach itself through the call graph
      inRec i = go [] (out i)
        where
          go _ [] = False
          go seen (j : js)
            | j == i      = True
            | elem j seen = go seen js
            | otherwise   = go (j : seen) (out j ++ js)
  in  M.fromList [ (i, e) | (i, e) <- ds
                 , case e of { Lam _ _ -> True; _ -> False }
                 , sizeE e <= callCap
                 , not (inRec i) ]

-- Plain Lam-redex reduction fires only INSIDE the evaluation of an env
-- unfold (inRed): reducing source-program redexes at the top level was
-- measured to cost cycles (queens +0.13%, cichelli +0.24%) because the
-- machine memoizes those redexes at run time anyway; the static reduct
-- only perturbs packing.
beta :: M.Map Exp -> Exp -> Exp
beta env e0 = fst (go False betaFuel e0)
  where
    go inRed fuel ae =
      case ae of
        App f a ->
          let (f', fu1) = go inRed fuel f
              (a', fu2) = go inRed fu1 a
          in  case f' of
                Lam x b | inRed && betaSafe x b a' -> go inRed (fu2 - 1) (substExp x a' b)
                -- Shrinking unfold: a known value is worth unfolding only
                -- when the redex COLLAPSES (a dictionary selection reduces
                -- to the chosen method reference).  An unfold that merely
                -- duplicates the body -- plain function inlining -- comes
                -- out bigger than the call and is backed off, keeping the
                -- shared top level and its link.
                -- The residue must not be a Lam.  Applicative equivalence is
                -- not enough on this machine: the RV cmp/branch blobs decide
                -- booleans by the COMBI WORD FIELDS of the canonical
                -- constructor encoding (False = K, ar2 sel0; True = A, ar2
                -- sel1), so a partially applied constructor unfolded to an
                -- identity lambda is applicatively equal but decodes wrong
                -- (knights: True `App` error7 -> \f.f -> runtime error).
                -- References and applications keep the target's canonical
                -- encoding; lambda residues are refused.
                Var g | fu2 > 0
                      , Just ge <- M.lookup g env
                      , Lam x b <- ge
                      , betaSafe x b a'
                      -> let (red, fu3) = go True (fu2 - 1) (substExp x a' b)
                         in  if sizeE red <= unfoldSlack
                                && not (isLamE red && isConName g)
                             then (red, fu3)
                             else (App f' a', fu2)
                _ -> (App f' a', fu2)
        Lam x e -> let (e', fu) = go inRed fuel e in (Lam x e', fu)
        _ -> (ae, fuel)

betaSafe :: Ident -> Exp -> Exp -> Bool
betaSafe x b a = isAtomE a || (usesOf x b <= 1 && not (usedUnderLam x b))

isAtomE :: Exp -> Bool
isAtomE (App _ _) = False
isAtomE (Lam _ _) = False
isAtomE _         = True

isLamE :: Exp -> Bool
isLamE (Lam _ _) = True
isLamE _         = False

-- Constructor names: last qualified segment starts uppercase (Haskell
-- lexical rule).  Only CONSTRUCTOR values are representation-inspected by
-- the RV blobs, so only their partial applications must keep canonical
-- encodings; lambda residues from ordinary functions are plain values.
isConName :: Ident -> Bool
isConName i =
  case reverse (takeWhile (/= '.') (reverse (unIdent i))) of
    c : _ -> c >= 'A' && c <= 'Z'
    _     -> False

usesOf :: Ident -> Exp -> Int
usesOf x ae =
  case ae of
    Var i    -> if i == x then 1 else 0
    App f a  -> usesOf x f + usesOf x a
    Lam i e  -> if i == x then 0 else usesOf x e
    _        -> 0

usedUnderLam :: Ident -> Exp -> Bool
usedUnderLam x ae =
  case ae of
    App f a -> usedUnderLam x f || usedUnderLam x a
    Lam i e -> i /= x && usesOf x e > 0
    _       -> False

-- Whole-program call-site specialization (the GRIN eval-inlining payoff in
-- dictionary-passing form).  A call  f a1 .. aj .. am  where aj is a Var
-- naming a top-level VALUE (Lam or atom body: a dictionary, a method table,
-- a known function) becomes a call to  f'  =  f's body with parameter j
-- bound to that Var, lambda j removed.  Substituting a reference duplicates
-- no work; the value it names stays a single shared top level.  The next
-- beta round then collapses selector applications against the now-known
-- dictionary, which is where the win is.  Growth is bounded: one memoized
-- copy per (f, j, g), donor body size-capped, and the pipeline's round cap
-- limits chains.
specCap :: Int
specCap = 200

specialize :: M.Map Exp -> [LDef] -> [LDef]
specialize env ds =
  let dm = M.fromList ds
      arity e = case e of { Lam _ b -> 1 + arity b; _ -> 0 }
      -- known value: a top-level def whose body is WHNF (dictionary tables
      -- are Scott tuples, i.e. Lams)
      valueOK g = case M.lookup g dm of
                    Just (Lam _ _) -> True
                    Just e         -> isAtomE e
                    Nothing        -> False
      -- a call site  f a1..am  is specializable on the first parameter
      -- position j whose argument is a Var naming a known value
      site f as =
        case M.lookup f dm of
          Just fe | arity fe > 0, sizeE fe <= specCap -> pick fe (0::Int) as
          _ -> Nothing
        where
          pick (Lam _ _) j (Var g : _) | g /= f && valueOK g = Just (j, g)
          pick (Lam _ b) j (_ : rest) = pick b (j + 1) rest
          pick _ _ _ = Nothing
      spineOf e = go e []
        where go (App f a) as = go f (a : as)
              go h as = (h, as)
      apps f as = foldl App f as
      -- pass 1: collect the (f, j, g) requests from every site
      reqsIn e =
        case spineOf e of
          (Var f, as@(_:_)) ->
            (case site f as of { Just (j, g) -> [(f, j, g)]; Nothing -> [] })
            ++ concatMap reqsIn as
          _ -> case e of
                 App h a -> reqsIn h ++ reqsIn a
                 Lam _ b -> reqsIn b
                 _       -> []
      -- keep only requests whose specialized body actually COLLAPSES
      -- under beta (a dictionary being selected from), not ones where the
      -- known argument is merely called: those only trade a shared block
      -- for a copy and were measured to cost cycles (mss +2.3%).
      collapses (f, j, g) =
        case M.lookup f dm of
          Just fe -> let cand = dropLam j g fe
                     in  sizeE (beta env cand) < sizeE cand
          Nothing -> False
      reqs = dedup [ r | (_, e) <- ds, r <- reqsIn e, collapses r ]
      dedup [] = []
      dedup (r : rest) = r : dedup (filter (/= r) rest)
      specName f j g = mkIdent (unIdent f ++ "@" ++ show j ++ "@" ++ unIdent g)
      -- pass 2: materialize each requested def (skip ones that already
      -- exist from an earlier round)
      dropLam j g e =
        case (j, e) of
          (0, Lam x b) -> substExp x (Var g) b
          (_, Lam x b) -> Lam x (dropLam (j - 1) g b)
          _            -> e
      newDefs = [ (specName f j g, dropLam j g fe)
                | (f, j, g) <- reqs
                , case M.lookup (specName f j g) dm of
                    Just _ -> False; Nothing -> True
                , Just fe <- [M.lookup f dm] ]
      -- pass 3: rewrite every site whose request is known
      reqSet = M.fromList [ (specName f j g, ()) | (f, j, g) <- reqs ]
      dropAt j xs = take j xs ++ drop (j + 1) xs
      rew ae =
        case spineOf ae of
          (Var f, as@(_:_)) ->
            let as' = map rew as
            in  case site f as' of
                  Just (j, g)
                    | Just _ <- M.lookup (specName f j g) reqSet
                    -> apps (Var (specName f j g)) (dropAt j as')
                  _ -> apps (Var f) as'
          _ ->
            case ae of
              App h a -> App (rew h) (rew a)
              Lam x e -> Lam x (rew e)
              _       -> ae
  in  [ (i, rew e) | (i, e) <- ds ] ++ [ (i, rew e) | (i, e) <- newDefs ]
