# Morphism / restructuring work: all measurements

Reductions on the rv64 native-graph target (`fun: reductions`).  Plain builds
unless a flag is named.  Every kept rewrite returns the original answer.

Layout: winning variants live beside their originals in `suites/flite` and
`suites/nofib`; regressions and neutral attempts are in `suites/losses/`;
probes, scaled copies and compiler-test programs are in `suites/scaffold/`.

---

## 1. Source restructuring that WON

| benchmark | before | after | speedup | what |
|---|---:|---:|---:|---|
| TreeSum | 114,681 | 70 | **1638x** | `treeSum (mkTree 13)` builds 16,383 nodes for one sum, and both children are the same subtree -> `s + s + 1` over the depth |
| exp3_8 (Wu port) | 24,235,158 | 72,464 | **334x** | naive `muls` folds over the large argument while `adds` re-walks the accumulator (quadratic); the morphism folds over the small one |
| TreePari | 30,449 | 154 | **198x** | as TreeSum; parity shared across identical children |
| PerfDemo | 7,893 | 120 | **65.8x** | `fib (n-1) + fib (n-2)` -> algebra carries the pair |
| Mss | 69,974 | 1,082 | **64.7x** | `maximum (map sum (segments xs))` -> one cata carrying `(best, best-suffix)` |
| Fibonacci | 1,149 | 88 | **13.1x** | paired fold |
| Queens | 48,190 | 5,820 | **8.3x** | hylo: fold over candidate columns inside unfold of the search, state as bitmasks |
| NQueens | 11,991 | 1,866 | **6.4x** | same |
| Minimax | 814,894 | 171,951 | **4.74x** | one-pass `static`: 8 win lines ARE the 3 rows + 3 cols + 2 diagonals, so 9 cell scores give all 8 (was 72 cell visits/node) |
| Puzzle | 83,727,180 | 25,771,503 | **3.25x** | visited set as a 16-bit mask, then whole search in Int (58M reductions, largest absolute win) |
| Map | 817 | 407 | 2.01x | `foldr' (+) 0 (map (+1) ..)` -> one fold |
| InsertSort -> TreeSort | 17,597 | 10,011 | 1.76x | `readTree . foldr to_tree Tip` |
| TreeSum (sharing only) | 114,681 | 65,628 | 1.75x | `let t = rec (n-1) in Node t t` |
| mergesort | 17,143 | 10,608 | 1.62x | one-pass run detection + pairwise merge |
| Fib5 | 61 | 40 | 1.53x | paired fold |
| Ordlist | 13,488 | 9,001 | 1.50x | `boolList n` written 3x in one expression |
| quicksort | 16,333 | 12,091 | 1.35x | `partition = foldr (select p) (Pair Nil Nil)` instead of two filter passes |
| Braun | 54,570 | 41,054 | 1.33x | recursive results named once |
| SumEuler | 16,721 | 13,379 | 1.25x | `length (filter ..)` / `sum (totients ..)` -> counting folds |
| Taut | 29,935 | 24,754 | 1.21x | `bools m` written twice |
| Fib | 37 | 32 | 1.16x | paired fold |
| Clausify | 92,060 | 80,572 | 1.14x | unfold the formula straight to clauses; disin/din/din2/split/clauses vanish |
| NQueens (hoist+count) | 11,991 | 10,691 | 1.12x | loop-invariant `enumFromTo` hoisted, last level counted |
| TribeLie | 11,482 | 10,710 | 1.07x | `sum $ map (\x -> if p x then 1 else 0)` -> counting fold |
| Queens2 | 15,162 | 14,405 | 1.05x | count instead of consing solutions |

### Minimax in stages (why the outer level misleads)

| stage | reductions |
|---|---:|
| original | 814,894 |
| four tree passes fused | 791,742 |
| + `score` pipeline fused | 664,505 |
| + one-pass `static` | **171,951** |

