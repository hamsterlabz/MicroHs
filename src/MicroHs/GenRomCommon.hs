-- Shared helpers for the fun (rvfun) ROM backend. The Scala/Chisel and Rust
-- ROM generators were purged; this module now only holds the pattern-number /
-- inlining / eta helpers GenRomMem uses.
module MicroHs.GenRomCommon(getPatNum,inlineSingle,finalEtaApply) where
import Prelude(); import MHSPrelude
import MicroHs.Lex(readInt)   -- dialect-safe decimal String->Int
import Data.List
import qualified MicroHs.IdentMap as M
import Data.Maybe
import MicroHs.Desugar(LDef)
import MicroHs.Exp
import MicroHs.Expr(Lit(..), showLit, errorMessage, HasLoc(..))
import MicroHs.Ident(Ident(..), showIdent, mkIdent)
import MicroHs.State
import MicroHs.Abstract

-- generate Chisel ROM file

header :: String
header = "\
 \package benchmarks\n\
 \import common.Helper._\n\
 \import common.Atom\n\
 \import chisel3.Vec\n\
 \ \n"

object :: String -> (String -> String) -> (String -> String)
object name r =
  (("object " ++ name ++ " extends Benchmark {\n") ++) . r . ("\n}" ++)

defToString :: String -> (String -> String)
defToString name =
  ((("override def toString() = \"" ++ name) ++ "\" \n") ++)

freeText :: String -> (String -> String)
freeText t = (t ++)

val :: String -> (String -> String) -> (String -> String)
val name r =
  (("val " ++ name ++ " = ") ++) . r 

-- rom
prog :: String -> (String -> String) -> (String -> String)
prog name r = val name (("Seq(\n" ++) . r . (")" ++)) 

-- top level functions
template :: (String -> String) -> (String -> String) -> (String -> String)
template comment r = ("templateBuilder( //" ++) . comment . ("\n" ++) . r . ("\n),\n" ++)

-- spine application
app :: Int -> (String -> String) -> (String -> String)
app offset r = ("appBuilder( // " ++) . (show offset ++) . ("\n" ++) . r . ("),\n" ++)

-- atoms
comb :: Int -> Pat -> [Int] -> (String -> String)
comb art p is = ("comBuilder(" ++) .
                ((show art ++ ",") ++) .
                ((show (getPatNum p) ++ ",") ++) .
                ((listPrint is ++ "), // ") ++) .
                ((show p ++ "\n") ++)

fun :: Int -> (String -> String)
fun n = ("funBuilder(" ++) . (show n ++) . ("),\n" ++)

ptr :: Int -> (String -> String)
ptr n = ("ptrBuilder(" ++) . (show n ++) . ("),\n" ++)

int :: Int -> (String -> String)
int n = ("intBuilder(" ++) . (show n ++) . ("),\n" ++)

prim :: String -> (String -> String)
prim op = ("prmBuilder(\"" ++) . (op ++) . ("\"),\n" ++)

y :: (String -> String)
y = ("yBuilder(),\n" ++)

err :: Int -> (String -> String)
err code = ("errorBuilder(" ++) . (show code ++) . ("),\n" ++)

getPatNum :: Pat -> Int
getPatNum X = 0
getPatNum p =
  let
    h   = getHoles p
    pre = map varHole [h - 1, h - 2 .. 1]
  in idxHole p + sum pre - 1

-- The number of application trees with n holes: the Catalan numbers.  A fun
-- word carries at most six selectors, so only the first few are ever asked
-- for -- and deriving them from the recurrence every time, which is
-- exponential and used to happen three times per combinator, is pure waste.
varHole :: Int -> Int
varHole 1 = 1
varHole 2 = 1
varHole 3 = 2
varHole 4 = 5
varHole 5 = 14
varHole 6 = 42
varHole 7 = 132
varHole 8 = 429
varHole n = sum [ varHole i * varHole (n - i) | i <- [1 .. n-1] ]

idxSplit :: Pat -> Int
idxSplit X = 1
idxSplit (At a b) = (idxHole a - 1) * varHole (getHoles b) + idxHole b

idxHole :: Pat -> Int
idxHole X = 1
idxHole (At a b) =
  let
    ah = getHoles a
    bh = getHoles b
    pairs = [ (i, ah + bh - i) | i <- [ah+1..ah+bh], ah + bh - i >= 1]
  in idxSplit (At a b) + foldr (+) 0 (map (\(a, b) -> varHole a * varHole b) pairs)

listPrint :: [Int] -> String
listPrint [] = "List()"
listPrint xs = "List(" ++ inner ++ ")"
  where
    inner = concat $ zipWith (\x y -> show x ++ y) xs (replicate (length xs - 1) ", " ++ [""])

killDead :: (Ident, [LDef]) -> [LDef]
killDead (mainName, ds) =
  let
    dMap = M.fromList ds
    -- Shake the tree bottom-up, serializing nodes as we see them.
    -- This is much faster than (say) computing the sccs and walking that.
    dfs :: Ident -> State (Int, M.Map Exp, [LDef]) ()
    dfs n = do
      (i, seen, r) <- get
      case M.lookup n seen of
        Just _ -> return ()
        Nothing -> do
          -- Put placeholder for n in seen.
          put (i, M.insert n (Var n) seen, r)
          -- Walk n's children
          let e = findIdentIn n dMap
          mapM_ dfs $ freeVars e
          -- Now that n's children are done, compute its actual entry.
          (i', seen', r') <- get
          put (i'+1, M.insert n (ref i') seen', (n, e) : r')
    (_,(_, _, res)) = runState (dfs mainName) (0, M.empty, [])
    
    ref i = Var $ mkIdent $ "FUN" ++ show i
    findIdentIn n m = fromMaybe (errorMessage (getSLoc n) $ "No definition found for: " ++ showIdent n) $
                      M.lookup n m
  in res

-- A definition whose body is not an application is an atom -- a reference, a
-- literal, a combinator -- so every use of it can be replaced by that atom and
-- the indirection leaves the graph.
--
-- Written the obvious way, that is: for each atom, rewrite the whole program.
-- The cost is (number of atoms) x (size of the program), and on a program the
-- size of the compiler it is the most expensive thing the backend does by a
-- wide margin.  The answer is the same if the atoms are RESOLVED first --
-- following the chains they form among themselves -- and the program is then
-- rewritten in a single pass.
inlineSingle :: [LDef] -> [LDef]
inlineSingle defs = map (\ (i, e) -> (i, go e)) defs
  where
    isSingle (App _ _) = False
    isSingle _         = True
    singles = M.fromList [ (i, e) | (i, e) <- defs, isSingle e ]
    -- An atom may name another atom.  Follow it to what it ends at; the bound
    -- is what stops a cycle, which the repeated-rewrite version could not
    -- terminate on either.
    limit = length defs
    resolve n d
      | d <= (0::Int) = Var n
      | otherwise =
          case M.lookup n singles of
            Just (Var m) | m /= n -> resolve m (d - 1)
            Just e                -> e
            Nothing               -> Var n
    go (Var i)   = resolve i limit
    go (App f a) = App (go f) (go a)
    go e         = e

finalEtaApply :: [LDef] -> [LDef]
finalEtaApply = map (\(i, def) -> (i, etaApply def))
