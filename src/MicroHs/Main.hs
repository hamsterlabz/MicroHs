-- Copyright 2023 Lennart Augustsson
-- See LICENSE file for full license.
{-# OPTIONS_GHC -Wno-unused-do-bind -Wno-unused-imports #-}
module MicroHs.Main(main) where
import Prelude(); import MHSPrelude
import Data.Char
import Data.List
import Data.Version
import Control.Monad
import Control.Applicative
import Data.Maybe
import System.Environment
import MicroHs.Abstract(compileOpt)
import MicroHs.Compile
import MicroHs.CompileCache
import MicroHs.Exp(isLazyMarked, stripLazy)
import MicroHs.FunGc(funGcAsm)
import MicroHs.Grin(grinProgram)
import MicroHs.ExpPrint
import MicroHs.FFI
import MicroHs.Flags
import MicroHs.Ident
import MicroHs.Lex(readInt)
import MicroHs.List
import MicroHs.Package
import MicroHs.Translate
import MicroHs.TypeCheck(tModuleName)
import MicroHs.Interactive
import MicroHs.MakeCArray
import MicroHs.FunBlobs
import MicroHs.FunBlobs64
import MicroHs.GenRomMem
import System.Cmd
import System.Process(callCommand)
import System.Exit
import System.FilePath
import System.Directory
import System.IO
import System.IO.Serialize
import System.IO.TimeMilli
import Compat
import MicroHs.Instances() -- for GHC
import MicroHs.TargetConfig
import Paths_MicroHs(getDataDir)

main :: IO ()
main = do
  -- Bring-up markers: on a target where a phase can take minutes, "no output
  -- yet" and "hung" look identical.  These bracket the three things that run
  -- before any source file is touched.
  putStrLn "[mhs] start"
  args <- getArgs
  putStrLn ("[mhs] argv ok, " ++ show (length args) ++ " args")
  dir <- getMhsDir
  putStrLn ("[mhs] mhsdir " ++ dir)
  dataDir <- getDataDir
  putStrLn ("[mhs] datadir " ++ dataDir)
  case args of
   ["--version"] -> putStrLn $ "MicroHs (Fun), version " ++ mhsVersion ++ " [rvfun: kiskadee fun-ISA backend, --bare]"
   ["--numeric-version"] -> putStrLn mhsVersion
   _ -> do
    let dflags = (defaultFlags dir){ pkgPath = pkgPaths }
        (flags, mdls, rargs) = decodeArgs dflags [] args
        pkgPaths | dir == dataDir && dir /= "." = [takeDirectory $ takeDirectory $ takeDirectory dataDir]   -- This is a bit ugly
                 | otherwise                    = []                        -- No package search path
    when (verbosityGT flags 1) $
      putStrLn $ "flags = " ++ show flags
    case listPkg flags of
      Just p -> mainListPkg flags p
      Nothing ->
        case buildPkg flags of
          Just p -> mainBuildPkg flags p mdls
          Nothing ->
            if installPkg flags then mainInstallPackage flags mdls else
            withArgs rargs $ do
              case mdls of
                []  -> mainInteractive flags
                [s] -> mainCompile flags (mkIdentSLoc (SLoc "command-line" 0 0) s)
                _   -> error usage

-- the fun runtime's assembly blobs live in MicroHs.FunBlobs

usage :: String
usage = "Usage: mhs [--version] [--numeric-version] [-v] [-q] [-l] [-s] [-r] [-C[R|W]] [-XCPP] [-DDEF] [-IPATH] [-T] [-z] [-iPATH] [-oFILE] [-a[PATH]] [-L[PATH|PKG]] [-PPKG] [-Q PKG [DIR]] [-tTARGET] [-optc OPTION] [MODULENAME..|FILE]\n  --bare: --rvfun + a bare-metal _start (csrw heap, jal main, tohost)"

decodeArgs :: Flags -> [String] -> [String] -> (Flags, [String], [String])
decodeArgs f mdls [] = (f, mdls, [])
decodeArgs f mdls (arg:args) =
  case arg of
    "--"        -> (f, mdls, args)              -- leave arguments after -- for any program we run
    "-v"        -> decodeArgs f{verbose = verbose f + 1} mdls args
    "-q"        -> decodeArgs f{verbose = -1} mdls args
    "-r"        -> decodeArgs f{runIt = True} mdls args
    "-l"        -> decodeArgs f{loading = True} mdls args
    "-s"        -> decodeArgs f{speed = True} mdls args
    "-CR"       -> decodeArgs f{readCache = True} mdls args
    "-CW"       -> decodeArgs f{writeCache = True} mdls args
    "-C"        -> decodeArgs f{readCache=True, writeCache = True} mdls args
    "--perf"    -> decodeArgs f{perfReport = True} mdls args
    "-T"        -> decodeArgs f{useTicks = True} mdls args
    "-XCPP"     -> decodeArgs f{doCPP = True} mdls args
    "-z"        -> decodeArgs f{compress = True} mdls args
    -- Two things are chosen, and they are independent: what the code runs ON
    -- (--bare / --thin / --linux) and what it is made OF (--march).
    "--bare"  -> decodeArgs f{rvfun = True, rvfunIO = True, osTarget = Bare} mdls args
    "--thin"  -> decodeArgs f{rvfun = True, rvfunIO = True, osTarget = Thin} mdls args
    "--linux" -> decodeArgs f{rvfun = True, rvfunIO = True, osTarget = Linux} mdls args
    -- rvfun is rv32imafz-xfun and emits fn.* instructions; rv64 is plain
    -- riscv64, where the same atoms come out as macros.
    "--march=rvfun" -> decodeArgs f{rvfun = True, rvfunIO = True, rvfun32 = True, rvfun64g = False} mdls args
    "--march=rv64"  -> decodeArgs f{rvfun = True, rvfunIO = True, rvfun32 = False, rvfun64g = True} mdls args
    -- -S stops at the assembly; without it mhs assembles and links itself.
    "-S" -> decodeArgs f{asmOnly = True} mdls args
    "--rv32"     -> decodeArgs f{rvfun32 = True} mdls args   -- old name for --march=rvfun
    -- Target a stock RV64GC host: no xfun extension.  Every fn.* instruction
    -- becomes an assembly macro with the same operational semantics as the
    -- reducer in qemu (target/riscv/fun_helper.c) and clash-rvfun (Core/Fun.hs),
    -- and the special CSRs become globals.
    "-rv64g"     -> decodeArgs f{rvfun = True, rvfunIO = True, rvfun64g = True} mdls args   -- old name for --march=rv64
    "--lazy"    -> decodeArgs f{useLazy = True} mdls args   -- full-laziness abstraction (default: count-min Sc); per-fn {-# LAZY f #-} also opts in
    "--single-entry" -> decodeArgs f{useSE = True} mdls args   -- mark arg-linear combinators (combi bit3) for update-avoidance
    "--grin"    -> decodeArgs f{grin = True} mdls args   -- whole-program optimization at link (GRIN discipline); abstraction moves to link
    "--morph"   -> decodeArgs f{morph = True} mdls args   -- explicit-instruction morphisms: fn.cata (functor)(alg), fn.ana (functor)(coalg)
    "--mmorph"  -> decodeArgs f{mmorph = True} mdls args   -- Mendler-style morphisms: fn.<scheme> (\_rec \y. body)
    "--baby"    -> decodeArgs f{baby = True} mdls args   -- generational heap: emit fn_baby, the build links a nursery
    "--yrec"    -> decodeArgs f{yrec = True} mdls args   -- top-level recursion through Y: foo = Y (\self -> body[foo:=self])
    -- -O<n>: inlining before abstraction.  0 none; 1 atoms and small
    -- single-use bindings; 2 every single-use binding whatever its size.
    -- 2 wins on small programs and loses on large ones -- a spliced body that
    -- overflows the combinator word makes the unifier fall back to addSc,
    -- which spends more than the link it saved -- so it is opt-in.
    "-c"        -> decodeArgs f{sepComp = True} mdls args   -- compile this module to its own object
    "-hi"       -> decodeArgs f{useHi = True} mdls args   -- compile this module to its own object
    "-O"        -> decodeArgs f{optLevel = 1} mdls args
    "-O0"       -> decodeArgs f{optLevel = 0} mdls args
    "-O1"       -> decodeArgs f{optLevel = 1} mdls args
    "-O2"       -> decodeArgs f{optLevel = 2} mdls args
    "-O3"       -> decodeArgs f{optLevel = 3} mdls args
    "-Q"        -> decodeArgs f{installPkg = True} mdls args
    "-o" | s : args' <- args
                -> decodeArgs f{output = s} mdls args'
    "-optc" | s : args' <- args
                -> decodeArgs f{cArgs = cArgs f ++ [s]} mdls args'
    '-':'i':[]  -> decodeArgs f{paths = []} mdls args
    '-':'i':s   -> decodeArgs f{paths = paths f ++ [s]} mdls args
    '-':'o':s   -> decodeArgs f{output = s} mdls args
    '-':'t':s   -> decodeArgs f{target = s} mdls args
    '-':'D':_   -> decodeArgs f{cppArgs = cppArgs f ++ [arg]} mdls args
    '-':'I':_   -> decodeArgs f{cppArgs = cppArgs f ++ [arg]} mdls args
    '-':'P':s   -> decodeArgs f{buildPkg = Just s} mdls args
    '-':'a':[]  -> decodeArgs f{pkgPath = []} mdls args
    '-':'a':s   -> decodeArgs f{pkgPath = pkgPath f ++ [s]} mdls args
    '-':'L':s   -> decodeArgs f{listPkg = Just s} mdls args
    '-':_       -> error $ "Unknown flag: " ++ arg ++ "\n" ++ usage
    _ | arg `hasTheExtension` ".c" || arg `hasTheExtension` ".o" || arg `hasTheExtension` ".a"
                -> decodeArgs f{cArgs = cArgs f ++ [arg]} mdls args
      | otherwise
                -> decodeArgs f (mdls ++ [arg]) args


readTargets :: Flags -> FilePath -> IO [Target]
readTargets flags dir = do
  let tgFilePath = dir </> "targets.conf"
  exists <- doesFileExist tgFilePath
  if not exists 
     then return []
     else do
       tgFile <- readFile tgFilePath
       case parseTargets tgFilePath tgFile of
         Left e -> do
           putStrLn $ "Cannot parse " ++ tgFilePath
           when (verbose flags > 0) $
             putStrLn e
           return []
         Right tgs -> do
           when (verbose flags > 0) $
             putStrLn $ "Read targets file. Possible targets: " ++ show 
               [tg | Target tg _ <- tgs]
           return tgs

readTarget :: Flags -> FilePath -> IO TTarget
readTarget flags dir = do
  targets <- readTargets flags dir
  compiler <- lookupEnv "CC"
  conf <- lookupEnv "MHSCONF"
  let dConf = "unix-" ++ show _wordSize
  case findTarget (target flags) targets of
    Nothing -> do
      when (verbose flags > 0) $
        putStrLn $ unwords ["Could not find", target flags, "in file"]
      return TTarget { tName = "default"
                     , tCC   = fromMaybe "cc" compiler 
                     , tConf = fromMaybe dConf conf
                     }
    Just (Target n cs) -> do
      when (verbose flags > 0) $
        putStrLn $ "Found target: " ++ show cs
      return TTarget { tName = n
                     , tCC   = fromMaybe "cc"  $ compiler <|> lookup "cc"   cs
                     , tConf = fromMaybe dConf $ conf     <|> lookup "conf" cs
                     }


mainBuildPkg :: Flags -> String -> [String] -> IO ()
mainBuildPkg flags namever amns = do
  when (verbose flags > 0) $
    putStrLn $ "Building package " ++ namever
  let mns = map mkIdent amns
  cash <- compileMany flags mns emptyCache
  let mdls = getCompMdls cash
      (name, ver) = splitNameVer namever
      (exported, other) = partition ((`elem` mns) . tModuleName) mdls
      pkgDeps = map (\ p -> (pkgName p, pkgVersion p)) $ getPkgs cash
      pkg = Package { pkgName = mkIdent name
                    , pkgVersion = ver
                    , pkgCompiler = mhsVersion
                    , pkgExported = exported
                    , pkgOther = other
                    , pkgTables = getCacheTables cash
                    , pkgDepends = pkgDeps }
  --print (map tModuleName $ pkgOther pkg)
  t1 <- getTimeMilli
  when (verbose flags > 0) $
    putStrLn $ "Writing package " ++ namever ++ " to " ++ output flags
  writeSerializedCompressed (output flags) (forcePackage pkg)
  t2 <- getTimeMilli
  when (verbose flags > 0) $
    putStrLn $ "Compression time " ++ show (t2 - t1) ++ " ms"  

splitNameVer :: String -> (String, Version)
splitNameVer s =
  case span (\ c -> isDigit c || c == '.') (reverse s) of
    (rver, '-':rname) | is@(_:_) <- readVersion (reverse rver) -> (reverse rname, makeVersion is)
    _ -> error $ "package name not of the form name-version:" ++ show s
  where readVersion = map readInt . words . map (\ c -> if c == '.' then ' ' else c)

mainListPkg :: Flags -> FilePath -> IO ()
mainListPkg flags "" = mainListPackages flags
mainListPkg flags pkg = do
  ok <- doesFileExist pkg
  if ok then
    mainListPkg' flags pkg
   else do
    mres <- openFilePath (pkgPath flags) (packageDir </> pkg <.> packageSuffix)
    case mres of
      Nothing -> error $ "Cannot find " ++ pkg
      Just (pfn, hdl) -> do
        hClose hdl
        mainListPkg' flags pfn

mainListPkg' :: Flags -> FilePath -> IO ()
mainListPkg' _flags pkgfn = do
  pkg <- readSerialized pkgfn
  putStrLn $ "name: " ++ showIdent (pkgName pkg)
  putStrLn $ "version: " ++ showVersion (pkgVersion pkg)
  putStrLn $ "compiler: mhs-" ++ pkgCompiler pkg
  putStrLn $ "depends: " ++ unwords (map (\ (i, v) -> showIdent i ++ "-" ++ showVersion v) (pkgDepends pkg))

  let list = mapM_ (putStrLn . ("  " ++) . showIdent . tModuleName)
  putStrLn "exposed-modules:"
  list (pkgExported pkg)
  putStrLn "other-modules:"
  list (pkgOther pkg)

mainCompile :: Flags -> Ident -> IO ()
mainCompile flags mn = do
  t0 <- getTimeMilli
  (cash, (rmn, allDefs)) <- do
    cash <- getCached flags
    (rds, _, cash') <- compileCacheTop flags mn cash
    maybeSaveCache flags cash'
    return (cash', rds)

  t1 <- getTimeMilli
  let
    mainName = qualIdent rmn (mkIdent "main")
  -- --grin: the bindings are still desugared lambdas (Compile skipped
  -- abstraction).  Run the whole-program pipeline over the pruned program,
  -- then bracket abstraction, here at link.
  allDefsO <-
    if grin flags then do
      let (dsG, stats) = grinProgram (optLevel flags) mainName allDefs
          -- a {-# LAZY #-} pragma arrives as a body marker (see Compile);
          -- classify by the top-level marker, strip markers everywhere,
          -- then abstract per def with the chosen strategy
          dsA = map (\ (i, e) -> (i, compileOpt (useLazy flags || isLazyMarked e)
                                                (stripLazy e))) dsG
      mapM_ putStrLn stats
      return dsA
    else
      return allDefs
  let
    cmdl = (mainName, allDefsO)
    numDefs = length allDefsO
  when (verbosityGT flags 0) $
    putStrLn $ "top level defns:      " ++ padLeft 6 (show numDefs)
  when (verbosityGT flags 2) $
    mapM_ (\ (i, e) -> putStrLn $ showIdent i ++ " = " ++ toStringP e "") allDefsO
  if runIt flags then do
    let
      prg = translateAndRun cmdl
--    putStrLn "Run:"
--    writeSerialized "ser.comb" prg
    prg
--    putStrLn "done"
   else do
    t2 <- getTimeMilli
    when (verbosityGT flags 0) $
      putStrLn $ "final pass            " ++ padLeft 6 (show (t2-t1)) ++ "ms"

    when (speed flags) $ do
      let fns = filter (isSuffixOf ".hs") $ map (slocFile . slocIdent) $ cachedModuleNames cash
      locs <- sum . map (length . lines) <$> mapM readFile fns
      putStrLn $ show (locs * 1000 `div` (t2 - t0)) ++ " lines/s"

    -- Decode what to do:
    --  * file ends in .comb: write combinator file
    --  * file ends in .c: write C version of combinator
    --  * otherwise, write C file and compile to a binary with cc
    let outFile = output flags
    if rvfun flags then do
      -- emit the `fun` assembly listing only; gas (-march=rv32i_xfun) + ld
      -- produce the runnable ELF, which the KappaMutor model loads (--elf).
      let pn = takeWhile (/= '.') outFile
          -- boxed ints + prim/effect RV32 blobs: the boxed fun_core. Enabled by
          -- --rvfun-linux (Linux _start) OR --rvfun-box (bare SoC, no _start).
          boxInts = True   -- fun backend is always boxed; plain --rvfun (fun-ALU) removed
          libMod = if sepComp flags then Just rmn else Nothing
          (_, asmTxt) = genRomMem pn (rvfunIO flags) boxInts (useSE flags) (rvfun32 flags) (rvfun64g flags) libMod cmdl
          -- --rvfun-box: emit the rv32 prim/cmp/effect blobs (the boxed fun_core
          -- needs them) but NOT the Linux _start — the SoC's startup_rv0.S calls
          -- main. --rvfun-linux emits the full Linux prologue.
          -- --baby: the marker the build looks for with nm.  It carries the
          -- REQUESTED nursery size so the size lives with the image that
          -- wants it rather than in the build script.  It sits in .text, so
          -- it is inside the static graph region the collector walks -- the
          -- same place fn_gc_trig lives, and the collector skips both.
          babyMark | baby flags = [ "  .balign 4", "  .globl fn_baby"
                                  , "fn_baby:", "  .word 0x00080000" ]
                   | otherwise  = []
          boxPrelude = unlines ("  .text" : (if rvfun64g flags
                                             then primBlobs64 ++ cmpBlobs64 ++ effBlobs64
                                             else primBlobs (rvfun32 flags) ++ cmpBlobs ++ effBlobs True)
                                ++ babyMark
                                ++ ["  .globl _fungraph_start", "_fungraph_start:"])
          -- -rv64g --bare builds the runtime object the same way the rvfun
          -- target does: the blobs plus a _start, linked ahead of a graph
          -- compiled with -rv64g alone.
          prelude | rvfun64g flags && osTarget flags == Linux
                              = unlines (start64S ++ primBlobs64 ++ cmpBlobs64
                                         ++ effBlobs64
                                         ++ ["  .globl _fungraph_start", "_fungraph_start:"])
                  -- thinOS calls the entry as a function and hands it the
                  -- api table; there are no syscalls to make.
                  | osTarget flags == Thin  = thinStartS (perfReport flags)
                  | osTarget flags == Linux = linuxStartS (rvfunIO flags) (rvfun32 flags)
                  -- --bare: no _start (the SoC's own startup calls us), but the
                  -- graph still elinks the primitives, so their blobs must be
                  -- here or nothing defines them.
                  | otherwise        = boxPrelude
          -- mark the end of the graph so _start can pre-fault/COW the whole
          -- text+graph region (see linuxStartS).
          -- The end of the graph text, exported: the GC reads it to know what
          -- region to pre-fault, so it has to be a global symbol, not a label
          -- only this file can see.
          suffix  = if osTarget flags == Linux
                    then "\n    .globl _funtext_end\n_funtext_end:\n" else ""
      -- The assembler needs the fn.* MACRO definitions, which are text and
      -- live beside the runtime in the tree.  With -S that is the caller's
      -- problem and we stop at the listing; without it mhs assembles and links
      -- the ELF itself, and an executable does not want an extension.
      -- Find the runtime assets by looking for one of them.  getMhsDir answers
      -- "." in a non-cabal build and the assembler resolves .include against
      -- ITS working directory, so a relative answer points at wherever the user
      -- happened to be.  The search paths already name the tree (-i.../lib), so
      -- their parents are the candidates.
      mdir0 <- getMhsDir
      -- only the rv64g listing .includes the runtime .S files, and only the
      -- rv64g link needs its objects.  Looking the directory up unconditionally
      -- made every other target fail wherever the MicroHs tree is not present
      -- -- which is exactly the case when mhs is the one running on the target.
      gcObjThin <- if osTarget flags == Thin
                   then findGcObj (mdir0 : map takeDirectory (paths flags) ++ ["."])
                   else return ""
      rtdir <- if rvfun64g flags
                 then findRuntimeDir (mdir0 : map takeDirectory (paths flags) ++ ["."])
                 else return ""
      let incs | rvfun64g flags =
                   unlines [ "    .option norvc"
                           , "    .equ FN_SPINE_CAP, 1048576"
                           , "    .include \"" ++ rtdir ++ "/fun_macros.S\""
                           , "    .include \"" ++ rtdir ++ "/fun_combi.S\""
                           , "    .include \"" ++ rtdir ++ "/fun_combi_rt.S\"" ]
               -- the graph is hand-encoded words and combi tables: relaxing
               -- them is never valid. mhs passes -mno-relax when it assembles
               -- the file itself; say it in the listing too, for whoever else
               -- assembles it.
               | rvfun32 flags = "    .option norelax\n"
               | otherwise = ""
          -- --bare bundles the collector into the listing (after the graph),
          -- exactly where the separately-compiled fun_gc.o used to land in
          -- link order.  The runtime is ONE artifact: build scripts no longer
          -- compile or link a GC object.  Linux/Thin keep their own flows.
          gcAsm   = if osTarget flags == Bare then funGcAsm else ""
          asmText = incs ++ prelude ++ asmTxt ++ suffix ++ gcAsm
      when (verbosityGT flags 0) $
        putStrLn ("[mhs] combinators: " ++ show (length (snd cmdl)) ++ " defs")
      if asmOnly flags then do
        -- force the listing before announcing it: genRomMem is lazy, so a
        -- message printed ahead of the force would claim work not yet done
        when (verbosityGT flags 0) $ putStrLn "[mhs] codegen ..."
        -- the listing is produced lazily; walking it in chunks turns codegen
        -- from one long silence into visible progress
        when (verbosityGT flags 0) $ codegenProgress 4096 asmText
        when (verbosityGT flags 0) $
          putStrLn ("[mhs] codegen done, " ++ show (length asmText) ++ " chars")
        writeFile (pn ++ ".S") asmText
        when (verbosityGT flags 0) $ putStrLn ("[mhs] wrote " ++ pn ++ ".S")
       else do
        writeFile (pn ++ ".S") asmText
        -- rv64 assembles with whatever `as` is to hand (the build host IS
        -- riscv64); rv32imaf_xfun needs a cross assembler that knows the
        -- extension, so look for one rather than assume `as` is it.
        pfx <- if rvfun64g flags then return "" else findRv32Prefix
        let march | rvfun64g flags = "rv64g"
                  | otherwise      = "rv32imaf_zicsr_zifencei_xfun"
            gcObj = rtdir ++ "/build/fun_gc.o"
            -- The xfun target is rv32, so its collector is the same C built
            -- for that machine.  It was not being linked at all: the comment
            -- below used to say the collector lived in the blobs, which it
            -- does not.  An xfun binary had no collector, so a program that
            -- filled its heap simply stopped.
            -- fun_gc32.o is that same C built for rv32.  It is NOT linked
            -- yet, and cannot be until the runtime provides what it reads:
            -- fn_sv, fn_ss, fn_rsp and fn_frame are the SOFTWARE spine, and
            -- fn_hp a memory global.  On the xfun machine the spine is
            -- hardware and hp is CSR 0x7c0, so the collector has no way to
            -- reach its roots.  Until that is bridged an xfun binary has no
            -- collector, and a program that fills its heap stops dead
            -- (heapHalt in the RTL writes 0x7CF to tohost).
            gcObj32 = rtdir ++ "/build/fun_gc32.o"
            asCmd = pfx ++ "as -march=" ++ march ++ " -mno-relax " ++ pn ++ ".S -o " ++ pn ++ ".o"
            -- thinOS loads the app at 0x80400000 and enters _astart; it has no
            -- loader that relocates, so the address is fixed here (ld/app.ld in
            -- the thinOS tree says the same).  _heap is where our heap starts,
            -- straight after the image.
            -- fun_gc.o is the rv64g collector, written in C against that
            -- target's memory globals.  On the xfun target the collector is in
            -- the blobs and there is no object to link.
            -- The collector is a WEAK ref in the blobs, so an image without it
            -- links fine and simply never collects -- which is what the thin
            -- target did, and it died of heap exhaustion parsing an 8 KB
            -- module.  Link it when it is there.
            ldCmd | osTarget flags == Thin =
                      pfx ++ "ld -T " ++ pn ++ ".ld " ++ pn ++ ".o " ++ gcObjThin
                          ++ " -o " ++ pn
                  | rvfun64g flags =
                      pfx ++ "ld -no-pie " ++ pn ++ ".o " ++ gcObj ++ " -o " ++ pn
                  | otherwise =
                      pfx ++ "ld -no-pie " ++ pn ++ ".o -o " ++ pn
        if osTarget flags == Thin
          then writeFile (pn ++ ".ld") (unlines
                 [ "/* generated by mhs --thin: thinOS application layout */"
                 , "ENTRY(_astart)"
                 , "SECTIONS {"
                 , "  . = 0x80400000;"
                 -- _fungraph_start.._fungraph_end is the STATIC GRAPH, and
                 -- roots() rewrites every word in it.  The collector's own
                 -- object must therefore sit OUTSIDE that range: left inside,
                 -- its machine code gets fwd()'d word by word, and the first
                 -- word that happens to look like a link into from-space is
                 -- rewritten -- the collector corrupts itself.
                 , "  .text : ALIGN(4) { *(.text.init)"
                 , "                     *(EXCLUDE_FILE(*fun_gc32.o) .text)"
                 , "                     *(EXCLUDE_FILE(*fun_gc32.o) .text.*)"
                 , "                     _fungraph_end = .;"
                 , "                     *fun_gc32.o(.text .text.*)"
                 , "                     *(.rodata .rodata.*) *(.srodata .srodata.*) }"
                 , "  .data : ALIGN(4) { _sdata = .; *(.data .data.*) *(.sdata .sdata.*) _edata = .; }"
                 , "  __global_pointer$ = _sdata + 0x800;"
                 , "  .bss (NOLOAD) : ALIGN(4) { _sbss = .; *(.bss .bss.*) *(.sbss .sbss.*)"
                 , "                             *(COMMON) _ebss = .; }"
                 , "  . = ALIGN(8);"
                 , "  _end = .;"
                 , "  _heap = .;"
                 -- The collector needs to know where its two semispaces end,
                 -- where the C stack it scans as roots begins, and where to
                 -- report a fatal.  Layout below the r-stack (0xBFFE0000):
                 -- heap up to _heap_end, then the app C stack growing DOWN
                 -- from _estack.
                 , "  _heap_end = 0xBFF00000;"
                 , "  _estack   = 0xBFFC0000;"
                 , "  tohost    = 0x10012000;"
                 , "}" ])
          else return ()
        -- callCommand, not system: its result type differs between GHC and
        -- mhs, and this file has to compile under both.
        -- The bare xfun rv32 path emits the LISTING only.  Since the
        -- collector is bundled into that listing, it carries externs for its
        -- root set (fn_roots/fn_rootsp/fn_gcverbose) and for the heap bounds
        -- (_fungraph_end/_estack/tohost).  Those are supplied by the caller's
        -- startup object and linker script at the real link; mhs has neither,
        -- so assembling and linking the listing on its own here fails on all
        -- of them.  Only Thin and rvfun64g bring their own objects.
        if osTarget flags == Thin || rvfun64g flags
          then do
            callCommand asCmd
            callCommand ldCmd
          else return ()
        when (verbosityGT flags 0) $ putStrLn ("wrote " ++ pn)
     else
      -- mhs is fun-only: the Scala/Rust ROM generators, the C-runtime backend
      -- and the .comb combinator file have been purged.  The fun .S is the
      -- output.
      error "mhs (fun) output must be .S"

-- Force the generated listing in chunks, reporting as it goes.
codegenProgress :: Int -> String -> IO ()
codegenProgress every = go (1::Int)
  where
    go _ []     = return ()
    go k (c:cs) = do
      () <- return (c `seq` ())
      when (k `rem` every == 0) $ putStrLn ("[mhs]   " ++ show k ++ " chars emitted")
      go (k+1) cs

-- A toolchain prefix whose assembler exists.  MHS_RV32_PREFIX wins if set;
-- otherwise the two that are actually installed on the boxes that build this.
findRv32Prefix :: IO String
findRv32Prefix = do
  mp <- lookupEnv "MHS_RV32_PREFIX"
  case mp of
    Just q -> return q
    Nothing -> do
      home <- getEnv "HOME"
      pick [ "/opt/riscv/bin/riscv32-unknown-elf-"
           , home ++ "/work/lambdalinux/xtool/bin/riscv32-oe-linux-"
           , "riscv32-unknown-elf-", "riscv32-oe-linux-" ]
  where
    pick [] = error "no rv32 assembler found -- set MHS_RV32_PREFIX"
    pick (q:qs) = do
      ok <- doesFileExist (q ++ "as")
      if ok then return q else do
        mx <- findExecutable (q ++ "as")
        case mx of
          Just _  -> return q
          Nothing -> pick qs

-- The rv32 collector object.  The thin target links it: without a collector
-- the graph is never reclaimed and a real program dies of heap exhaustion.
findGcObj :: [FilePath] -> IO FilePath
findGcObj [] = error "cannot find funboot/rv32/fun_gc32.o -- the thin target needs the collector"
findGcObj (d:ds) = do
  let o = d ++ "/funboot/rv32/fun_gc32.o"
  ok <- doesFileExist o
  if ok then makeAbsolute o else findGcObj ds

-- The first candidate that actually holds the fun runtime assets.
findRuntimeDir :: [FilePath] -> IO FilePath
findRuntimeDir [] = error "cannot find funboot/rv64g -- set MHSDIR to the MicroHs tree"
findRuntimeDir (d:ds) = do
  let rt = d ++ "/funboot/rv64g"
  ok <- doesFileExist (rt ++ "/fun_macros.S")
  if ok then makeAbsolute rt else findRuntimeDir ds

mainInstallPackage :: Flags -> [FilePath] -> IO ()
mainInstallPackage flags [pkgfn, dir] = do
  when (verbosityGT flags (-1)) $
    putStrLn $ "Installing package " ++ pkgfn ++ " in " ++ dir
  pkg <- readSerialized pkgfn
  let pdir = dir </> packageDir
      pkgout = unIdent (pkgName pkg) ++ "-" ++ showVersion (pkgVersion pkg) <.> packageSuffix
  createDirectoryIfMissing True pdir
  copyFile pkgfn (pdir </> pkgout)
  let mk tm = do
        let fn = dir </> moduleToFile (tModuleName tm) <.> packageTxtSuffix
            dn = takeDirectory fn
        when (verbosityGT flags 2) $
          putStrLn $ "create " ++ fn
        createDirectoryIfMissing True dn
        writeFile fn pkgout
  mapM_ mk (pkgExported pkg)
mainInstallPackage flags [pkgfn] =
  case pkgPath flags of
    [] -> error $ "pkgPath is empty"
    first:_ -> mainInstallPackage flags [pkgfn, first]
mainInstallPackage _ _ = error usage

mainListPackages :: Flags -> IO ()
mainListPackages flags = mapM_ list (pkgPath flags)
  where list dir = do
          let pdir = dir </> packageDir
          ok <- doesDirectoryExist pdir
          when ok $ do
            files <- getDirectoryContents pdir
            let pkgs = [ b | f <- files, Just b <- [stripSuffix packageSuffix f] ]
            putStrLn $ pdir ++ ":"
            mapM_ (\ p -> putStrLn $ "  " ++ p) pkgs


-- Convert something like
--   .../.mcabal/mhs-0.10.3.0/packages/base-0.10.3.0.pkg
-- into
--   .../.mcabal/mhs-0.10.3.0/packages/base-0.10.3.0/include
convertToInclude :: String -> FilePath -> FilePath
convertToInclude inc pkg = dropExtension pkg </> inc

hasTheExtension :: FilePath -> String -> Bool
hasTheExtension f e = isSuffixOf e f
