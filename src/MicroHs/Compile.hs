-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
module MicroHs.Compile(
  compileCacheTop,
  compileMany,
  inlineOnce,
  maybeSaveCache,
  getCached,
  validateCache,
  Cache, emptyCache, deleteFromCache,
  moduleToFile,
  packageDir, packageSuffix, packageTxtSuffix,
  mhsVersion,
  getMhsDir,
  openFilePath,
  ) where
import Prelude(); import MHSPrelude
import Data.Char
import Data.List
import Data.Maybe
import Data.Version
import System.Directory
import System.Environment
import System.FilePath
import System.IO
import System.IO.MD5
import System.IO.Serialize
import System.IO.TimeMilli
import System.Process
import MicroHs.Abstract
import MicroHs.Builtin
import MicroHs.CompileCache
import MicroHs.Desugar
import MicroHs.Exp
import MicroHs.Morph(morphProgram, MorphMode(..))
import MicroHs.Expr
import MicroHs.Flags
import MicroHs.Ident
import qualified MicroHs.IdentMap as M
import MicroHs.List
import MicroHs.MRnf
import MicroHs.Package
import MicroHs.Parse
import qualified MicroHs.State as S
import MicroHs.StateIO
import MicroHs.SymTab
import MicroHs.TypeCheck
import Compat
import MicroHs.Instances() -- for ghc
import Paths_MicroHs(version, getDataDir)

mhsVersion :: String
mhsVersion = showVersion version

mhsCacheName :: FilePath
mhsCacheName = ".mhscache"

type Time = Int

type CM a = StateIO Cache a

-----------------

-- Compile the module with the given name, starting with the given cache.
-- Return the "compiled module" and the resulting cache.
compileCacheTop :: Flags -> IdentModule -> Cache -> IO ((IdentModule, [(Ident, Exp)]), Symbols, Cache)
compileCacheTop flags0 mn ch = do
  -- With -hi the ROOT is the only module read as source; everything else comes
  -- from an interface.  So every value the program can name is an identifier
  -- somewhere in the root's text, and an interface signature whose name is not
  -- there cannot be referenced by anything.  Reading it costs a parse and an
  -- elaboration and buys nothing: compiling Fib, 213 of the 216 signatures on
  -- offer are for names it never says.
  -- Over-approximate on purpose -- this is the token set, not the resolved
  -- names -- and a miss is a compile error, never a wrong program.
  flags <- if useHi flags0 then addWantNames flags0 mn else return flags0
  res@((_, ds), _, _) <- compile flags mn ch
  when (verbosityGT flags 4) $
    putStrLn $ "combinators:\n" ++ showLDefs ds
  return res

-- Names the desugarer puts in that the source never spells.
-- Names the compiler writes into a program that the program never says.
-- These are not guessed: they are the identifier strings that appear in
-- MicroHs.Deriving, which is what generates the code that uses them -- a
-- derived Show calls showParen and showString, a derived Eq calls (==) -- plus
-- the ones the desugarer inserts for ranges, comprehensions and literals.
desugarNames :: [String]
desugarNames =
  [ "enumFrom", "enumFromTo", "enumFromThen", "enumFromThenTo"
  , "concatMap", "++", "fromInteger", "fromRational", "negate"
  , ">>=", ">>", "return", "fail", "ifThenElse", "error", "undefined"
  -- from MicroHs.Deriving
  , "compare", "fromEnum", "toEnum", "maxBound", "minBound", "showsPrec"
  , "showParen", "showString", "readPrec", "typeRep", "mkTyCon", "mkTyConApp"
  , "getField", "setField", "recSelError" ]

-- Filtering an interface is only sound when the ROOT is the only module read
-- as source, because then its text is the whole vocabulary of the program.
-- That holds exactly when every import already has an interface -- so CHECK
-- it, rather than assume it as this first did: with a source fallback in the
-- graph, Data.Function could not find primSeq, a word that is in
-- Data.Function and nowhere in the root.
--
-- The check only stats the imports; it does not read them.  Deciding it by
-- tokenizing the whole transitive source tree, which is what this did next,
-- cost 22.8M reductions against the 301k the compile itself takes -- the
-- test was 77 times the work it was guarding.
addWantNames :: Flags -> IdentModule -> IO Flags
addWantNames flags mn = do
  msrc <- readModulePath flags ".hs" mn
  case msrc of
    Nothing -> return flags
    Just (_, file) -> do
      let imps = importsOf file
      -- An import with no interface is read as source, and its vocabulary is
      -- not in the root's text.  Rather than give up filtering -- which costs
      -- four times on the benchmark -- take that module's tokens too.  In a
      -- build that goes in dependency order the only ones are `{-# SOURCE #-}`
      -- imports, whose .hs-boot files are signatures and nothing else.
      srcToks <- sourceToks flags [] imps
      ok <- allHaveIface flags imps
      if False then return flags
       else do
        -- A name one interface RE-EXPORTS has to survive filtering in the
        -- interface it comes FROM, or that module's export list cannot be
        -- satisfied: Data.Functor exports unzip, which is defined elsewhere,
        -- and dropping it there makes reading Data.Functor fail.  So every
        -- export list in the interface closure counts as a use.
        -- Names an interface MENTIONS -- in its export list or in the import
        -- lists it copied -- have to survive filtering in the interface they
        -- come from.  `Numeric.Show` says `import Text.Show(showChar)`, and
        -- dropping showChar from Text.Show makes reading Numeric.Show fail.
        -- Unlike the export case this cannot be decided locally: the provider
        -- is read BEFORE the module that names it, so the closure is scanned
        -- up front.  Only header and import lines are tokenized, not bodies.
        -- Deduplicated once, here.  This is every token OCCURRENCE across the
        -- whole import closure otherwise -- tens of thousands of them -- and
        -- filterInterface builds a lookup map from it for EVERY interface it
        -- reads.  Left as-is, three tiny modules took six minutes.
        -- Built ONCE, here.  filterInterface used to build it from a list for
        -- every interface it read, and with the whole closure's tokens in that
        -- list three tiny modules took six minutes.
        return flags{ wantSet = M.fromList [ (mkIdent w, ())
                                           | w <- tokensOf file ++ srcToks ++ desugarNames ] }

-- Tokens of the modules that will be READ AS SOURCE: those with no interface
-- beside them.  The walk stops at any module that has one -- that module is
-- filtered, not read, so its words are not ours to satisfy.
sourceToks :: Flags -> [IdentModule] -> [IdentModule] -> IO [String]
sourceToks _ _ [] = return []
sourceToks flags seen (m:ms)
  | m `elem` seen = sourceToks flags seen ms
  | otherwise = do
      mhi <- readModulePath flags ".hi.hs" m
      case mhi of
        -- Has an interface: it is filtered rather than read, so only what it
        -- MENTIONS matters -- its export list, and the import lists it copied,
        -- since a name it imports by name has to survive in the interface it
        -- comes from.  Then keep walking: a module deeper in still counts, and
        -- stopping here is what hid Numeric.Show's `import Text.Show(showChar)`
        -- and had showChar filtered out from under it.
        Just (_, f) -> do
          rest <- sourceToks flags (m:seen) (ms ++ importsOf f)
          return (concatMap tokensOf (headerOf f ++ importLinesOf f) ++ rest)
        Nothing -> do
          mb <- readModulePath flags ".hs-boot" m
          msrc <- case mb of
                    Just r  -> return (Just r)
                    Nothing -> readModulePath flags ".hs" m
          case msrc of
            Nothing -> sourceToks flags (m:seen) ms
            Just (_, f) -> do
              rest <- sourceToks flags (m:seen) (ms ++ importsOf f)
              return (tokensOf f ++ rest)

