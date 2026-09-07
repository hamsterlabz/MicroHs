-- The morphism classifier (`--morph` / `--mmorph`).
--
-- Detect self-recursive bindings that are catamorphisms / anamorphisms and
-- rewrite each into a first-class morphism instruction (`Exp.Morph`, lowered by
-- Desugar, emitted by the fun-ISA backend as fn.cata / fn.ana / fn.para /
-- fn.hylo).  Two emission modes:
--
--   Explicit (--morph):  fn.cata (functor) (algebra) input
--                        fn.ana  (functor) (coalgebra) input
--     The (non-recursive) algebra and the functor (the fmap that does the
--     recursing) are EXTRACTED from the naive recursive definition.  The
--     recursion lives in the instruction, not in the algebra.
--
--   Mendler (--mmorph):  fn.<scheme> (\_rec \y. body) input
--     The recursion is explicit in the algebra via a bound `_rec`.
--
-- Port of the morphism path of `./f`'s `src/FExpr.hs`.
module MicroHs.Morph(morphProgram, MorphMode(..)) where
import Prelude(); import MHSPrelude
import Data.List
import MicroHs.Expr
import MicroHs.Exp(MScheme(..), morphMarker, yMarker)
import MicroHs.Ident

data MorphMode = Explicit | Mendler

----------------------------------------------------------------
-- Small helpers

-- Reserved binder names introduced by the rewrite.
recId, gId, sId, scrutId, goId :: Ident
recId   = mkIdent "_morph_rec"     -- Mendler self-reference (algebra binder)
gId     = mkIdent "_morph_g"       -- functor's recursion argument
sId     = mkIdent "_morph_s"       -- algebra/functor scrutinee
scrutId = mkIdent "_morph_scrut"   -- normalised multi-clause scrutinee
goId    = mkIdent "_morph_go"      -- Mendler recursive fixpoint binding

freshField :: Int -> Ident
freshField n = mkIdent ("_morph_x" ++ show n)

req :: Bool -> Maybe ()
req True  = Just ()
req False = Nothing

orElse :: Maybe a -> Maybe a -> Maybe a
orElse (Just x) _ = Just x
orElse Nothing  y = y

unParen :: Expr -> Expr
unParen (EParen e) = unParen e
unParen e          = e

oneAlt :: Expr -> EAlts
oneAlt e = EAlts [([], e)] []

oneBody :: EAlts -> Maybe Expr
oneBody (EAlts [([], e)] []) = Just e
oneBody _                    = Nothing

-- Application spine over `Expr` (head + left-to-right args), paren-stripping.
spineE :: Expr -> (Expr, [Expr])
spineE = go []
  where
    go acc e = case unParen e of
      EApp f a -> go (a : acc) f
      h        -> (h, acc)

apps :: Expr -> [Expr] -> Expr
apps = foldl EApp

simpleVar :: EPat -> Maybe Ident
simpleVar p = case unParen p of
  EVar i | not (isConIdent (unQualIdent i)) -> Just i
  _                           -> Nothing

eqVarI :: Expr -> Ident -> Bool
eqVarI e n = case unParen e of EVar v -> v == n; _ -> False

-- A constructor head.  The identifier must be UNQUALIFIED before the test:
-- isConIdent looks at the first character of the whole identifier text, so a
-- locally-defined lowercase function reads as a constructor once the type
-- checker has qualified it (Knights.appendL -> 'K' -> "constructor").  That
-- made detectAnaX accept showI as an unfold and build the pattern
-- `Knights.appendL x0 x1`, which Desugar rejects: "impossible ... appendL".
isConHead :: Expr -> Bool
isConHead e = case fst (spineE e) of
  ECon _ -> True
  EVar i -> isConIdent (unQualIdent i)
  _      -> False

buildsCon :: Expr -> Bool
buildsCon = isConHead

fstE, sndE :: Expr
fstE = EVar (mkIdent "NanoPrelude.fst")
sndE = EVar (mkIdent "NanoPrelude.snd")

