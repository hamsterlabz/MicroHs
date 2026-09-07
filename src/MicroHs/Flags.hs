module MicroHs.Flags(Flags(..), OSTarget(..), verbosityGT, defaultFlags) where
import Prelude(); import MHSPrelude
import qualified MicroHs.IdentMap as M

-- What the emitted program runs on.
--   Bare  -- no OS at all: no files, no argv, nothing to call out to
--   Thin  -- ThinOS: files and the rest of its services
--   Linux -- a hosted Linux process (this is the qemu target)
data OSTarget = Bare | Thin | Linux
  deriving (Eq, Show)

data Flags = Flags {
  verbose    :: Int,        -- verbosity level
  runIt      :: Bool,       -- run instead of compile
  mhsdir     :: FilePath,   -- where MHS files live
  paths      :: [FilePath], -- module search path
  output     :: String,     -- output file
  loading    :: Bool,       -- show loading message
  speed      :: Bool,       -- show lines/s
  readCache  :: Bool,       -- read and use cache
  writeCache :: Bool,       -- generate cache
  useTicks   :: Bool,       -- emit ticks
  doCPP      :: Bool,       -- run ccphs on input files
  cppArgs    :: [String],   -- flags for CPP
  cArgs      :: [String],   -- arguments for C compiler
  compress   :: Bool,       -- compress generated combinators
  buildPkg   :: Maybe FilePath, -- build a package
  listPkg    :: Maybe FilePath, -- list package contents
  pkgPath    :: [FilePath], -- package search path
  installPkg :: Bool,       -- install a package
  target     :: String,     -- Compile target defined in target.conf
  optLevel   :: Int,        -- -O0/-O1/-O2: how hard the fun backend inlines
  perfReport :: Bool,       -- --perf: report every counter around the run
                            -- before abstraction, which is what lets the
                            -- unifier fuse combinators that a link would
                            -- otherwise separate
  rvfun      :: Bool,       -- emit the rvfun 32-bit .mem encoding (KappaMutor)
  rvfunLinux :: Bool,       -- rvfun + a Linux _start (runs as a normal process)
  rvfunIO    :: Bool,       -- wrap the entry with performIO (main :: IO ())
  rvfun32    :: Bool,       -- rv32 prim blobs (add not addw) for the kiskadee SoC
  wantSet    :: M.Map (),   -- with -hi: every identifier the root module
                            -- mentions.  An interface signature for a name
                            -- that appears nowhere cannot be referenced, so it
                            -- is not read.  Empty means read everything.
  useHi      :: Bool,       -- -hi: satisfy an import from <mod>.hi.hs, the
                            -- interface beside the object, instead of
                            -- recompiling the module from source
  osTarget   :: OSTarget,   -- --bare / --thin / --linux
  asmOnly    :: Bool,       -- -S: stop at the assembly, do not assemble or link
  sepComp    :: Bool,       -- -c: compile THIS module to its own object.  Only
                            -- this module's definitions are emitted; a name
                            -- from another module becomes an undefined symbol
                            -- that the linker resolves, exactly as a .c does.
  rvfun64g   :: Bool,       -- target a stock RV64GC host: the fn.* instructions
                            -- become assembly macros and the special CSRs
                            -- become globals (no xfun extension needed)
                            -- _start (the kiskadee SoC boxed fun_core; matches the
                            -- QEMU/RTL gold-standard reducer)
  useLazy    :: Bool,       -- abstraction strategy: default = compileExpSc (count-min,
                            -- fewer reductions); --lazy = compileExpLazy (full-laziness,
                            -- shares free subexprs; wins on TreePari/Queens-like sharing)
  useSE      :: Bool,       -- --single-entry: mark argument-linear combinators (bit3 of
                            -- the combi opcode) so the reducer skips the WHNF update for
                            -- single-entry thunks. correctness-safe (mis-mark = re-reduce)
  grin       :: Bool,       -- --grin: whole-program optimization at link (GRIN
                            -- discipline).  Modules keep their desugared lambda
                            -- bindings; MicroHs.Grin reruns inlineOnce over the
                            -- WHOLE pruned program at link (cross-module used-once
                            -- and atom splicing), then abstraction runs at link.
  morph      :: Bool,       -- --morph: explicit-instruction morphisms.  Detect
                            -- cata/ana, extract (functor, algebra) from the naive
                            -- recursion, fuse cata-chains into hylo, and emit
                            -- fn.cata (functor)(alg) / fn.ana (functor)(coalg).
  mmorph     :: Bool,       -- --mmorph: Mendler-style morphisms.  Same classifier,
                            -- but emit fn.<scheme> (\_rec \y. body) with the
                            -- recursion explicit in the algebra (no functor arg).
  baby       :: Bool,       -- --baby: ask for a GENERATIONAL heap.  Emits the
                            -- fn_baby marker; the build sees it with nm and
                            -- links with -Wl,--defsym,NURSERY_BYTES=<n>, which
                            -- is what actually reserves the nursery (fun.ld).
                            -- The collector switches to the generational path
                            -- when _nursery_end > _nursery, so the linker
                            -- symbol is the single source of truth and an
                            -- image built without the defsym still runs.
  yrec       :: Bool        -- --yrec: force TOP-LEVEL recursion through Y.  A
                            -- local `letrec` already goes through Y (letRecE in
                            -- MicroHs.Desugar); a top-level recursive binding
                            -- does not -- its body just names its own global, so
                            -- the recursion is a self-reference and no fn.y is
                            -- ever executed for it.  With this flag
                            --     foo = \x -> 1 + foo (x-1)
                            -- is emitted as
                            --     foo = Y (\self -> \x -> 1 + self (x-1))
                            -- so the knot is tied by the reducer at run time.
  }
-- The name set is a Map, which has no Show; the flag dump does not need it.
instance Show Flags where
  show f = "Flags{verbose=" ++ show (verbose f) ++ ",optLevel=" ++ show (optLevel f) ++ ",perf=" ++ show (perfReport f)
           ++ ",sepComp=" ++ show (sepComp f) ++ ",useHi=" ++ show (useHi f)
           ++ ",output=" ++ show (output f) ++ "}"

verbosityGT :: Flags -> Int -> Bool
verbosityGT flags v = verbose flags > v

defaultFlags :: FilePath -> Flags
defaultFlags dir = Flags {
  verbose    = 0,
  runIt      = False,
  mhsdir     = dir,
  paths      = [".", dir ++ "/lib"],
  output     = "out.S",
  loading    = False,
  speed      = False,
  readCache  = False,
  writeCache = False,
  useTicks   = False,
  doCPP      = False,
  cppArgs    = [],
  cArgs      = [],
  compress   = False,
  buildPkg   = Nothing,
  listPkg    = Nothing,
  pkgPath    = [],
  installPkg = False,
  target     = "default",
  optLevel   = 1,
  perfReport = False,
  rvfun      = False,
  rvfunLinux = False,
  rvfunIO    = False,
  rvfun32    = False,
  wantSet    = M.empty,
  useHi      = False,
  osTarget   = Linux,
  asmOnly    = False,
  sepComp    = False,
  rvfun64g   = False,
  useLazy    = False,
  useSE      = False,
  grin       = False,
  morph      = False,
  mmorph     = False,
  baby       = False,
  yrec       = False
  }