-- Every line of every import declaration, continuation lines included.  An
-- import list can run over several lines, and taking only the lines that begin
-- with `import` cuts it off mid-list.
importLinesOf :: String -> [String]
importLinesOf file = imps (lines file)
  where
    imps [] = []
    imps (l:ls) | isPrefixOf "import " l =
                    case cont (bal l) ls of
                      (more, rest) -> (l : more) ++ imps rest
                | otherwise = imps ls
    -- The counter needs its type written down: nothing here forces it, and
    -- mhs does not default the Num constraint the way GHC does.
    cont :: Int -> [String] -> ([String], [String])
    cont n ls | n <= 0 = ([], ls)
    cont _ [] = ([], [])
    cont n (l:ls) = case cont (n + bal l) ls of
                      (more, rest) -> (l : more, rest)
    bal :: String -> Int
    bal = foldr (\ c a -> case c of { '(' -> a + 1 ; ')' -> a - 1 ; _ -> a }) 0

-- the module header: from `module` through the line that says `where`
headerOf :: String -> [String]
headerOf file = up (dropWhile (not . isPrefixOf "module ") (lines file))
  where
    up [] = []
    up (l:ls) | hasWhere l = [l]
              | otherwise  = l : up ls
    hasWhere l = any (isPrefixOf "where") (tls l)
    tls [] = [[]]
    tls xs@(_:r) = xs : tls r

dedupSorted :: [String] -> [String]
dedupSorted (a:b:r) | a == b = dedupSorted (b:r)
dedupSorted (a:r) = a : dedupSorted r
dedupSorted [] = []

allHaveIface :: Flags -> [IdentModule] -> IO Bool
allHaveIface _ [] = return True
allHaveIface flags (m:ms) = do
  mhi <- readModulePath flags ".hi.hs" m
  case mhi of
    Nothing -> return False
    Just _  -> allHaveIface flags ms

-- The imported module names, read off the text -- no parse needed.
importsOf :: String -> [IdentModule]
importsOf file =
  [ mkIdent nm
  | l0 <- lines file, l <- semis l0, isPrefixOf "import " l
  , w : _ <- [dropWhile (== "qualified") (words (dropPragma (drop 7 l)))]
  , let nm = takeWhile isModChar w        -- `import Data.Function(on)` names Data.Function
  , not (null nm), isUpper (head nm)
  , not (takesNothing (drop (length nm) (concat (words (drop 7 l))))) ]
  where
    isModChar c = isAlphaNum c || c == '.' || c == '_' || c == '\''
    -- `import Prelude()` takes NOTHING from Prelude, so Prelude contributes no
    -- name to this module and cannot make a filtered interface come up short.
    -- It is also how every program in the suite disables the implicit Prelude,
    -- so treating it as a source dependency turns the filter off everywhere.
    takesNothing ('(':')':_) = True
    takesNothing _           = False
    -- Two imports can share a line: every module of the compiler opens with
    -- `import Prelude(); import MHSPrelude`.  Reading only the first of them
    -- sees `Prelude()`, decides the line brings in nothing, and never learns
    -- about MHSPrelude at all -- so its vocabulary is missing and every
    -- interface gets filtered against a set that has never heard of it.
    semis l = case break (== ';') l of
                (a, ';':r) -> a : semis (dropWhile (== ' ') r)
                (a, _)     -> [a]
    -- `import {-# SOURCE #-} Control.Error` names Control.Error.  Reading the
    -- first word instead gives `{-#`, and the whole subtree behind that import
    -- drops out of the closure -- which is how Control.Exception.Internal came
    -- to be filtered against a vocabulary that had never seen it.
    dropPragma ('{':'-':'#':r) = dropPragma (afterEnd r)
    dropPragma (c:cs) = c : dropPragma cs
    dropPragma [] = []
    afterEnd ('#':'-':'}':r) = r
    afterEnd (_:r) = afterEnd r
    afterEnd [] = []

-- Every identifier and every operator in the text.  Crude on purpose: it only
-- has to be a superset of what the module can refer to.
tokensOf :: String -> [String]
tokensOf = go
  where
    go [] = []
    go s@(c:cs)
      | isAlpha c || c == '_' = let (w, r) = span isIdentCh s in w : go r
      | isOperChar c          = let (w, r) = span isOperChar s in w : go r
      | otherwise             = go cs
    isIdentCh c = isAlphaNum c || c == '_' || c == '\'' || c == '.'

-- Drop the signatures for names the program never mentions.  Only lines of the
-- form `name :: type` are candidates; everything else -- header, imports,
-- data, class, fixity -- is kept, because those carry the module's structure
-- and are what the kept signatures are written in terms of.
filterInterface :: M.Map () -> String -> String
filterInterface want file | M.null want = file
filterInterface want file = unlines (filter keep (lines file))
  where
    inWant n = isJust (M.lookup (mkIdent n) want)
    -- A name this interface EXPORTS stays, whether or not the program says it.
    -- Another module may re-export it -- Data.Functor hands on unzip -- and
    -- that module's export list can only be satisfied from here.  The test is
    -- local: if A re-exports X from B then B exports X, so X is in B's own
    -- header, which is the text in hand.
    exportSet = M.fromList [ (mkIdent w, ()) | l <- headerOf file, w <- tokensOf l ]
    isExported n = isJust (M.lookup (mkIdent n) exportSet)
    -- An operator's signature is always kept.  The desugarer reaches for
    -- operators the source never spells -- a literal pattern becomes a use of
    -- (==), a range becomes enumFromTo -- and the sites that do it are spread
    -- across the compiler, so a list of them would be a list to get wrong.
    -- There are 23 of them in NanoPrelude and none in Primitives, so keeping
    -- them all costs almost nothing and removes the whole class of mistake.
    keep l = case sigName l of
               Nothing -> True
               Just n  -> isOper n || inWant n || isExported n
    isOper (c:_) = isOperChar c
    isOper []    = False
    sigName l =
      case span (/= ' ') l of
        (n@(_:_), ' ':':':':':' ':_) | not (isSpace (head l)) -> Just (unparen n)
        _ -> Nothing
    unparen ('(':r) | not (null r), last r == ')' = init r
    unparen n = n