-- count free occurrences of a variable (binders here are fresh, so shadowing
-- is not a concern for the uses we analyse).
countVar :: Ident -> Expr -> Int
countVar v = go
  where
    go e0 = case unParen e0 of
      EVar i        -> if i == v then 1 else 0
      EApp a b      -> go a + go b
      EIf a b c     -> go a + go b + go c
      ECase s arms  -> go s + sum [ goAlts a | (_, a) <- arms ]
      ETuple es     -> sum (map go es)
      ELam _ eqs    -> sum [ goAlts a | Eqn _ a <- eqs ]
      ENegApp e     -> go e
      ESign e _     -> go e
      _             -> 0
    goAlts (EAlts alts _) = sum [ go e | (_, e) <- alts ]

mentionsId :: Ident -> Expr -> Bool
mentionsId f = goE
  where
    goE e0 = case e0 of
      EVar i        -> i == f
      EApp a b      -> goE a || goE b
      ELam _ eqs    -> any goEqn eqs
      EIf a b c     -> goE a || goE b || goE c
      ECase s arms  -> goE s || any (goAlts . snd) arms
      ELet bs e     -> any goBind bs || goE e
      ETuple es     -> any goE es
      EParen e      -> goE e
      ESign e _     -> goE e
      ENegApp e     -> goE e
      _             -> False
    goEqn (Eqn _ a)  = goAlts a
    goAlts (EAlts alts bs) =
      any (\(gs, e) -> any goStmt gs || goE e) alts || any goBind bs
    goStmt (SThen e)  = goE e
    goStmt (SBind _ e)= goE e
    goStmt (SLet bs)  = any goBind bs
    goBind (Fcn _ eqs) = any goEqn eqs
    goBind (PatBind _ e) = goE e
    goBind _ = False

----------------------------------------------------------------
-- Normalise a function's clauses into (param-vars, single body Expr).
--   * one clause with simple-var params  -> (vars, rhs)
--   * many clauses pattern-matching ONE column -> (vars+fresh scrut,
--     `case scrut of <branches>`)
-- Guards / where are not handled (the binding is left unclassified).

funShape :: [Eqn] -> Maybe ([Ident], Expr)
funShape [Eqn ps alts] = do
  vs <- mapM simpleVar ps
  e  <- oneBody alts
  Just (vs, e)
funShape eqns@(Eqn ps0 _ : _) = do
  req (not (null ps0))
  let k = length ps0
  clauses <- mapM clause eqns
  req (all (\(ps,_) -> length ps == k) clauses)
  let columns = [ [ pats !! j | (pats,_) <- clauses ] | j <- [0 .. k-1] ]
  cols <- mapM classifyColumn columns
  let scrutCols = [ j | (j, Nothing) <- zip [0..] cols ]
  case scrutCols of
    [sp] ->
      let caps     = [ i | Just i <- cols ]
          params   = insertAt sp scrutId caps
          branches = [ (pat !! sp, oneAlt body) | (pat, body) <- clauses ]
      in Just (params, ECase (EVar scrutId) branches)
    _ -> Nothing
  where
    clause (Eqn ps a) = do e <- oneBody a; Just (ps, e)
funShape _ = Nothing

classifyColumn :: [EPat] -> Maybe (Maybe Ident)
classifyColumn pats =
  case mapM simpleVar pats of
    Just (v:vs) | all (== v) vs -> Just (Just v)
    Just _                      -> Nothing
    Nothing
      | all isPConApp pats      -> Just Nothing
      | otherwise               -> Nothing

insertAt :: Int -> a -> [a] -> [a]
insertAt n x xs = let (a, b) = splitAt n xs in a ++ x : b

