-- Lambda.hs - nofib spectral/lambda (Mark Utting's env-monad vs direct
-- eval), verbatim port to the NanoPrelude dialect. nofib FAST opts: 80.
-- The State Env monad is hand-specialized (SM a = Env -> (a, Env)) with
-- do-blocks desugared; the Id newtype evaporates to direct values; the
-- single EvalEnvMonad instance's methods become plain functions, semantics
-- unchanged (withEnv keeps the caller's state, exactly like
-- evalState-in-return). replicateM_ 100 repeats identical work and is
-- dropped. Both printed lines are consumed with the nofib hash.
module Lambda where
import Prelude()
import NanoPrelude

append :: [a] -> [a] -> [a]
append []     ys = ys
append (x:xs) ys = x : append xs ys

eqS :: [Int] -> [Int] -> Bool
eqS []     []     = True
eqS (a:as) (b:bs) = a == b && eqS as bs
eqS _      _      = False

err :: a
err = err

------------------------------------------------------------
-- Data structures
------------------------------------------------------------

data Term
    = Var [Int]
    | Con Int
    | Incr
    | Add Term Term
    | Lam [Int] Term
    | App Term Term
    | IfZero Term Term Term
    | Thunk Term Env

type Env = [([Int],Term)]

lookupE :: [Int] -> Env -> Maybe Term
lookupE v [] = Nothing
lookupE v ((k,t):kts) = if eqS v k then Just t else lookupE v kts

isZeroCon :: Term -> Bool
isZeroCon (Con 0) = True
isZeroCon _       = False

----------------------------------------------------------------------
-- The State Env monad, specialized: SM a = Env -> (a, Env)
----------------------------------------------------------------------

type SM a = Env -> (a, Env)

returnS :: a -> SM a
returnS a = \s -> (a, s)