Fusing the outer pipeline returned 1.03% and I called the program finished.  The
work was two levels down, in the innermost loop.  A flat result at the outer
structure says nothing about the inner loop.

---

## 2. Source restructuring that LOST (`suites/losses/`)

| attempt | before | after | outcome |
|---|---:|---:|---|
| mergesort, the reference's linear run-fold | 17,143 | 31,096 | **1.8x WORSE** -- O(n x runs), ~50 runs in a random 100-list |
| Taut, deforested | 29,935 | 51,682 | **1.7x WORSE** -- envs are small, lazy, already shared |
| Cryptarithm2, digit set as bitmask | 5,190,459 | 5,535,232 | 6.6% worse -- `bitsOf` rebuilds the candidate list anyway |
| Queens, state as three lists (explicit) | 48,190 | 60,261 | worse -- 3 membership walks + 2 map-shifts beat 1 fused walk |
| Queens, state as three lists (Mendler) | 48,190 | 60,268 | worse |
| Queens2's mask at n=6 | 48,190 | 58,899 | worse |
| Queens, depth-first count | 48,190 | 55,128 | worse -- the original shares `gen nq (n-1)` |
| Queens, Fix knots on safe/toOne | 48,190 | 55,661 | worse -- glue on an already-free fold |
| Factorial, Fix knot | 325 | 406 | worse |
| Factorial, accumulating knot | 325 | 566 | worse |
| Fish, repeated rotations shared | 3,728,498 | 3,728,492 | 6 reductions -- they are CAFs, already shared |
| Multiplier, one-pass split | 3,295,517 | 3,295,099 | 0.01% -- gate lists are word-sized |
| Clausify, `disin . negin` fused | 92,060 | 91,656 | 0.4% |
| Minimax, tree passes only | 814,894 | 791,742 | 2.8% (superseded) |
| Countdown, use the bound `ems` | 14,759 | 14,759 | no change -- already shared |
| Queens, hoist `toOne nq` | 48,190 | 48,190 | no change |
| Permsort | 11,758 | 11,427 | 1.03x, kept as marginal then moved |

**Two rules from the losses.**  (a) Never add machinery to a fold that is
already free -- a Scott value applied to its branches IS its fold, so `Fix`
wrappers and functor morphisms are pure glue.  (b) Deforestation needs a large
intermediate that is actually built; where laziness or CAF memoization already
removed it, the rewrite is noise, and replacing shared structure with
recomputation is a regression.

---

## 3. Probes (`suites/scaffold/`, answers deliberately changed)

| probe | result | conclusion |
|---|---|---|
| Puzzle, rendering replaced by `length mins` | 83,698,926 vs 83,727,180 | rendering is 0.03%; the search is everything |
| Clausify with `uniq xs = xs` | 92,042 vs 92,060 | the quadratic dedup is free at this size |
| Clausify with `nonTaut cs = cs` | 433,322 vs 92,060 | nonTaut is a **pruner** worth 4.7x, not overhead |
| perf (cpu-clock) on Clausify | objsize 18.3%, fun_gc 14.8%, gc_fwd 13.4%, gc_push 5.6% | 55% of WALL TIME is GC -- which performs zero reductions, so it is invisible to this metric |

---

## 4. Compiler changes

### 4.1 scottLimit 5 -> 100 (EncodeData.hs, one line) -- KEPT

Types with more than five constructors were tag-encoded, so every case descended
`caseTree`'s binary search.  The tuning comment beside the constant lists GHC
compile times of mhs, not reduction counts of generated code.  All 60
benchmarks, no answer changed:

| benchmark | tag-encoded | Scott | change |
|---|---:|---:|---:|
| Lambda | 31,068 | 22,954 | **-26.1%** |
| Countdown | 14,759 | 12,445 | -15.7% |
| PrettyN | 3,201 | 2,883 | -9.9% |
| Whilex | 47,613 | 46,756 | -1.8% |
| Sphere | 63,490 | 65,052 | +2.5% |