----------------------------------------------------------------
-- Self-call analysis (shared by both modes).
--
-- A saturated self-call is `f a0 .. a_{k-1}` (k = #captures + 1) whose
-- non-recursion args equal the captures by name.  `scrutPos` is the index of
-- the recursion argument among the call's args.

selfScrut :: Ident -> Int -> [Ident] -> Expr -> Maybe Expr
selfScrut f scrutPos caps e =
  case spineE e of
    (EVar v, args)
      | v == f, length args == length caps + 1 ->
          let (before, atAfter) = splitAt scrutPos args
          in case atAfter of
               (atS : after) | and (zipWith eqVarI (before ++ after) caps) -> Just atS
               _ -> Nothing
    _ -> Nothing

-- Replace every self-call `f caps x` by `x` (eliding the recursion); fails if a
-- reference to f is not a clean saturated self-call.
elideSelf :: Ident -> Int -> [Ident] -> Expr -> Maybe Expr
elideSelf f scrutPos caps = go
  where
    go e0 = case selfScrut f scrutPos caps e0 of
      Just s  -> go s
      Nothing -> case unParen e0 of
        EApp a b     -> EApp <$> go a <*> go b
        EIf a b c    -> EIf <$> go a <*> go b <*> go c
        ECase s arms -> ECase <$> go s <*> mapM goArm arms
        ETuple es    -> ETuple <$> mapM go es
        ELam l eqs   -> ELam l <$> mapM goEqn eqs
        ENegApp e    -> ENegApp <$> go e
        ESign e t    -> (\e' -> ESign e' t) <$> go e
        leaf         -> if mentionsId f leaf then Nothing else Just leaf
    goArm (p, a) = (,) p <$> goAlts a
    goAlts (EAlts alts bs) = (\as -> EAlts as bs) <$> mapM goAlt alts
    goAlt (gs, e) = (,) gs <$> go e
    goEqn (Eqn ps a) = Eqn ps <$> goAlts a

-- All recursion-arguments of self-calls in an expression (does not descend
-- into a matched self-call's recursion arg).
allSelfScruts :: Ident -> Int -> [Ident] -> Expr -> [Expr]
allSelfScruts f scrutPos caps = go
  where
    go e0 = case selfScrut f scrutPos caps e0 of
      Just s  -> [s]
      Nothing -> case unParen e0 of
        EApp a b     -> go a ++ go b
        EIf a b c    -> go a ++ go b ++ go c
        ECase s arms -> go s ++ concatMap (goAlts . snd) arms
        ETuple es    -> concatMap go es
        ELam _ eqs   -> concatMap (\(Eqn _ a) -> goAlts a) eqs
        ENegApp e    -> go e
        ESign e _    -> go e
        _            -> []
    goAlts (EAlts alts _) = concatMap (\(_, e) -> go e) alts

----------------------------------------------------------------
-- The result expressions of a body (arms of an if/case, or the body itself).

resultArms :: Expr -> [Expr]
resultArms e = case unParen e of
  EIf _ t f    -> [t, f]
  ECase _ arms -> [ rhs | (_, EAlts alts _) <- arms, (_, rhs) <- alts ]
  b            -> [b]

caseArms :: Expr -> Maybe [(EPat, Expr)]
caseArms e = case unParen e of
  ECase _ arms -> mapM (\(p, a) -> (,) p <$> oneBody a) arms
  _            -> Nothing

----------------------------------------------------------------
-- EXPLICIT mode: extract (functor, algebra/coalgebra).

-- The structural scrutinee: a parameter the body cases on.
caseOnParam :: [Ident] -> Expr -> Maybe (Ident, Int, [Ident])
caseOnParam params body = case unParen body of
  ECase (EVar s) _ | Just pos <- elemIndex s params ->
    Just (s, pos, [ n | (n,i) <- zip params [0..], i /= pos ])
  _ -> Nothing

-- Catamorphism: body cases on a parameter; recursion only on field binders,
-- each used linearly (pure fold).
detectCataX :: Ident -> [Ident] -> Expr -> Maybe (MScheme, Expr, Expr, Ident)
detectCataX f params body = do
  (scrutName, scrutPos, caps) <- caseOnParam params body
  arms <- caseArms body
  quints <- mapM (cataArm f scrutPos caps) arms
  -- algebra keeps each branch's ORIGINAL pattern (its bound field names appear,
  -- as already-recursed results, in the algebra body).
  let algArms = [ (pat, oneAlt algB) | (pat, _, _, _, algB) <- quints ]
      -- functor rebuilds each constructor with fresh field binders, applying the
      -- recursion arg `g` at the recursive field positions.
      funArms = [ functorArm h ar recPos | (_, h, ar, recPos, _) <- quints ]
      algebra = eLam [EVar sId] (ECase (EVar sId) algArms)
      functor = eLam [EVar gId, EVar sId] (ECase (EVar sId) funArms)
  Just (MCata, functor, algebra, scrutName)

-- One cata arm: (originalPattern, ctorHead, arity, recursivePositions, algBody).
cataArm :: Ident -> Int -> [Ident] -> (EPat, Expr)
        -> Maybe (EPat, Expr, Int, [Int], Expr)
cataArm f scrutPos caps (pat, branchBody) = do
  req (isConHead pat)
  let (h, fps) = spineE pat
      fieldNames = map simpleVar fps               -- Maybe per position
  -- every self-call's recursion arg must be a NAMED field binder of this arm
  scruts <- mapM asVar (allSelfScruts f scrutPos caps branchBody)
  req (all (\v -> Just v `elem` fieldNames) scruts)
  -- pure cata: each recursive field is used ONLY as the recursion argument
  -- (linear).  A field used also as the original sub-term is a paramorphism.
  req (all (\v -> countVar v branchBody == length (filter (== v) scruts))
           (nub scruts))
  let recPos = [ i | (i, mn) <- zip [0..] fieldNames, Just v <- [mn], v `elem` scruts ]
  algB <- elideSelf f scrutPos caps branchBody
  Just (pat, h, length fps, nub recPos, algB)
  where
    asVar e = case unParen e of EVar v -> Just v; _ -> Nothing

-- A functor case arm: `C x0 .. x_{n-1} -> C (g? x0) .. (g? x_{n-1})`, applying g
-- only at the recursive positions.  Fresh binders, so wildcard fields are fine.
functorArm :: Expr -> Int -> [Int] -> (EPat, EAlts)
functorArm h ar recPos =
  let xs  = map freshField [0 .. ar-1]
      pat = apps h (map EVar xs)
      rhs = apps h [ if i `elem` recPos then EApp (EVar gId) (EVar x) else EVar x
                   | (i, x) <- zip [0..] xs ]
  in (pat, oneAlt rhs)

-- Paramorphism: like a cata, but a recursive field is ALSO used directly (the
-- original sub-term).  The functor pairs (recursive-result, original) at the
-- recursive positions; the algebra reads `fst`/`snd` of that pair.
detectParaX :: Ident -> [Ident] -> Expr -> Maybe (MScheme, Expr, Expr, Ident)
detectParaX f params body = do
  (scrutName, scrutPos, caps) <- caseOnParam params body
  arms <- caseArms body
  sextets <- mapM (paraArm f scrutPos caps) arms
  req (any (\(_, _, _, _, uo, _) -> uo) sextets)   -- at least one true original use
  let algArms = [ (pat, oneAlt algB) | (pat, _, _, _, _, algB) <- sextets ]
      funArms = [ paraFunctorArm h ar recPos | (_, h, ar, recPos, _, _) <- sextets ]
      algebra = eLam [EVar sId] (ECase (EVar sId) algArms)
      functor = eLam [EVar gId, EVar sId] (ECase (EVar sId) funArms)
  Just (MPara, functor, algebra, scrutName)

paraArm :: Ident -> Int -> [Ident] -> (EPat, Expr)
        -> Maybe (EPat, Expr, Int, [Int], Bool, Expr)
paraArm f scrutPos caps (pat, branchBody) = do
  req (isConHead pat)
  let (h, fps) = spineE pat
      fieldNames = map simpleVar fps
  scruts <- mapM asVar (allSelfScruts f scrutPos caps branchBody)
  req (all (\v -> Just v `elem` fieldNames) scruts)
  let recNames = nub scruts
      recPos   = [ i | (i, mn) <- zip [0..] fieldNames, Just v <- [mn], v `elem` recNames ]
      usesOrig = any (\v -> countVar v branchBody > length (filter (== v) scruts)) recNames
  algB <- paraRewrite f scrutPos caps recNames branchBody
  Just (pat, h, length fps, nub recPos, usesOrig, algB)
  where
    asVar e = case unParen e of EVar v -> Just v; _ -> Nothing

-- Functor arm pairing (g x, x) at recursive positions.
paraFunctorArm :: Expr -> Int -> [Int] -> (EPat, EAlts)
paraFunctorArm h ar recPos =
  let xs  = map freshField [0 .. ar-1]
      pat = apps h (map EVar xs)
      rhs = apps h [ if i `elem` recPos then ETuple [EApp (EVar gId) (EVar x), EVar x] else EVar x
                   | (i, x) <- zip [0..] xs ]
  in (pat, oneAlt rhs)

-- Rewrite the para algebra body: a self-call `f caps v` reads the recursive
-- result `fst v`; a bare recursive field `v` reads the original `snd v`.
paraRewrite :: Ident -> Int -> [Ident] -> [Ident] -> Expr -> Maybe Expr
paraRewrite f scrutPos caps recFields = go
  where
    go e0 = case selfScrut f scrutPos caps e0 of
      Just s  -> Just (EApp fstE s)
      Nothing -> case unParen e0 of
        EVar v | v `elem` recFields -> Just (EApp sndE (EVar v))
        EVar _       -> Just e0
        EApp a b     -> EApp <$> go a <*> go b
        EIf a b c    -> EIf <$> go a <*> go b <*> go c
        ECase s arms -> ECase <$> go s <*> mapM goArm arms
        ETuple es    -> ETuple <$> mapM go es
        ELam l eqs   -> ELam l <$> mapM goEqn eqs
        ENegApp e    -> ENegApp <$> go e
        ESign e t    -> (\e' -> ESign e' t) <$> go e
        leaf         -> if mentionsId f leaf then Nothing else Just leaf
    goArm (p, a) = (,) p <$> goAlts a
    goAlts (EAlts alts bs) = (\as -> EAlts as bs) <$> mapM goAlt alts
    goAlt (gs, e) = (,) gs <$> go e
    goEqn (Eqn ps a) = Eqn ps <$> goAlts a

-- Anamorphism: body builds constructors; recursion feeds the next seed.
detectAnaX :: Ident -> [Ident] -> Expr -> Maybe (MScheme, Expr, Expr, Ident)
detectAnaX f params body = do
  req (not (null params))
  -- an unfold must PRODUCE structure from a seed, not consume a parameter by
  -- casing on it (that is a cata/para).
  req (case caseOnParam params body of Nothing -> True; _ -> False)
  let seedName = last params
      caps     = init params
      scrutPos = length caps   -- recursion arg is the last call arg
  -- every result arm builds a constructor
  req (all buildsCon (resultArms body))
  ctorInfos <- collectCtors f scrutPos caps (resultArms body)
  coalgBody <- elideSelf f scrutPos caps body
  let coalg   = eLam [EVar seedName] coalgBody
      functor = eLam [EVar gId, EVar sId]
                     (ECase (EVar sId) [ functorArm h ar recPos | (h, ar, recPos) <- ctorInfos ])
  Just (MAna, functor, coalg, seedName)

-- Collect the output constructors built by the ana, with their recursive arg
-- positions.  Deduplicated by constructor name (must be consistent).
collectCtors :: Ident -> Int -> [Ident] -> [Expr]
             -> Maybe [(Expr, Int, [Int])]
collectCtors f scrutPos caps arms = do
  infos <- mapM one arms
  Just (nubBy sameCtor infos)
  where
    one arm =
      let (h, args) = spineE arm
          recPos = [ i | (i, a) <- zip [0..] args
                       , case selfScrut f scrutPos caps a of Just _ -> True; Nothing -> False ]
      in if isConHead arm then Just (h, length args, recPos) else Nothing
    sameCtor (h1,_,_) (h2,_,_) = ctorName h1 == ctorName h2
    ctorName e = case fst (spineE e) of
      ECon c -> showIdent (conIdent c)
      EVar i -> showIdent i
      _      -> ""

----------------------------------------------------------------
-- MENDLER mode: algebra `\_rec \y. body[ self calls := _rec sub ]`.

findScrutPos :: [Ident] -> Expr -> Maybe (Int, Ident, [Ident])
findScrutPos params body =
  case unParen body of
    ECase (EVar s) _ | Just pos <- elemIndex s params ->
      Just (pos, s, [ n | (n,i) <- zip params [0..], i /= pos ])
    _ -> case params of
      [] -> Nothing
      _  -> let lastPos = length params - 1
            in Just (lastPos, params !! lastPos, init params)

substRecToMendler :: Ident -> Int -> [Ident] -> Expr -> Maybe Expr
substRecToMendler f scrutPos caps = go
  where
    go e0 = case selfScrut f scrutPos caps e0 of
      Just s  -> (\s' -> EApp (EVar recId) s') <$> go s
      Nothing -> case unParen e0 of
        EApp a b     -> EApp <$> go a <*> go b
        EIf a b c    -> EIf <$> go a <*> go b <*> go c
        ECase s arms -> ECase <$> go s <*> mapM goArm arms
        ETuple es    -> ETuple <$> mapM go es
        ELam l eqs   -> ELam l <$> mapM goEqn eqs
        ENegApp e    -> ENegApp <$> go e
        ESign e t    -> (\e' -> ESign e' t) <$> go e
        leaf         -> if mentionsId f leaf then Nothing else Just leaf
    goArm (p, a) = (,) p <$> goAlts a
    goAlts (EAlts alts bs) = (\as -> EAlts as bs) <$> mapM goAlt alts
    goAlt (gs, e) = (,) gs <$> go e
    goEqn (Eqn ps a) = Eqn ps <$> goAlts a

detectMendler :: Ident -> [Ident] -> Expr -> Maybe (MScheme, Expr, Ident)
detectMendler f params body = do
  (scrutPos, scrutName, caps) <- findScrutPos params body
  body' <- substRecToMendler f scrutPos caps body
  req (not (mentionsId f body'))
  req (mentionsId recId body')
  let alg = eLam [EVar recId, EVar scrutName] body'
  Just (chooseScheme params body, alg, scrutName)

chooseScheme :: [Ident] -> Expr -> MScheme
chooseScheme params body =
  case unParen body of
    ECase (EVar s) _ | s `elem` params -> MCata
    _ | all buildsCon (resultArms body) -> MAna
      | otherwise                       -> MPara

----------------------------------------------------------------
-- Reserved names the classifier must not touch.

isReserved :: Ident -> Bool
isReserved i =
  let s = unQualString (unIdent i)
  in  "fmap_" `isPrefixOf` s || "_alg" `isSuffixOf` s || "_coa" `isSuffixOf` s

----------------------------------------------------------------
-- Classify one binding.  Returns the rewritten def and (explicit mode) a
-- morph-map entry: (scheme, captures, functor, algebra/coalgebra).

type MInfo = (MScheme, [Ident], Expr, Expr)

classifyOne :: MorphMode -> EDef -> (EDef, Maybe (Ident, MInfo))
classifyOne mode d@(Fcn f eqns)
  | isReserved f = (d, Nothing)
  | otherwise =
      case funShape eqns of
        Just (params, body) | mentionsId f body ->
          case mode of
            Explicit ->
              case detectCataX f params body
                     `orElse` detectParaX f params body
                     `orElse` detectAnaX f params body of
                Just res@(sch, functor, alg, scrut) ->
                  ( emitExplicit f params res
                  , Just (f, (sch, filter (/= scrut) params, functor, alg)) )
                Nothing -> (d, Nothing)
            Mendler ->
              case detectMendler f params body of
                Just (_sch, alg, scrut) ->
                    -- `Y alg scrut`, NOT `let go = alg go in go scrut`: the
                  -- recursive let desugars (Desugar.letRecE) to
                  -- (\go -> go scrut) (Y (\go -> alg go)) -- an extra
                  -- lambda-application and an eta-expandable inner lambda.
                  -- The Mendler form wants the compact Y(Gt(z)(D7(f))) shape,
                  -- whose pieces are ordinary structured combinators.
                  let newBody = eApps (EVar yMarker) [alg, EVar scrut]
                  in ( Fcn f [eEqn (map EVar params) newBody], Nothing )
                Nothing -> (d, Nothing)
        _ -> (d, Nothing)
classifyOne _ d = (d, Nothing)

emitExplicit :: Ident -> [Ident] -> (MScheme, Expr, Expr, Ident) -> EDef
emitExplicit f params (sch, functor, algebra, scrut) =
  Fcn f [eEqn (map EVar params)
              (eApps (EVar (morphMarker sch)) [functor, algebra, EVar scrut])]

----------------------------------------------------------------
-- Fusion: cata . ana  ->  hylo (explicit mode).
--
-- A binding body `outerCata (innerAna seed)` becomes
--   fn.hylo functor algebra coalgebra seed
-- (the intermediate structure is never built).

substVarExpr :: Ident -> Expr -> Expr -> Expr
substVarExpr v rep = go
  where
    go e0 = case e0 of
      EVar i        -> if i == v then rep else e0
      EApp a b      -> EApp (go a) (go b)
      EIf a b c     -> EIf (go a) (go b) (go c)
      ECase s arms  -> ECase (go s) [ (p, goAlts a) | (p, a) <- arms ]
      ETuple es     -> ETuple (map go es)
      ELam l eqs    -> ELam l [ Eqn ps (goAlts a) | Eqn ps a <- eqs ]
      ELet bs e     -> ELet bs (go e)
      EParen e      -> EParen (go e)
      ENegApp e     -> ENegApp (go e)
      ESign e t     -> ESign (go e) t
      _             -> e0
    goAlts (EAlts alts bs) = EAlts [ (gs, go e) | (gs, e) <- alts ] bs

-- A call to a classified morphism: returns (scheme, functor, alg/coalg, input)
-- with the call-site captures inlined.
extractCall :: [(Ident, MInfo)] -> Expr -> Maybe (MScheme, Expr, Expr, Expr)
extractCall mmap e =
  case spineE e of
    (EVar name, args) -> do
      (sch, caps, functor, ac) <- lookupInfo name mmap
      req (length args == length caps + 1)
      let capArgs = init args
          input   = last args
          inline x = foldr (\(v, a) y -> substVarExpr v a y) x (zip caps capArgs)
      Just (sch, inline functor, inline ac, input)
    _ -> Nothing
  where
    lookupInfo n = foldr (\(k, v) r -> if k == n then Just v else r) Nothing

fuseBody :: [(Ident, MInfo)] -> Expr -> Maybe Expr
fuseBody mmap body = do
  (schO, funcO, algO, inner) <- extractCall mmap (unParen body)
  (schA, _funcA, coalgA, seed) <- extractCall mmap (unParen inner)
  req (schO == MCata && schA == MAna)
  Just (eApps (EVar (morphMarker MHylo)) [funcO, algO, coalgA, seed])

fuseDef :: [(Ident, MInfo)] -> EDef -> EDef
fuseDef mmap d@(Fcn h [Eqn pats alts])
  | isReserved h = d
  | Just body <- oneBody alts
  , Just nb    <- fuseBody mmap body = Fcn h [Eqn pats (oneAlt nb)]
fuseDef _ d = d

----------------------------------------------------------------
-- Entry point.

morphProgram :: MorphMode -> Ident -> [EDef] -> [EDef]
morphProgram mode _mn defs =
  let pairs = map (classifyOne mode) defs
      defs1 = map fst pairs
      mmap  = [ x | (_, Just x) <- pairs ]
  in  case mode of
        Explicit -> map (fuseDef mmap) defs1
        Mendler  -> defs1