compileMany :: Flags -> [IdentModule] -> Cache -> IO Cache
compileMany flags mns ach = snd <$> runStateIO (mapM_ (compileModuleCached flags ImpNormal) mns) ach

getCached :: Flags -> IO Cache
getCached flags | not (readCache flags) = return emptyCache
getCached flags = do
  mcash <- loadCached mhsCacheName
  case mcash of
    Nothing ->
      return emptyCache
    Just cash -> do
      when (loading flags || verbosityGT flags 0) $
        putStrLn $ "Loading saved cache " ++ show mhsCacheName
      validateCache flags cash

maybeSaveCache :: Flags -> Cache -> IO ()
maybeSaveCache flags cash =
  when (writeCache flags) $ do
    when (verbosityGT flags 0) $
      putStrLn $ "Saving cache " ++ show mhsCacheName
    -- This causes all kinds of chaos, probably because there
    -- will be equality tests of unevaluated thunks.
    -- () <- seq (rnfNoErr cash) (return ())
    saveCache mhsCacheName cash

compile :: Flags -> IdentModule -> Cache -> IO ((IdentModule, [LDef]), Symbols, Cache)
compile flags nm ach = do
  let comp = do
--XXX        modify $ addBoot $ mkIdent "Control.Exception.Internal"      -- the compiler generates references to this module
        r <- compileModuleCached flags ImpNormal nm
        -- Using a boot module obliges a whole-program build to go back and
        -- compile the real module: its definitions have to end up in the one
        -- output.  Compiling to an OBJECT does not owe that.  The importer
        -- needs the boot module's types, which it has, and reaches the
        -- definitions with a link the linker resolves -- the real module is
        -- compiled in its own invocation, exactly as a forward declaration in
        -- C does not drag in the other translation unit.
        -- Left in, it drags a large part of the library in from source:
        -- Control.Exception.Internal takes 11s to compile and then spends
        -- over ten minutes on Data.Typeable behind it.
        let loadBoots = do
              bs <- if sepComp flags then return [] else gets getBoots
              case bs of
                [] -> return ()
                bmn:_ -> do
                  when (verbosityGT flags 0) $
                    liftIO $ putStrLn $ "compiling used boot module " ++ showIdent bmn
                  _ <- compileModuleCached flags ImpNormal bmn
                  loadBoots
        loadBoots
        loadDependencies flags
        return r
  ((cm, syms, t), ch) <- runStateIO comp ach
  when (verbosityGT flags 0) $
    putStrLn $ "total import time     " ++ padLeft 6 (show t) ++ "ms"
  return ((tModuleName cm, concatMap tBindingsOf $ cachedModules ch), syms, ch)

-- Compile a module with the given name.
-- If the module has already been compiled, return the cached result.
-- If the module has not been compiled, first try to find a source file.
-- If there is no source file, try loading a package.
compileModuleCached :: Flags -> ImpType -> IdentModule -> CM (TModule [LDef], Symbols, Time)
compileModuleCached flags impt mn = do
  phaseMsg flags ("module " ++ showIdent mn)
  cash <- get
  case lookupCache mn cash of
    Nothing ->
      case impt of
        ImpBoot -> compileBootModule flags mn
        ImpNormal -> do
          when (verbosityGT flags 1) $ do
            ms <- gets getWorking
            putStrLnInd $ "[from " ++ head (map showIdent ms ++ ["-"]) ++ "]"
            putStrInd $ "importing " ++ showIdent mn
          -- An import is satisfied by the interface beside the object when
          -- there is one: it carries the types the importer needs and none of
          -- the bodies, which is the whole point of not recompiling it.  If
          -- there is no interface we compile the module from source as before,
          -- so a tree that has never been built still builds.
          -- The module being compiled is never satisfied this way -- it is the
          -- one we are here to compile.  Nothing is on the working list yet
          -- exactly when this is that module.
          atRoot <- gets (null . getWorking)
          mres <- liftIO $ do
                    mhi0 <- if useHi flags && not atRoot
                            then readModulePath flags ".hi.hs" mn
                            else return Nothing
                    let mhi = fmap (\ (fn, f) -> (fn, filterInterface (wantSet flags) f)) mhi0
                    case mhi of
                      Just r  -> return (Just r)
                      Nothing -> readModulePath flags ".hs" mn
          case mres of
            Nothing -> do
              (fn, res) <- findPkgModule flags mn
              liftIO $ when (verbosityGT flags 1) $ do
                when (verbosityGT flags 2) $
                  putStrLn $ " (" ++ show fn ++ ")"
                putStrLn ""
              return res
            Just (pathfn, file) -> do
              liftIO $ when (verbosityGT flags 1) $ do
                when (verbosityGT flags 2) $
                  putStrLn $ " (" ++ show pathfn ++ ")"
                putStrLn ""
              modify $ addWorking mn
              compileModule flags ImpNormal mn pathfn file
    Just tm -> do
      when (verbosityGT flags 1) $
        putStrLnInd $ "importing cached " ++ showIdent mn
      return (tm, noSymbols, 0)

putStrLnInd :: String -> CM ()
putStrLnInd msg = do
  ms <- gets getWorking
  liftIO $ putStrLn $ map (const ' ') ms ++ msg

putStrInd :: String -> CM ()
putStrInd msg = do
  ms <- gets getWorking
  liftIO $ putStr $ map (const ' ') ms ++ msg

noSymbols :: Symbols
noSymbols = (stEmpty, stEmpty)

compileBootModule :: Flags -> IdentModule -> CM (TModule [LDef], Symbols, Time)
compileBootModule flags mn = do
  when (verbosityGT flags 0) $
    putStrLnInd $ "importing boot " ++ showIdent mn
  mres <- liftIO (readModulePath flags ".hs-boot" mn)
  case mres of
    Nothing -> error $ "boot module not found: " ++ showIdent mn
    Just (pathfn, file) -> do
      modify $ addBoot mn
      compileModule flags ImpBoot mn pathfn file

-- Progress, one line per phase per module.  The driver's own -v output only
-- appears once a module is finished, which on a slow target is indistinguishable
-- from a hang; these print as each phase COMPLETES, and each one forces the
-- structure it is reporting on so the message cannot run ahead of the work.
-- Walk a lazy list, forcing an element at a time and reporting every `every`.
-- Only useful where the producer really is incremental -- reading a file byte
-- by byte, abstracting one binding at a time -- which is exactly where the long
-- silences are.  A whole-structure force (typecheck) cannot be reported this
-- way and is not.
countProgress :: forall a . String -> Int -> [a] -> IO ()
countProgress what every xs = go (1::Int) xs
  where
    go _ []     = return ()
    go k (y:ys) = do
      () <- return (y `seq` ())
      when (k `rem` every == 0) $ putStrLn ("[mhs]   " ++ show k ++ " " ++ what)
      go (k+1) ys

phaseMsg :: Flags -> String -> CM ()
phaseMsg flags m = when (verbosityGT flags 0) $ liftIO $ putStrLn ("[mhs] " ++ m)