55 of 60 unchanged -- their widest type already had <= 5 constructors.

### 4.2 CSE, `--cse` (CSE.hs) -- NOT DEFAULT

Binds a subexpression occurring more than once, at the smallest subexpression
containing all occurrences.  All 60 answers correct.

| | |
|---|---|
| improved | 19 (TreeSum **2.33x**, TreePari 1.37x, Ordlist 1.35x, Taut 1.21x, Scc 1.12x) |
| regressed | 25 (RFib +13.3%, Whilex +6.5%, Integrate +6.1%) |
| unchanged | 16 |
| net | -0.01% (all), **+0.50% excluding Puzzle** |

Beats the hand rewrite on TreeSum (2.33x vs 1.75x) -- it finds every duplicate,
not just the one I spotted.  Not a net win because binding costs a beta redex
and only pays when the expression is evaluated more than once at RUN time; when
the occurrences sit in different branch arms, one arm runs and the binder is
pure overhead.  Needs a dominance test before it can be default-on.

Two bugs found while building it, both now comments in the source:
* Binding at the enclosing lambda hoists a candidate out of the branch that
  guarded it -- `fib`'s recursive call ended up built in the base case, and all
  four fib benchmarks hung.  Bind at the smallest containing node instead.
* Only `Var`-headed calls may be bound.  The duplicate in `fib (n-1) + fib (n-2)`
  is `(-) n`, a partially applied PRIMITIVE; sharing it produces an under-applied
  node the record-free reducer cannot resolve.

### 4.3 Explicit morphism primitives + Mendler lowering -- NOT DEFAULT

Architecture (all wired and correct): morphisms are language primitives taking a
functor then algebra/coalgebra (`cata F alg x`); they become `Morph` nodes before
abstraction so the optimizer manipulates morphisms, not names; after every
rewrite they lower to the Mendler fixpoint `cata F A ==> Y (\rec s -> A (F rec s))`,
which is final.  `fn_cata = 0` in output -- no morphism instructions at all.

Measured over 60 benchmarks, all answers correct:

| | |
|---|---|
| better | **0** |
| worse | 36 |
| unchanged | 24 |
| net | +2.35% (all), **+11.75% excluding Puzzle** |

Worst: Mss +41.4%, Awards +31.7%, Cryptarithm2 +30.1%, Permsort +26.4%.

One cause: the pattern functor `fmapL` allocates a `ListF` cell per element that
the algebra destructs immediately.  The lowering is the right identity but leaves
`F` and `A` as two applications, so that layer survives to run time -- the `fmap`
layer Ahn & Sheard 3.3 says Mendler exists to avoid.  **The remaining work is to
fuse the functor into the algebra during lowering**, so `A (F rec s)` becomes one
case on `s`.  Until then this path is a 12% regression with zero wins.

Also measured here: `cata` lowered to `Y` beats emitting the `fn_cata`
instruction, 3,016 vs 3,418 (-11.8%).  The fixpoint is cheaper than the opcode.

### 4.4 Classifier bug fixes -- KEPT

| bug | effect |
|---|---|
| `isConHead` tested the qualified name, so `System.IO.cgetbK` read as a constructor | crashed `--morph` on any full-Prelude program and manufactured false morphisms |
| para rewrite emitted `NanoPrelude.fst/snd` | out of scope wherever `Prelude` is imported |
| hylo never memoized its root | every re-entry re-ran the unfold |
| `allSelfScruts`/`countVar` did not walk `ELet` | **introduced by me** with the `where` support: `qsort` reported zero self-calls, the field gate passed vacuously, `elideSelf` erased both recursive calls -- the sort was silently deleted |

Knuthbendix compiles under `--morph` for the first time; detection in mhs went
8 -> 12 morphisms; `--morph-why` reports the rejecting gate per binding.