bindS :: SM a -> (a -> SM b) -> SM b
bindS m k = \s -> case m s of (a, s') -> k a s'

getS :: SM Env
getS = \s -> (s, s)

evalStateS :: SM a -> Env -> a
evalStateS m s = fst (m s)

runStateS :: SM a -> Env -> (a, Env)
runStateS m s = m s

-- the EvalEnvMonad instance for State Env, as plain functions
incr :: SM Int
incr = returnS 0

traverseTerm :: Term -> SM Term
traverseTerm = eval

lookupVar :: [Int] -> SM Term
lookupVar v = getS `bindS` \env ->
              returnS (maybe err id (lookupE v env))

currEnv :: SM Env
currEnv = getS

withEnv :: Env -> SM a -> SM a
withEnv tmp m = returnS (evalStateS m tmp)

pushVar :: [Int] -> Term -> SM a -> SM a
pushVar v t m = currEnv `bindS` \env -> withEnv ((v,t):env) m

traverseCon :: Term -> SM Int
traverseCon t =
    traverseTerm t `bindS` \t' ->
    case t' of
        Con c -> returnS c
        _     -> err

eval :: Term -> SM Term
eval (Var x) =
    currEnv `bindS` \e ->
    lookupVar x `bindS` \t ->
    traverseTerm t
eval (Add u v) =
    traverseCon u `bindS` \u' ->
    traverseCon v `bindS` \v' ->
    returnS (Con (u'+v'))
eval (Thunk t e) =
    withEnv e (traverseTerm t)
eval f@(Lam x b) =
    currEnv `bindS` \env ->
    returnS (Thunk f env)
eval (App u v) =
    traverseTerm u `bindS` \u' ->
    apply u' v
eval (IfZero c a b) =
    traverseTerm c `bindS` \val ->
    if isZeroCon val
       then traverseTerm a
       else traverseTerm b
eval (Con i) = returnS (Con i)
eval Incr    = incr `bindS` \_ -> returnS (Con 0)

apply :: Term -> Term -> SM Term
apply (Thunk (Lam x b) e) a =
    currEnv `bindS` \orig ->
    withEnv e (pushVar x (Thunk a orig) (traverseTerm b))
apply a b = err

ev :: Term -> ([Int], Env, Term)
ev t = (append (pp t2) (append [32,32] (ppenv env)), env, t2)
  where (t2, env) = runStateS (traverseTerm t) []

----------------------------------------------------------------------
-- A directly recursive Eval, with explicit environment
----------------------------------------------------------------------

simpleEvalCon :: Env -> Term -> Int
simpleEvalCon env e =
    case simpleEval env e of
        Con c -> c
        _     -> err

simpleEval :: Env -> Term -> Term
simpleEval env (Var v) =
    simpleEval env (maybe err id (lookupE v env))
simpleEval env e@(Con _) = e
simpleEval env Incr = Con 0
simpleEval env (Add u v) = Con (simpleEvalCon env u + simpleEvalCon env v)
simpleEval env f@(Lam x b) = Thunk f env
simpleEval env (App u v) = simpleApply env (simpleEval env u) v
simpleEval env (IfZero c a b) =
    if isZeroCon (simpleEval env c)
       then simpleEval env a
       else simpleEval env b
simpleEval env (Thunk t e) = simpleEval e t

simpleApply :: Env -> Term -> Term -> Term
simpleApply env (Thunk (Lam x b) e) a = simpleEval env2 b
    where env2 = (x, Thunk a env) : e
simpleApply env a b = err

------------------------------------------------------------
-- Printing (pp / ppenv / derived Show for the simple result)
------------------------------------------------------------

showI :: Int -> [Int]
showI n = if n < 0 then 45 : showP (0-n) else showP n
  where showP k = if k < 10 then [48+k] else append (showP (div k 10)) [48 + mod k 10]

ppenv :: Env -> [Int]
ppenv env = 91 : append (concat (map (\(v,t) -> append v (61 : append (pp t) [44,32])) env)) [93]

pp :: Term -> [Int]
pp = ppn 0

ppn :: Int -> Term -> [Int]
ppn _ (Var v) = v
ppn _ (Con i) = showI i
ppn _ Incr    = [73,78,67,82]                                   -- "INCR"
ppn n (Lam v t) = bracket n 0 (64 : append v (append [46,32] (ppn (0-1) t)))
ppn n (Add a b) = bracket n 1 (append (ppn 1 a) (append [32,43,32] (ppn 1 b)))
ppn n (App a b) = bracket n 2 (append (ppn 2 a) (32 : ppn 2 b))
ppn n (IfZero c a b) = bracket n 0
    (append [73,70,32] (append (ppn 0 c)
      (append [32,84,72,69,78,32] (append (ppn 0 a)
        (append [32,69,76,83,69,32] (ppn 0 b))))))
ppn n (Thunk t e) = bracket n 0 (append (ppn 3 t) (append [58,58] (ppenv e)))

bracket :: Int -> Int -> [Int] -> [Int]
bracket outer this t = if this <= outer then 40 : append t [41] else t

-- derived Show, reached only for the Con result of mainSimple
showTermD :: Term -> [Int]
showTermD (Con i) = append [67,111,110,32] (showI i)            -- "Con i"
showTermD _       = err

------------------------------------------------------------
-- Test Data
------------------------------------------------------------

sum0 :: Term
sum0 = App fix partialSum0

partialSum0 :: Term
partialSum0 = Lam vSum
                  (Lam vN
                   (IfZero (Var vN)
                    (Con 0)
                    (Add (Var vN) (App (Var vSum) nMinus1))))

nMinus1 :: Term
nMinus1 = Add (Var vN) (Con (0-1))

lfxx :: Term
lfxx = Lam vX (App (Var vF) (App (Var vX) (Var vX)))

fix :: Term
fix = Lam vF (App lfxx lfxx)

vSum, vN, vX, vF :: [Int]
vSum = [115,117,109]   -- "sum"
vN   = [110]           -- "n"
vX   = [120]           -- "x"
vF   = [70]            -- "F"

-- main: N = 80 (nofib FAST); one mainSimple + one mainMonad

nArg :: Int
-- SIM SCALE (user ruling 2026-07-30): the nofib FAST input needs 1e8+
-- operations, which this RTL simulation (~1e4 cycles/s) cannot reach.
-- fast* is the upstream FAST value, sim* is what is actually run; both
-- backends compile the same one. See benchmarks/porting_nofib.md.
fastArg, simArg :: Int
fastArg = 80
simArg = 8

nArg = simArg

hashS :: [Int] -> Int
hashS = foldl (\acc c -> c + acc*31) 0

bench :: Int
bench = hashS (append lineSimple (10 : append lineMonad [10]))
  where
    lineSimple = showTermD (simpleEval [] (App sum0 (Con nArg)))
    lineMonad  = case ev (App sum0 (Con nArg)) of (line, _, _) -> line

main :: Int
main = bench