compileModule :: Flags -> ImpType -> IdentModule -> FilePath -> String -> CM (TModule [LDef], Symbols, Time)
compileModule flags impt mn pathfn file = do
  t1 <- liftIO getTimeMilli
  liftIO $ countProgress "bytes" 32 file
  phaseMsg flags ("read " ++ pathfn ++ " (" ++ show (length file) ++ " bytes)")
  phaseMsg flags ("lex+parse " ++ pathfn ++ " ...")
  phaseMsg flags ("  md5 " ++ pathfn)
  mchksum <- liftIO (md5File pathfn)
  let chksum :: MD5CheckSum
      chksum = fromMaybe undefined mchksum
  when (verbosityGT flags 4) $
    liftIO $ putStrLn $ "parsing: " ++ pathfn
  let pmdl = parseDie pTop pathfn file
  when (verbosityGT flags 4) $
    liftIO $ putStrLn $ "parsed:\n" ++ show pmdl
  let mdl0@(EModule mnn mexps defs0) = addPreludeImport pmdl
      lazyFcns = [ i | LazyP is <- defs0, i <- is ]   -- {-# LAZY f .. #-} names
      defs = [ d | d <- defs0, not (isLazyP d) ]       -- strip the pragma defs
      isLazyP (LazyP _) = True
      isLazyP _         = False
      mdl = EModule mnn mexps defs                      -- pragma-free module for typecheck
  
  -- liftIO $ putStrLn $ showEModule mdl
  -- liftIO $ putStrLn $ showEDefs defs
  -- TODO: skip test when mn is a file name
  when (isNothing (getFileName mn) && mn /= mnn) $
    error $ "module name does not agree with file name: " ++ showIdent mn ++ " " ++ showIdent mnn
  let
    specs = [ s | Import s <- defs ]
    imported = [ (boot, m) | ImportSpec boot _ m _ _ <- specs ]
  t2 <- liftIO getTimeMilli
  phaseMsg flags ("parsed " ++ showIdent mn ++ ", " ++ show (length imported) ++ " imports")
  (impMdls, _, tImps) <- fmap unzip3 $ mapM (uncurry $ compileModuleCached flags) imported

  t3 <- liftIO getTimeMilli
  phaseMsg flags ("typecheck " ++ showIdent mn ++ " ...")
  glob <- gets getCacheTables
  let
    (tmdl, glob', syms) = typeCheck glob impt (zip specs impMdls) mdl
  modify $ setCacheTables glob'
  phaseMsg flags ("typechecked " ++ showIdent mn ++ ", "
                  ++ show (length (tBindingsOf tmdl)) ++ " bindings")
  phaseMsg flags ("desugar " ++ showIdent mn ++ " ...")
  -- Not for a module that IS an interface: it already has one, and the name
  -- would come out `Data/Semigroup.hi.hi.hs`.
  when (sepComp flags && not (isSuffixOf ".hi.hs" pathfn)) $
    liftIO $ writeInterface pathfn file defs tmdl
  when (verbosityGT flags 3) $
    liftIO $ putStrLn $ "type checked:\n" ++ showTModule showEDefs tmdl ++ "-----\n"
  () <- when False $ do               -- Always forcing is slower.  Maybe add a flag?
          mrnf tmdl `seq` return ()
  let
    -- --morph / --mmorph: classify recursion schemes and mark morphism heads
    -- BEFORE desugar (named `case` is still present here).  --morph emits the
    -- explicit (functor, algebra) instruction form; --mmorph the Mendler form.
    tmdl' | morph flags  = setBindings tmdl (morphProgram Explicit mnn (tBindingsOf tmdl))
          | mmorph flags = setBindings tmdl (morphProgram Mendler  mnn (tBindingsOf tmdl))
          | otherwise    = tmdl
    dmdl = desugar flags tmdl'
  () <- return $ rnfErr $ tBindingsOf dmdl
  phaseMsg flags ("desugared " ++ showIdent mn)
  t4 <- liftIO getTimeMilli
  -- liftIO $ putStrLn $ "desugared:\n" ++ show (tBindingsOf dmdl) -- show lambda terms
  let
    opMoved =
      let
        -- arithmetic primitives map straight to their ALU opcode.
        arithOp i
          | i == mkIdent "NanoPrelude.+"      = Just "+"
          | i == mkIdent "NanoPrelude.-"      = Just "-"
          | i == mkIdent "NanoPrelude.*"      = Just "*"
          -- negate is not a fun primitive; NanoPrelude defines it as 0 - x
          -- (the binary sub the ALU already has), so it never reaches codegen.
          | otherwise = Nothing
        -- the six numeric comparisons are KappaMutor branch instructions: a
        -- branch compares its two Int operands and selects one of two target
        -- arguments.  In an if/&&/||/case the two arms are already Scott-applied
        -- to the comparison (>=4 args) -> emit a direct branch to the arms.  As a
        -- value (<=3 args) the branch selects between the False/True constructors,
        -- yielding a proper Bool ADT (correct when shared, stored, or passed to a
        -- higher-order function).
        cmpOp i
          | i == mkIdent "NanoPrelude.==" = Just "=="
          | i == mkIdent "NanoPrelude./=" = Just "/="
          | i == mkIdent "NanoPrelude.<"  = Just "<"
          | i == mkIdent "NanoPrelude.<=" = Just "<="
          | i == mkIdent "NanoPrelude.>"  = Just ">"
          | i == mkIdent "NanoPrelude.>=" = Just ">="
          | otherwise = Nothing
        -- Scott Bool constructors: False = \a b -> a ; True = \a b -> b.
        cFalse = Lam (mkIdent "_brA") (Lam (mkIdent "_brB") (Var (mkIdent "_brA")))
        cTrue  = Lam (mkIdent "_brA") (Lam (mkIdent "_brB") (Var (mkIdent "_brB")))
        spineApp (App f a) as = spineApp f (a : as)
        spineApp h         as = (h, as)
        -- the comparison as a Bool value, possibly applied to `extra` args.
        mkBool op x y extra =
          foldl App (foldl App (Lit (LPrim op)) [x, y, cFalse, cTrue]) extra
        cmpBranch op as =
          case as of
            (a:b:t1:t2:rest) -> foldl App (Lit (LPrim op)) (a:b:t1:t2:rest)  -- arms supplied -> direct branch
            [a, b]           -> mkBool op a b []                             -- value -> Bool ADT
            [a, b, c]        -> mkBool op a b [c]                            -- Bool applied to one arg
            [a]              -> let y = mkIdent "_cmpY"
                                in Lam y (mkBool op a (Var y) [])
            []               -> let x = mkIdent "_cmpX"; y = mkIdent "_cmpY"
                                in Lam x (Lam y (mkBool op (Var x) (Var y) []))
        subOps :: Exp -> Exp
        subOps e0 =
          let (h, as) = spineApp e0 []
              as'     = map subOps as
          in case h of
               Var i
                 | Just op <- cmpOp i   -> cmpBranch op as'
                 | Just p  <- arithOp i -> foldl App (Lit (LPrim p)) as'
                 | otherwise            -> foldl App (Var i) as'
               Lam x b                  -> foldl App (Lam x (subOps b)) as'
               _                        -> foldl App h as'
      in
        map (\(i, e) -> (i, subOps e)) (tBindingsOf dmdl)
  let
    -- abstraction strategy per binding: --lazy makes everything lazy; otherwise a
    -- per-function {-# LAZY f #-} pragma (lazyFcns, collected above) opts individual
    -- functions into full-laziness; the default is compileExpSc (count-minimal). The
    -- pragma names match on the unqualified base, so compare on the ident string tail.
    dropQual = reverse . takeWhile (/= '.') . reverse
    lazyBases = map (dropQual . unIdent) lazyFcns
    isLazy i  = useLazy flags || dropQual (unIdent i) `elem` lazyBases
    -- fun backend only: splice each binding the program mentions exactly once
    -- into its single use site BEFORE abstraction, so the combinator that ends
    -- up next to it is unified with it rather than reaching it through a link.
    -- Doing this after abstraction merely deletes a block boundary and leaves
    -- the dispatch count alone, which is what it did when tried there.
    preInlined = if rvfun flags && optLevel flags > 0
                 then inlineOnce (if optLevel flags >= 2 then 128 else 8) opMoved
                 else opMoved
    -- -O3: let the compiler pick the abstraction per binding.  Full laziness
    -- is a big win on a driver loop -- one pragma on Knuthbendix's
    -- completionLoop is worth 7% -- and a loss almost everywhere else, so the
    -- choice belongs per function rather than per program.  Abstract both
    -- ways and keep the smaller term; fewer nodes is fewer cells and, on the
    -- evidence, fewer dispatches.
    -- A binding is in a recursive group if it can reach itself through the
    -- module's call graph.  Self-recursion is not enough: Knuthbendix's
    -- completionLoop recurses through completionWith, so testing only its own
    -- free variables missed the one function worth 7%.
    --
    -- The walk carries a VISITED set.  Without one it revisits shared callees
    -- combinatorially and the compile does not finish -- which is what the
    -- first version did on Taut.
    callees = M.fromList [ (i, freeVars e) | (i, e) <- preInlined ]
    out j = maybe [] id (M.lookup j callees)
    inRecGroup i = go [] (out i)
      where
        go _    []       = False
        go seen (j : js)
          | j == i             = True
          | elem j seen        = go seen js
          | otherwise          = go (j : seen) (out j ++ js)
    pickAbs i e
      -- Only a SELF-RECURSIVE binding is considered.  Full laziness pays by
      -- hoisting work out of a body that runs many times, so the beneficiary
      -- is a driver loop -- Knuthbendix's completionLoop, Ordlist's boolList.
      -- Offering it to every binding picked wrongly for Taut, where a
      -- statically smaller abstraction turned out dynamically dearer.
      | optLevel flags >= 3, not (isLazy i), inRecGroup i
      , let sc = compileOpt False e
      , let lz = compileOpt True e
      = if scCount lz < scCount sc then lz else sc
      | otherwise = compileOpt (isLazy i) e
    -- --grin: keep the desugared lambda bindings (after the per-module
    -- inlineOnce); the whole-program pipeline (MicroHs.Grin) and bracket
    -- abstraction both run at link, in mainCompile.  A {-# LAZY f #-}
    -- pragma is module-local information, so it rides to link as a body
    -- marker (wrapLazy) and is honored there.
    scGraphs  | grin flags = [ (i, if isLazy i then wrapLazy e else e)
                             | (i, e) <- preInlined ]
              | otherwise  = [ (i, pickAbs i e) | (i, e) <- preInlined ]
  -- the back end, stage by stage: inlining feeds abstraction, abstraction feeds
  -- codegen, and on this target each is minutes rather than milliseconds
  phaseMsg flags ("inlined " ++ showIdent mn ++ ", " ++ show (length preInlined) ++ " defs")
  phaseMsg flags ("abstract " ++ showIdent mn ++ " (opt level "
                  ++ show (optLevel flags) ++ ") ...")
  let
    -- An interface has no bindings worth having.  Its dummy bodies exist only
    -- so each exported name is something; the real definitions are in the
    -- object, and the importer emits a link to them.  Desugaring and
    -- abstracting them is pure waste -- two hundred of them for a program that
    -- uses five.
    isInterface = isSuffixOf ".hi.hs" pathfn
    cmdl = setBindings dmdl (if isInterface then [] else scGraphs)
  () <- return $ rnfErr $ tBindingsOf cmdl  -- This makes execution slower, but speeds up GC
  liftIO $ countProgress "defs abstracted" 25 (tBindingsOf cmdl)
  phaseMsg flags ("abstracted " ++ showIdent mn ++ ", "
                  ++ show (length (tBindingsOf cmdl)) ++ " combinator defs")
--  () <- return $ rnfErr syms same for this, but worse total time
  t5 <- liftIO getTimeMilli

  let tParse = t2 - t1
      tTCDesug = t4 - t3
      tAbstract = t5 - t4
      tThis = tParse + tTCDesug + tAbstract
      tImp = sum tImps

  when (verbosityGT flags 4) $
    (liftIO $ putStrLn $ "desugared:\n" ++ showTModule showLDefs dmdl)
  when (verbosityGT flags 0) $
    putStrLnInd $ "importing done " ++ showIdent mn ++ ", " ++ show tThis ++
            "ms (" ++ show tParse ++ " + " ++ show tTCDesug ++ " + " ++ show tAbstract ++ ")"
  when (loading flags && mn /= mkIdent "Interactive" && not (verbosityGT flags 0)) $
    liftIO $ putStrLn $ "loaded " ++ showIdent mn

  case impt of
    ImpNormal -> modify $ workToDone (cmdl, map snd imported, chksum)
    ImpBoot   -> return ()

  return (cmdl, syms, tThis + tImp)

addPreludeImport :: EModule -> EModule
addPreludeImport (EModule mn es ds) =
  EModule mn es ds'
  where ds' = ps' ++ nps
        (ps, nps) = partition isImportPrelude ds
        isImportPrelude (Import (ImportSpec _ _ i _ _)) = i == idPrelude
        isImportPrelude _ = False
        idPrelude = mkIdent "Prelude"
        idBuiltin = mkIdent "Mhs.Builtin"
        idB = mkIdent builtinMdl
        iblt = Import $ ImportSpec ImpNormal True idBuiltin (Just idB) Nothing
        ps' =
          case ps of
            [] -> [Import $ ImportSpec ImpNormal False idPrelude Nothing Nothing,      -- no Prelude imports, so add 'import Prelude'
                   iblt]                                                               -- and 'import Mhs.Builtin as @B'
            [Import (ImportSpec ImpNormal False _ Nothing (Just (False, [])))] -> []   -- exactly 'import Prelude()', so import nothing
            _ -> iblt : ps                                                             -- keep the given Prelude imports, add Builtin

-------------------------------------------

validateCache :: Flags -> Cache -> IO Cache
validateCache flags acash = execStateIO (mapM_ (validate . fst) fdeps) acash
  where
    fdeps = getImportDeps acash                           -- forwards dependencies
    deps = invertGraph fdeps                              -- backwards dependencies
    invalidate :: IdentModule -> CM ()
    invalidate mn = do
      b <- gets $ isJust . lookupCache mn
      when b $ do
        -- It's still in the cache, so invalidate it, and all modules that import it
        when (verbosityGT flags 1) $
          liftIO $ putStrLn $ "invalidate cached " ++ show mn
        modify (deleteFromCache mn)
        mapM_ invalidate $ fromMaybe [] $ M.lookup mn deps
    validate :: IdentModule -> CM ()
    validate mn = do
      cash <- get
      case lookupCacheChksum mn cash of
        Nothing -> return () -- no longer in the cache, so just ignore.
        Just chksum -> do
          mhdl <- liftIO $ findModulePath flags ".hs" mn
          case mhdl of
            Nothing ->
              -- Cannot find module, so invalidate it
              invalidate mn
            Just (_, h) -> do
              cs <- liftIO $ md5Handle h
              liftIO $ hClose h
              when (cs /= chksum) $
                -- bad checksum, invalidate module
                invalidate mn

-- Take a graph in adjencency list form and reverse all the arrow.
-- Used to invert the import graph.
invertGraph :: [(IdentModule, [IdentModule])] -> M.Map [IdentModule]
invertGraph = foldr ins M.empty
  where
    ins :: (IdentModule, [IdentModule]) -> M.Map [IdentModule] -> M.Map [IdentModule]
    ins (m, ms) g = foldr (\ n -> M.insertWith (++) n [m]) g ms

------------------

-- Is the module name actually a file name?
getFileName :: IdentModule -> Maybe String
getFileName m | ".hs" `isSuffixOf` s = Just s
              | otherwise = Nothing
  where s = unIdent m

readModulePath :: Flags -> String -> IdentModule -> IO (Maybe (FilePath, String))
readModulePath flags suf mn | Just fn <- getFileName mn = do
  mh <- openFileM fn ReadMode
  case mh of
    Nothing -> errorMessage (getSLoc mn) $ "File not found: " ++ show fn
    Just h -> readRest fn h

                            | otherwise = do
  mh <- findModulePath flags suf mn
  case mh of
    Nothing -> do
      mhc <- findModulePath flags (suf ++ "c") mn  -- look for hsc file
      case mhc of
        Nothing -> return Nothing
        Just (_fn, _h) -> undefined  -- hsc2hs no implemented yet
    Just (fn, h) -> readRest fn h
  where readRest fn h = do
          hasCPP <- hasLangCPP fn
          file <-
            if hasCPP || doCPP flags then do
              hClose h
              runCPPTmp flags fn
            else
              hGetContents h
          return (Just (fn, file))

-- Check if the file contains {-# LANGUAGE ... CPP ... #-}
-- XXX This is pretty hacky and not really correct.
hasLangCPP :: FilePath -> IO Bool
hasLangCPP fn = do
  let scanFor _ [] = False
      scanFor s ('{':'-':'#':cs) = scanFor' s cs
      scanFor _ ('m':'o':'d':'u':'l':'e':_) = False
      scanFor s (_:cs) = scanFor s cs
      scanFor' _ [] = False
      scanFor' s ('#':'-':'}':cs) = scanFor s cs
      scanFor' s (' ':cs) | s `isPrefixOf` cs = True
      scanFor' s (_:cs) = scanFor' s cs
  scanFor "cpp" . map toLower <$> readFile fn

moduleToFile :: IdentModule -> FilePath
moduleToFile mn = map (\ c -> if c == '.' then pathSeparator else c) (unIdent mn)

findModulePath :: Flags -> String -> IdentModule -> IO (Maybe (FilePath, Handle))
findModulePath flags suf mn = do
  let
    fn = moduleToFile mn <.> suf
  openFilePath (paths flags) fn

-- Each candidate is announced before it is tried: on a target where an open is
-- a real SD transaction, a search over several directories is minutes of
-- silence, and which candidate it is stuck on is the whole diagnosis.
openFilePath :: [FilePath] -> FilePath -> IO (Maybe (FilePath, Handle))
openFilePath adirs fileName =
  case adirs of
    [] -> return Nothing
    dir:dirs -> do
      let
        path = dir </> fileName
      putStrLn ("[mhs] try " ++ path)
      mh <- openFileM path ReadMode
      case mh of
        Nothing -> openFilePath dirs fileName -- If opening failed, try the next directory
        Just hdl -> do
          putStrLn ("[mhs] open " ++ path)
          return (Just (path, hdl))

runCPPTmp :: Flags -> FilePath -> IO String
runCPPTmp flags infile = do
  (fn, h) <- openTmpFile "mhscpp.hs"
  runCPP flags infile fn
  file <- hGetContents h
  removeFile fn
  return file

mhsDefines :: [String]
mhsDefines =
  [ "-D__MHS__"                                 -- We are MHS
  ]

runCPP :: Flags -> FilePath -> FilePath -> IO ()
runCPP flags infile outfile = do
  mcpphs <- lookupEnv "MHSCPPHS"
  datadir <- getMhsDir
  let cpphs = fromMaybe "cpphs" mcpphs
      mhsIncludes = ["-I" ++ datadir </> "src/runtime"]
      args = mhsDefines ++ mhsIncludes ++ map quote (cppArgs flags)
      cmd = cpphs ++ " --strip " ++ unwords args ++ " " ++ infile ++ " -O" ++ outfile
      quote s = "'" ++ s ++ "'"
  when (verbosityGT flags 1) $
    putStrLn $ "Run cpphs: " ++ show cmd
  callCommand cmd

packageDir :: String
packageDir = "packages"
packageSuffix :: String
packageSuffix = ".pkg"
packageTxtSuffix :: String
packageTxtSuffix = ".txt"

-- Find the module mn in the package path, and return it's contents.
findPkgModule :: Flags -> IdentModule -> CM (FilePath, (TModule [LDef], Symbols, Time))
findPkgModule flags mn = do
  t0 <- liftIO getTimeMilli
  let fn = moduleToFile mn <.> packageTxtSuffix
  mres <- liftIO $ openFilePath (pkgPath flags) fn
  case mres of
    Just (pfn, hdl) -> do
      -- liftIO $ putStrLn $ "findPkgModule " ++ pfn
      pkg <- liftIO $ hGetContents hdl  -- this closes the handle
      let dir = take (length pfn - length fn) pfn  -- directory where the file was found
      loadPkg flags (dir ++ packageDir </> pkg)
      cash <- get
      case lookupCache mn cash of
        Nothing -> error $ "package does not contain module " ++ pkg ++ " " ++ showIdent mn
        Just t -> do
          t1 <- liftIO getTimeMilli
          return (pfn, (t, noSymbols, t1 - t0))
    Nothing ->
      errorMessage (getSLoc mn) $
        "Module not found: " ++ show mn ++
        "\nsearch path=" ++ show (paths flags) ++
        "\npackage path=" ++ show (pkgPath flags)

loadPkg :: Flags -> FilePath -> CM ()
loadPkg flags fn = do
  when (loading flags || verbosityGT flags 0) $
    liftIO $ putStrLn $ "Loading package " ++ fn
  pkg <- liftIO $ readSerialized fn
  when (pkgCompiler pkg /= mhsVersion) $
    error $ "Package compile version mismatch: file=" ++ fn ++ ", package=" ++ pkgCompiler pkg ++ ", compiler=" ++ mhsVersion
  modify $ addPackage fn pkg

-- XXX add function to find&load package from package name

-- Load all packages that we depend on, but that are not already loaded.
loadDependencies :: Flags -> CM ()
loadDependencies flags = do
  loadedPkgs <- gets getPkgs
  let deps = concatMap pkgDepends loadedPkgs
      loaded = map pkgName loadedPkgs
      deps' = [ p | (p, _v) <- deps, p `notElem` loaded ]
  if null deps' then
    return ()
   else do
    mapM_ (loadDeps flags) deps'
    loadDependencies flags  -- loadDeps can add new dependencies

loadDeps :: Flags -> IdentPackage -> CM ()
loadDeps flags pid = do
  mres <- liftIO $ openFilePath (pkgPath flags) (packageDir </> unIdent pid <.> packageSuffix)
  case mres of
    Nothing -> error $ "Cannot find package " ++ showIdent pid
    Just (pfn, hdl) -> do
      liftIO $ hClose hdl
      loadPkg flags pfn

-- The interface that travels with an object: what an importer needs in order
-- to typecheck against this module, and nothing else.  Its declarations are
-- reproduced as they were written and every exported value gets its type from
-- the typechecker -- which covers the ones the source left unsigned -- with a
-- body that is only there to give the name something to be.  The bodies live
-- in the object; nobody ever compiles these.
--
-- It is ordinary Haskell because mhs already prints types and already parses
-- them.  A format of its own would need a writer and a reader that do not
-- exist, which is what the serialized cache needed and why it never worked
-- here: IO.serialize lives in the C runtime, not the bare one.
writeInterface :: FilePath -> String -> [EDef] -> TModule a -> IO ()
writeInterface pathfn file defs tmdl = do
  let keep (Fcn _ _)     = False   -- bodies belong to the object
      keep (PatBind _ _) = False
      keep (Sign _ _)    = False   -- re-emitted below, from the typechecker
      keep (Import _)    = False   -- copied verbatim instead; see below
      keep _             = True
      -- A class or instance keeps its SHAPE and loses its code.  The bodies
      -- are definitions like any other and belong in the object: a default
      -- method is compiled to a top level `m$dflt` whose signature is exported
      -- below, and an instance's dictionary is a value the importer links to.
      -- They also print as expressions, and an expression printed for display
      -- is not source -- an Int literal comes out `##0`, which nothing reads.
      shape (Class ctx lhs fds ms) = Class ctx lhs fds (filter isSigB ms)
      shape (Instance c _)         = Instance c []
      shape d                      = d
      isSigB (Sign _ _)     = True
      isSigB (DfltSign _ _) = True
      isSigB _              = False
      -- Imports are reproduced from the SOURCE TEXT, not from the printer.
      -- `import Prelude()` -- import the module, take nothing from it -- comes
      -- back out of showEDefs as `import Prelude`, which takes everything and
      -- turns NanoPrelude's import graph into a cycle.
      -- An import list can run over several lines.  Taking only the lines that
      -- START with `import` truncates it mid-list -- `import Data.List(map,`
      -- and then nothing -- so continuation lines come too, until the
      -- parentheses balance.
      -- A module imported QUALIFIED puts nothing in scope unqualified, but the
      -- types in the signatures below print unqualified -- `IntMap`, not
      -- `M.IntMap` -- so the interface also imports those modules plainly.
      -- Without it every signature mentioning such a type is an undefined type.
      importLines = importLinesOf file ++ plainForQualified (importLinesOf file)
      plainForQualified ls =
        [ "import " ++ nm
        | l <- ls, isPrefixOf "import qualified " l
        , let nm = takeWhile isModCh (dropWhile (== ' ') (drop 17 l))
        , not (null nm) ]
      isModCh c = isAlphaNum c || c == '.' || c == '_' || c == '\''
      -- The module header is copied verbatim as well, for the same reason: it
      -- carries the export list, and a module that re-exports a name from
      -- elsewhere -- NanoPrelude hands on Primitives' Int -- loses it if the
      -- header is regenerated as a bare `module M where`.
      headerLines = upToWhere (dropWhile (not . isPrefixOf "module ") (lines file))
      upToWhere [] = []
      upToWhere (l:ls) | isWhere l = [l]
                       | otherwise = l : upToWhere ls
      isWhere l = any (isPrefixOf "where") (tails' l)
      tails' [] = [[]]
      tails' xs@(_:r) = xs : tails' r
      paren i = let n = unIdent i
                in if null n || isAlpha_ (head n) then n else "(" ++ n ++ ")"
      isAlpha_ c = isAlpha c || c == '_'
      -- Only what this module DEFINES gets a signature.  A re-exported name --
      -- NanoPrelude hands on Data.List_Type's concatMap -- is already reached
      -- through the copied header and imports; declaring it here too would
      -- define a second, different concatMap and every use of it is ambiguous.
      -- Names the compiler generates for itself -- `showsPrec$dflt`, the
      -- `inst$...` dictionaries -- cannot be WRITTEN: `$` is an operator
      -- character, so `showsPrec$dflt :: t` reads as an application and then a
      -- stray `::`.  They are also not something an importer names; it reaches
      -- a dictionary by linking to the object, and what it needs to KNOW is
      -- the class and instance declarations, which are above.
      -- ... but only an IDENTIFIER with an embedded `$` is generated.  `$>`,
      -- `<$>` and `$!` are ordinary operators a module really does export.
      -- A real operator is operator characters throughout -- `$>`, `<$>`, `$!`.
      -- A generated name MIXES them with letters (`==$dflt`) or is an
      -- identifier with a `$` in it (`showsPrec$dflt`).  Either way it cannot
      -- be written down, and nothing needs to write it: an importer reaches a
      -- default or a dictionary by linking to the object.
      writable (ValueExport i _) =
        case unIdent i of
          n -> all isOperChar n || not (elem '$' n)
      ownDefn (ValueExport _ (Entry qi _)) =
        case qi of
          EVar qn -> qualOf qn == tModuleName tmdl
          _       -> True
      sigOf (ValueExport i (Entry _ t)) =
        -- The binding is back, on the SAME line as the signature.  A
        -- signature alone does not DEFINE the name, so a module that lists its
        -- exports by name -- `module Control.Exception.Internal(throw, ...)` --
        -- rejects it: undefined export.  Only a header that re-exports the
        -- whole module survives without bindings, which is why NanoPrelude did
        -- and this did not.  One line keeps the two together for the filter,
        -- which drops signatures the program cannot use and must not leave a
        -- body behind when it does.
        paren i ++ " :: " ++ dropMetaKinds (showEType t)
                ++ "; " ++ paren i ++ " = " ++ paren i
      hifn = takeWhileEnd (dropEnd 3 pathfn)
      txt = "-- interface generated by mhs -c; the definitions are in the object\n"
            ++ (if null headerLines
                then "module " ++ showIdent (tModuleName tmdl) ++ " where\n"
                else unlines headerLines)
            ++ unlines importLines
            ++ dropEmptyForall (showEDefs (map shape (filter keep defs))) ++ "\n"
            ++ unlines (map sigOf (filter (\ v -> ownDefn v && writable v) (tValueExps tmdl)))
  -- Forced before the file is opened.  writeFile evaluates the string AS it
  -- writes, so anything that throws part way leaves a truncated -- usually
  -- empty -- interface on disk, and an empty interface is a module with no
  -- name: every importer then fails with `module name does not agree with
  -- file name: MiniPrelude Main`, thirteen of them from one bad write.
  length txt `seq` writeFile hifn txt
  where
    dropEnd n xs = take (length xs - n) xs
    takeWhileEnd f = f ++ ".hi.hs"
    -- A constructor with no type variables prints as `forall . C`, which does
    -- not parse back.  A real forall always has binders between the keyword
    -- and the dot, so the empty one is unambiguous to drop.
    dropEmptyForall ('f':'o':'r':'a':'l':'l':' ':'.':' ':cs) = dropEmptyForall cs
    dropEmptyForall (c:cs) = c : dropEmptyForall cs
    dropEmptyForall [] = []
    -- A forall binder prints with the kind the checker inferred for it, and an
    -- unresolved kind metavariable prints as `_a56`, which is not a kind any
    -- reader knows.  Drop the annotation and let the kind be inferred again --
    -- it was inferred in the first place.
    -- `(a::_a56)` becomes `a`: the parens have to go with the annotation,
    -- because a parenthesised binder is exactly the form that REQUIRES a kind.
    dropMetaKinds ('(':cs)
      | (v@(_:_), ':':':':'_':'a':r) <- span isVarChar cs
      , (_, ')':r') <- span isDigit r
      = v ++ dropMetaKinds r'
    dropMetaKinds (c:cs) = c : dropMetaKinds cs
    dropMetaKinds [] = []
    isVarChar c = isAlphaNum c || c == '_' || c == '\''

getMhsDir :: IO FilePath
getMhsDir = do
  md <- lookupEnv "MHSDIR"
  case md of
    Just d -> return d
    Nothing -> getDataDir

-- Bindings mentioned exactly once across the whole module are spliced into
-- their single use.  Recursive bindings are left alone -- inlining one builds
-- an infinite term -- and so is main, which nothing mentions.
-- The candidate map, the use census and the free-variable list are each built
-- once per module and then consulted once per binding, from inside the walk.
-- Count-minimal abstraction does not keep a local binding shared across a
-- lambda, so under it every one of those consultations REBUILDS all three, and
-- the pass goes quadratic in the size of the module: measured on the reducer,
-- forty definitions cost 40.3M reductions here and 95k with sharing kept, and
-- self-compilation stopped finishing.  This is what full laziness is for.
{-# LAZY inlineOnce #-}
inlineOnce :: Int -> [(Ident, Exp)] -> [(Ident, Exp)]
inlineOnce cap ds = [ (i, sub e) | (i, e) <- ds ]
  where
    bump m i = M.insert i (maybe (1::Int) (+1) (M.lookup i m)) m
    uses = foldl bump M.empty (concatMap (freeVars . snd) ds)
    isAtom (App _ _) = False
    isAtom (Lam _ _) = False
    isAtom _         = True
    -- Splicing a big body makes a big term, and a big term abstracts into a
    -- combinator that no longer fits the word -- six holes, arity seven -- so
    -- combineSc gives up to addSc, which spends more than the link it
    -- replaced.  Small bodies stay inside the limit and fuse.
    esize :: Exp -> Int
    esize (App f a) = 1 + esize f + esize a
    esize (Lam _ b) = 1 + esize b
    esize _         = 1
    -- Work safety.  A body that is an App is a THUNK: as a binding it is
    -- evaluated once and its value is shared by everyone who names it.
    -- Splicing it into an occurrence that sits UNDER A LAMBDA moves that
    -- evaluation inside the lambda, so it is redone on every entry -- one
    -- shared evaluation becomes one per call.  Measured on the reducer: a
    -- 33.5k-reduction value named once inside a ten-element map cost 322k
    -- spliced and 34.4k left alone.  In the compiler itself the occurrence is
    -- a map lookup per binding, so the whole module went quadratic and
    -- self-compilation stopped finishing.  Atoms and lambdas are VALUES --
    -- already in normal form, no work to lose -- so they splice anywhere.
    -- This is the same rule inlineSingle in GenRomCommon already follows.
    isThunk (App _ _) = True
    isThunk _         = False
    underLam (Lam _ b) = freeVars b
    underLam (App f a) = underLam f ++ underLam a
    underLam _         = []
    lamUsed = M.fromList [ (i, ()) | i <- concatMap (underLam . snd) ds ]
    workSafe i e = not (isThunk e) || isNothing (M.lookup i lamUsed)
    cand = M.fromList [ (i, e) | (i, e) <- ds
                      , isAtom e || (M.lookup i uses == Just 1 && esize e <= cap
                                     && workSafe i e)
                      , not (elem i (freeVars e)) ]
    -- Each candidate is resolved ONCE, and the resolved forms refer to each
    -- other, so a chain costs one pass over the program rather than one per
    -- occurrence.  Expanding at every occurrence instead -- which is what this
    -- did -- is multiplicative in the chain length: compiling nofib's Lambda
    -- at -O2 ran for fifteen minutes without finishing.
    resolved = M.fromList [ (i, sub e) | (i, e) <- ds, isJust (M.lookup i cand) ]
    sub (Var i) = case M.lookup i resolved of
                    Just e  -> e
                    Nothing -> Var i
    sub (App f a) = App (sub f) (sub a)
    sub (Lam x b) = Lam x (sub b)
    sub e         = e

-- combinators in a term.  A dispatch is what the machine spends, so this is
-- a closer proxy for reductions than the node count is -- comparing total
-- size picked the wrong abstraction for Taut.
scCount :: Exp -> Int
scCount (App f a) = scCount f + scCount a
scCount (Lam _ b) = scCount b
scCount (Sc _ _ _) = 1
scCount _         = 0

-- nodes in a term, for comparing two abstractions of the same binding
expSize :: Exp -> Int
expSize (App f a) = 1 + expSize f + expSize a
expSize (Lam _ b) = 1 + expSize b
expSize _         = 1