### 4.5 Mendler neutrality (`--mmorph`) -- KEPT

Three defects, each measured: the knot was rebuilt per call (eta-float it); the
algebra closed over captures (declining captures beats lifting them, which cost
Taut +5,226); producers paid a CAF indirection per element (Braun's exact +1,024).
Result: 0.0% on all 68 gadt modules.

### 4.6 mhs's own source (`MicroHs-morph`) -- KEPT

Output byte-identical, Knuthbendix compile 14.00s -> 13.47s (3.8%).
`scCombine` recomputed `getHoles p1`/`p2` across three successive `if` tests and
had a copy-paste duplicate (`a2Improved` identical to `a1Improved`); `discardSc`
walked `length args` twice per index; `combineLazy` walked its spine lengths five
times.  GHC's own CSE absorbs most of it, hence only 3.8%.

---

## 5. Findings about the suite and toolchain

* **Queens2 was never comparable to Queens** -- it runs n=5 against Queens' n=6.
  At equal size Queens2's mask formulation is WORSE (58,899 vs 48,190).
* **NanoPrelude does not re-export the bit primitives.**  `Primitives.hs` binds
  `primIntAnd/Or/Xor/Shl/Shr` to the ALU opcodes and `gadt/GExtra.hs` already
  wraps them under the Data.Bits names -- but GExtra sits in the gadt directory
  and is only reachable because the include path carries `-i$S/gadt`.  It belongs
  in `lib/`.  This is what kept every search benchmark on an O(n) constraint test.
* **The self-compiled mhs64 could not finish a trivial module.**  Found and
  fixed; see section 7.  It was not a pre-existing condition of the binary.
* **perf sampling needs a software event** (`-e cpu-clock`); `perf_event_paranoid`
  is 2, so PMU sampling yields no samples.
* **There is no per-reduction profiler.**  `fn_reductions` is a single global;
  graph cells already carry per-source-function symbols, so a per-cell counter is
  buildable and is the right tool.  Stage-probe deltas were used instead.

---

## 6. What the compiler should learn

Classification is an ANALYSIS -- it exposes `cata . ana` for fusion and
identifies the Mendler path -- not an emission decision.  It should not wrap a
fold that is already free.  The rewrites worth automating are the ones behind
every win above:

1. bind a recursive call written more than once (CSE: built, needs a dominance test);
2. choose the fold direction so no accumulator is re-walked;
3. fuse build-then-consume when the intermediate is large and actually built;
4. give a search coalgebra an O(1) state representation when the state space
   fits in a machine word (Queens 8.3x, NQueens 6.4x, Puzzle 3.25x came from this);
5. fuse the functor into the algebra when lowering an explicit morphism
   (the one gap that makes 4.3 a regression).

---

## 7. The inliner made the self-hosted compiler quadratic

After `f512ea2` (inline before abstraction) the self-hosted `mhs64` could not
compile anything at the default `-O1`; `-O0`, which never calls `inlineOnce`,
was unaffected.  The output was always CORRECT -- the GHC-built compiler
computed the same answers throughout -- so this was never a logic bug.  It was
a work-duplication bug, in two parts.

### 7.1 A thunk must not be spliced under a lambda

A binding whose body is an `App` is a thunk: evaluated once, its value shared
by every name reaching it.  Splicing it into an occurrence beneath a lambda
moves that evaluation inside the lambda, where it repeats on every entry.
`Share.hs` / `Share2.hs` (`suites/scaffold/`), one value costing 33.5k
reductions, named once inside a ten-element map:

| case | reductions | |
|---|---:|---|
| `useA` value used once, no lambda | 33,511 | baseline: one evaluation |
| `useB` let-bound, used in a 10-element comprehension | 322,445 | **9.6x** -- recomputed per element |
| `useC` where-bound, used in a lambda applied 10 times | 322,456 | **9.6x** |
| `useD` same value, but named TWICE | 34,403 | a second use disables the splice, cost collapses |
| `useE` top-level CAF used under a lambda | 322,455 -> **34,382** | fixed by the work-safety rule |
| `useF` `seq`-forced, then used once | 34,394 | already forced, nothing left to duplicate |

`useD` is the control: adding a second syntactic use changes nothing else and
removes the 10x.  Atoms and lambdas are values -- normal forms with no work to
lose -- so they still splice anywhere.  This is the rule `inlineSingle` in
`GenRomCommon` already followed.

### 7.2 The pass needs its own working set shared

`inlineOnce` builds a candidate map, a use census and a free-variable list once
per module, then consults them once per binding from inside the walk.
Count-minimal abstraction -- the default -- does not keep a local binding shared
across a lambda, so every consultation rebuilt all three.  `Repro4.hs`
(`suites/scaffold/`) is the pass's exact shape over N synthetic definitions:

| N definitions | reductions | |
|---:|---:|---|
| 20 | 5,835,070 | |
| 40 | 40,278,890 | 6.9x for 2x the input -- about N^2.8 |
| 40, with `{-# LAZY run #-}` | **94,982** | **424x**, same answer |

Full laziness is exactly the tool for this and the per-function pragma already
existed.  An explicit-argument restructuring was tried first and only halved
the cost (40.3M -> 20.0M), because the inner pass has the same shape again.

### 7.3 Gate: the self-hosted compiler against the GHC-built one

Ten flite programs compiled by `mhs64` at the default `-O1`, output compared
byte-for-byte with `gmhs`:

| program | reductions | result |
|---|---:|---|
| Fib | 50,079,495 | identical |
| Mss | 177,002,033 | identical |
| Queens | 153,525,166 | identical |
| Ordlist | 247,441,655 | identical |
| Braun | 228,524,273 | hex letter case only |
| Taut | 390,405,125 | hex letter case only |
| Countdown | 590,128,256 | hex letter case only |
| Adjoxo | 542,122,131 | identical |
| Clausify | 889,993,423 | identical |
| Knuthbendix | -- | heap exhausted at 128 MiB |

The three differences are `0x0000002A` against `0x0000002a` -- `showHex` differs
in case between GHC's `base` and MicroHs's own prelude, and the assembler does
not see it.  Case-folded, all ten diff to zero lines.

Fib costs **50,079,495** reductions against **52,667,115** at `cd7e84e`, the last
commit that finished: 4.9% better than the pre-regression baseline, not merely
restored.

Knuthbendix exhausts the 128 MiB heap at `-O0` as well, where `inlineOnce` is
never called, so that ceiling is a separate question from this bug.

### 7.4 What was ruled out on the way

The runtime, the graph size, the `resolved`/`sub` knot, chained
re-substitution, double `freeVars`, a lazy `foldl`, the one-level splice, the
`selfRef` guard, and `scottLimit` (5 in this tree; the 100 was a different
checkout).  Building the compiler at `-O0` and running it at `-O1` reproduced
the slowness exactly, which ruled out the binary having been mangled by its own
inliner and pointed at the code shape instead.

---

## 8. Making the self-hosted compiler faster

Benchmark: **mhs64 compiling Fib**, reductions, output checked byte-identical
to the GHC-built compiler's every time.  Baseline after section 7 was
50,079,495.

| change | reductions | vs baseline |
|---|---:|---:|
| section 7 baseline | 50,079,495 | -- |
| **`eLet` work safety + single-pass `occInfo`** | **32,915,204** | **-34.3%** |
| build the compiler with global `--lazy` | 31,330,154 | -4.8% (flag, not a fix) |
| hoist `freeVars se` out of `substExp` | 32,916,875 | +0.005%, reverted |
| linear accumulator `freeVars` / `allVarsExp` | 32,933,309 | +0.055%, reverted |
| skip the post-abstraction `rnfErr` force | 32,915,310 | +0.000%, reverted |

### 8.1 What won, and why it was the same bug again

`eLet` in the desugarer substitutes a binding used exactly once into its use.
The author's own note read `XXX could be worse if under lambda` -- and it was:
the same work-safety violation as section 7.1, one layer down and on every
program the compiler has ever built.  Restricting it to values and to
occurrences no lambda stands under took the compile of Fib down by a third.
The two-walk test it replaced (`filter (== i) (freeVars b)` for the count,
then a separate lambda test) is now one walk carrying a pair, `occInfo`.

Effect on generated code, flite plain: 15 of 17 unchanged, Knuthbendix
20,617 -> **19,923**, and two small losses -- Mss 69,974 -> 70,794 (+1.17%)
and Taut 29,935 -> 29,945 -- where a beta redex replaces a substitution that
was not in fact duplicating work.  The redex shares; the trade is worth a
third of the compiler's time.  The pathological case it removes is 9.4x:
`useC` 322,456 -> 34,394.

### 8.2 Where the time actually goes

Compiling an EMPTY module costs 30,979,466 reductions against Fib's
31,331,504.  **98.9% of the benchmark is fixed cost** -- lexing, typechecking,
desugaring and abstracting NanoPrelude and Primitives from source on every
invocation -- and Fib's own code is 1.1% of it.  This is why the per-pass
micro-optimizations above all measured as noise: they were shaving passes that
are not where the time is.

Per-definition cost past that fixed floor is roughly linear (190k reductions
per definition at 40 definitions, 208k at 80), so no remaining pass is badly
superlinear.

The real lever is therefore not to do the fixed work at all.  `mhs` already
has a compile cache (`-C`), but `saveCache` goes through
`writeSerializedCompressed`, which needs the `add_lz77_compressor` FFI, and
the serializer itself is `primitive "IO.serialize"` -- implemented in
`src/runtime/eval.c` and NOT in the bare rv64g runtime.  Caching the prelude
needs a graph serializer written for that runtime.  That is the next large
win and it is a build, not a tweak.

### 8.3 The inliner earns its keep, narrowly

`-O0` compiles Fib in 27,977,074 reductions against `-O1`'s 31,331,504, so
`inlineOnce` costs **10.7% of every compile**.  What it buys, on generated
code: nothing at all on 15 of 17 flite programs (one reduction either way),
a loss on Clausify and Adjoxo, 0.75% on Countdown -- and **2.65% on
Knuthbendix**, whose driver loop is the shape the pass was written for.  Kept
on by default on that evidence, but it is a narrow margin and worth revisiting
if the fixed cost above ever comes down.

---

## 9. Separate compilation: one object per module, linked

`mhs -c` compiles a module to its own object, the way a `.c` becomes a `.o`.
Only that module's definitions are emitted; a name another module owns becomes
an undefined symbol and the linker resolves it.  `funboot/rv64g/build_sep.sh`
is the reference build.

Nothing new was needed in the encoding to make this work.  `fn_link` already
goes through `%hi`/`%lo`, which relocate against an undefined symbol as
happily as against a local label, and definitions already carried
module-qualified global names (`NanoPrelude.enumFromTo`).  The work was
deciding what belongs to whom.

### 9.1 The gate: identical reduction counts

Every program below built as six objects -- itself, NanoPrelude, Primitives
and the three `Data.*_Type` modules -- and linked.  Reductions are compared
against the single-object build of the same program:

| program | reductions | | program | reductions | |
|---|---:|---|---|---:|---|
| Fib | 37 | same | Countdown | 14,759 | same |
| Fib5 | 61 | same | Adjoxo | 18,921 | same |
| Braun | 54,570 | same | SumEuler | 16,721 | same |
| Mss | 70,794 | same | TribeLie | 11,482 | same |
| Ordlist | 13,488 | same | Map | 817 | same |
| Taut | 29,945 | same | Factorial | 325 | same |
| Queens | 48,190 | same | PerfDemo | 7,893 | same |
| Queens2 | 15,162 | same | Fibonacci | 1,149 | same |
| Clausify | 92,060 | same | | | |

17 of 17 identical, not merely equal answers.  A separately compiled program
executes the same graph as a monolithic one.

### 9.2 Dead code is stripped by the linker

Each definition is emitted into its own section, `.text.<qualified name>` --
`-ffunction-sections` -- so `ld --gc-sections` does the reachability walk that
GenRomMem's walk out of main used to do, and does it across objects.  For Fib:

| | |
|---|---:|
| definitions emitted across the six objects | 232 |
| object bytes before linking | 570,696 |
| **definitions surviving the link** | **3** |
| linked ELF (mostly the runtime) | 264,776 |

Stripping is not optional here: a library object emits every definition it
owns, including `NanoPrelude.rdcycle`, whose blob nothing else links.  Without
`--gc-sections` those pull in undefined symbols and the link fails.  With it
they are dropped before symbol resolution cares.

### 9.3 What had to be decided

* **The entry belongs to whoever defines main**, exactly as crt0 finds main in
  whichever object defined it -- not to "the non-library object".  The
  performIO wrapper and the `main` alias follow main's owner, and `main` must
  be emitted INSIDE the entry block's section or it labels a different section.
* **Head position is an elink, argument position is a link.**  A local head is
  `wEptr` and a local argument is `wPtr`; externs must keep that distinction.
  Emitting a link where the head belonged ran but never terminated.
* **An extern stays a `Var`.**  Represented as a `Lit`, `needsLit` classified
  it as literal data and gave the block a different layout -- Fib survived
  that because its only extern was in head position; Mss exhausted the heap.
* **Runtime state is defined once.**  The `fn_hp`/`fn_sv` block in
  `fun_macros.S` is now guarded by `FN_EXTERN_STATE`, which the module objects
  define and the runtime object does not -- the C rule that a header declares
  and one translation unit defines.  Symbols the runtime kept file-local
  (`fn_tmp`, `_caf_overflow`) had to be exported.

### 9.4 What this does not yet buy

Compile TIME is unchanged: compiling a module with `-c` still typechecks its
imports from source, because typechecking Fib needs NanoPrelude's types.  The
fixed cost measured in section 8.2 is untouched until an interface artifact
exists.  What section 9 buys is the structure that makes it possible -- and
the interface need not be the serialized cache that dead-ends on
`IO.serialize`: signatures in ordinary Haskell syntax, which mhs already
prints and already parses, carried in a non-loaded section beside the code.

---

## 10. Interfaces: not recompiling the prelude

Section 9 gave every module its own object but left compile TIME alone,
because typechecking a program still needs its imports' types and the only
place those existed was the source.  `mhs -c` now writes `<module>.hi.hs`
beside the object, and `-hi` satisfies an import from it.  If there is no
interface the module is compiled from source exactly as before, so a tree that
has never been built still builds.

The interface is ordinary Haskell: the module header and imports copied
verbatim, the type and fixity declarations as written, and one signature per
value the module defines -- with no body under it, which is the shape a
`.hs-boot` file already has.  Nothing new had to learn to read it, which is
the whole reason it is not the serialized cache that dead-ends on
`IO.serialize`.

### 10.1 Compiling Fib with the self-hosted compiler

| | reductions | vs monolithic |
|---|---:|---:|
| monolithic | 32,045,296 | -- |
| `-c -hi`, interface carries dummy bodies | 29,540,365 | -7.8% |
| ... and the interface's bodies are not desugared | 25,921,321 | -19.1% |
| ... and the interface has no bodies at all | **20,003,864** | **-37.6%** |

Each step removes work that was only ever thrown away.  A dummy body exists so
a name is something; it is never emitted, because the importer emits a link to
the object.  Not desugaring them saved 12%; not writing them at all saved
another 23%, since they were being parsed either way.

Against the 50,079,495 this session started from, compiling Fib now costs
**20,003,864** reductions: **-60.1%**.

### 10.2 Gate

17 flite programs, each built as six objects and linked, against interfaces:
every answer correct, and 15 of 17 execute the identical reduction count.
The two that move are Ordlist 13,488 -> 13,491 and Clausify 92,060 -> 92,065.
That is the price of separate compilation and it was predicted: a constructor
that used to be spliced across the module boundary -- `Data.List_Type.[]` --
is now an extern link, because the interface has no body to splice.  Three and
five reductions.

### 10.3 What the interface has to get right

Round-tripping types through source syntax found four printer bugs, each of
which produced a file that would not read back:

* `forall .` with no binders, from a constructor with no type variables.
* An unresolved kind metavariable, `(a::_a56)`.  The annotation goes, and the
  parens with it -- a parenthesised binder is exactly the form that REQUIRES a
  kind.
* A constructor written as an operator printed bare: `data [] a = [] | : a [a]`
  has to be `(:) a [a]`.  Fixed in `ppConstr`, so every printer benefits.
* `import Prelude()` -- import the module, take nothing -- printed as `import
  Prelude`, which takes everything and made NanoPrelude's import graph a cycle.
  The header and the imports are copied verbatim from the source text instead;
  the header also carries the export list, which a regenerated `module M where`
  would lose.

And one that is not a printer bug: a signature is emitted only for what the
module DEFINES.  NanoPrelude re-exports `Data.List_Type.concatMap`; declaring
it in the interface too defines a second, different `concatMap`, and every use
is ambiguous.

The module being compiled is never satisfied from an interface -- it is the
one we are here to compile.  Nothing is on the working list yet exactly when
that is the case, which is how it is told apart.

---

## 11. Reading only the signatures the program can use

With `-hi` the root is the only module read as source; everything else arrives
as an interface.  So every value the program can name is an identifier
somewhere in the root's text, and a signature whose name is not there cannot be
referenced by anything.  Compiling Fib, 213 of the 216 signatures on offer are
for names it never says.

The measured ceiling first: interfaces hand-pruned to exactly what Fib needs
cost **2,608,344** reductions against 20,003,864 for the full ones -- a 7.7x
prize, all of it spent elaborating signatures nothing asks for.

`compileCacheTop` now reads the root once, takes its token set, and drops the
signature lines no token matches.  Everything else in the interface is kept:
header, imports, data, class and fixity declarations carry the structure the
kept signatures are written in terms of.

| | reductions | |
|---|---:|---|
| monolithic | 32,045,296 | |
| `-c -hi`, whole interfaces | 20,003,864 | -37.6% |
| `-c -hi`, only the signatures that can be used | **5,008,013** | **-84.4%** |
| hand-pruned interfaces (the floor) | 2,608,344 | -91.9% |

Compiling Fib cost **50,079,495** reductions at the start of this work and
costs **5,008,013** now: **-90.0%**, within 1.9x of the floor.

### 11.1 Why operators are always kept

The token set is an over-approximation of what the source says, but the
DESUGARER names things the source does not: `fact 0 = 0` compiles to a use of
`(==)` that appears nowhere in Factorial.hs, and the suite caught exactly that.
The sites that insert names are spread across the compiler, so a list of them
is a list to get wrong.

Operators are kept unconditionally instead -- 23 of them in NanoPrelude, none
in Primitives -- which costs almost nothing and removes the whole class of
mistake, since what the desugarer reaches for is operators.  A miss is a
compile error naming the value, never a wrong program.

### 11.2 Gate

The 17 programs of section 9, rebuilt: every answer correct, 15 of 17 identical
reduction counts, Ordlist and Clausify still at the +3 and +5 of section 10.2.
Objects are byte-identical to the ones built against whole interfaces.
