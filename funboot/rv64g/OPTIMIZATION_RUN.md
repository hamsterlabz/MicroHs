# Optimization run — mhs fun/rv64 backend

What was changed, what it was measured at, and what turned out to be wrong.
Every number here came from running the thing, not from reading it.

The target of the exercise: **reduction count**. The rv64 build is a mockup for
the RTL, so cycles per reduction are an artefact of this host and not worth
optimizing; the number that carries over is how many combinator dispatches a
program performs.

---

## 1. The bootstrap

`mhs64` — MicroHs compiled to a fun graph, assembled, linked, and running as
native RV64 code — compiles Fib and Adjoxo and produces **byte-for-byte the
same assembly** as the GHC-built compiler.

| program | source | graph out | reductions | wall |
|---|---|---|---|---|
| Fib | ~20 lines | 1,744 B | 52,678,181 | 1m47s |
| Adjoxo | 96 lines | 15,674 B | 833,749,892 | ~58m |

Four bugs stood between the runtime and this, none of which any existing test
could have caught:

**Unreachable FFI stubs.** `ffiNames` scanned every definition handed to the
backend rather than the ones reachable from `main`, so `main = return ()`
emitted `_unimpfi_acos`, `calloc`, `free` and 117 more it cannot call. Empty
main 14,621 → 6,180 bytes. This was also the stall: `mhs64` froze at exactly
the byte where that section begins, because building it walked the whole
library's ASTs as graph reduction.

**The `gp` bug.** GCC reached `fn_sv` through the RISC-V small-data pointer
(`addi a4,gp,-2040`) and the assembly `_start` never sets `gp`, so the
collector dereferenced garbage the first time it ever ran. Built with
`-msmall-data-limit=0`. Nothing caught it because the first collection is due
at 32 MB and no benchmark allocates that much — `gc_roots` had never executed.

**`showHex` case.** Lowercase under GHC, uppercase under mhs, so a
self-compiled compiler mangled `addiw -1` as `$2D1` where a GHC-built one wrote
`$2d1`. The compiler's output depended on which compiler built it. This is the
bug a bootstrap exists to find.

**`nub` after `sort`** in `ffiText` — quadratic and redundant.

---

## 2. Compiler speed

The fun backend was an order of magnitude slower than the C backend on the same
program and the same machine. None of it was inherent: the C backend lays out
no addresses, so it never had these lookups to do.

| | before | after |
|---|---|---|
| `inlineSingle` | rewrote the whole program per atom — O(atoms × program) | one resolve pass |
| `baseOf` | `starts !! k` per block *and* per pointer arg | array |
| `nameOf` | assoc-list `lookup`, per emitted word | search tree |
| `linkTargets` | `elem` over a whole-program list, per emitted word | search tree |
| `varHole` | Catalan by exponential recurrence, 3× per combinator | table |
| `blockSize` | built every literal's words to count them | `litWordCount` |
| `noDup` | `notElem` against the rest, per combinator | one bitmask pass |
| combi routines | all six base slots always materialized | only those the recipe reads |

Knuthbendix compile **28.8 s → 13.3 s**. The self-compile went from **70+
minutes unfinished to ~10 minutes complete**. The label lookups became trees
rather than arrays because labels are sparse: an array spanning the address
space cost a cons per word of the image before the first line could print.

Where the time goes now, on Knuthbendix: 11.8 s shared frontend (which the C
backend pays too), 3.1 s fun backend. The backend is 21% of the compile.

---

## 3. Compiled programs — the optimization levels

Inlining before abstraction is what lets the unifier fuse combinators that a
link would otherwise separate. Doing it *after* abstraction — where
`inlineSingle` already did it — only deletes a block boundary and leaves the
dispatch count alone. That was measured: a wash on every benchmark.

* `-O0` — no pre-abstraction inlining
* `-O1` — atoms at every use, plus single-use bodies ≤ 8 nodes. Never regressed
  on anything measured. **Default.**
* `-O2` — same with a larger size cap
* `-O3` — additionally picks the abstraction per binding: abstract both ways,
  keep the one with fewer combinators, for bindings in a recursive group

| bench | -O0 | -O1 | -O2 | -O3 |
|---|---|---|---|---|
| Ordlist | 13,489 | 13,488 | 12,697 | **12,459 (−7.6%)** |
| Taut | 29,936 | 29,935 | 28,745 | **28,111 (−6.1%)** |
| Knuthbendix | 21,040 | 20,617 | 20,346 | **20,326 (−3.4%)** |
| Mss | 69,975 | 69,974 | **69,068 (−1.3%)** | 69,068 |
| Fib | 38 | **37** | 37 | 37 |
| Braun | 54,574 | 54,570 | **54,569** | 54,569 |
| Queens | 48,191 | **48,190** | 48,517 | 48,517 |

Queens prefers `-O1`: its bodies overflow the combinator word once spliced, and
the unifier falls back to `addSc`, which spends more than the link it saved.
That is what the levels are for.

### How `-O3`'s rule was found

`--lazy` over a whole program is worth −26% on Knuthbendix and 18–25% *worse*
on Braun, Mss and Queens. Bisecting Knuthbendix's 92 functions found the win is
**one function**: `{-# LAZY completionLoop #-}` alone is worth −7%, and the
other five in its group are worth nothing. So the choice belongs per binding.

The condition is membership in a **recursive group**, not self-recursion:
`completionLoop` recurses through `completionWith`, and testing its own free
variables alone misses it. The walk carries a visited set — without one it
revisits shared callees combinatorially and compiling Taut does not finish.

---

## 4. What was tried and did not work

Recorded because the negative results were as expensive as the positive ones.

**A catamorphism instead of `combineSc`'s search.** A structured combinator is
an application tree with holes, so abstraction should need no search: take the
tree's shape as the pattern and point each hole at x or at the subterm. Built
it, got it correct, measured it: **25–80% worse** (Mss 69,975 → 126,242). The
flat fold discards what `combineSc`'s cases actually buy — argument sharing,
`absorb` merging one pattern into another, the eta paths that remove arguments
entirely. Those guards are a cost model, not a search standing in for an
algebra.

**Collector work.** Three separate changes proposed on reasoning and rejected
on measurement: `MAXOBJ`, and `objspan` twice — the second time it was **28%
slower** (107 s → 137 s), because `objsize` exits early on small objects while a
bitmap walk cannot. `fun_gc.c` is not the bottleneck.

**`fence.i`.** Looked like the cost of a native-code heap. Removing all 65:
**8.5%**. Not it.

**`--morph`.** Morphisms do count as one combinator, but a cata reduct writes 8
cells and a hylo 9, against a select's 1. Taut +51%, Mss +15%, Braun +8%,
Ordlist −6.5%. Only the genuinely catamorphic program wins.

---

## 5. Why the rv64 host looks slow (and why it does not matter)

Mss: 69,975 reductions in 210M cycles — 983 instructions and **3,002 cycles**
per reduction, IPC 0.33. The counters say where the rest goes:

```
L1-icache-load-misses   4,052,041     58 per reduction
L1-dcache-load-misses      14,866     idle
branch-misses               1,584
```

Instruction-cache misses are 273× the data-cache misses. The graph is *code*
here, so walking it is an instruction-fetch pattern: each cell entry is an
indirect jump into a cold line, which an I-cache neither prefetches nor holds.
The data cache, which is what a graph walk would otherwise use, does nothing.

That is why an RTL simulation outruns a 1.6 GHz superscalar: the clash CPU
reads fun words as **data**, through the datapath and its r-cache. It is a
property of the representation, not a defect in the runtime, and it bounds what
any tuning inside the routines can recover.

Memory is 3.2× the reference for the same reason — 88 MB against stock
MicroHs's 27 MB — because every reference is a 20-byte code cell where the
reference stores an 8-byte pointer inside a 16-byte node.

---

## 6. Against the reference implementation

Stock MicroHs (SKI, `eval.c`) compiling the same program:

| | reductions |
|---|---|
| stock MicroHs | 1,857,483,928 |
| this compiler | 833,749,892 |

**2.2× fewer.** Caveats stated: stock compiled the `Prelude` variant since
`NanoPrelude` needs our `FloatW`, and a structured dispatch subsumes several
SKI steps by construction. Both narrow a like-for-like, neither erases it.

Sharing was verified directly rather than inferred. `double (fib 5)` where
`double x = x + x`: fib's addition site is entered **7 times** and double's
**once**, for 8 total. Without update it would be 14 + 1. The Turner update
memoizes correctly.

---

## 7. Bugs found in existing code

* `--single-entry` emitted `.word` literals into a code graph — every program
  compiled with it died on SIGILL.
* `--morph` could not compile anything on the full Prelude, including mhs
  itself: `Data.List.NonEmpty.unfold` built its result through `<|`, a
  *function*, where the classifier requires a constructor head. Fixed in the
  library; mhs now compiles with `--morph` (385,218 lines vs 383,940 without).
  The classifier should still *decline* that shape rather than emit a binding
  the desugarer cannot handle — that guard is still owed.
* An inlined primitive was also declared unimplemented: `x + 1` emitted
  `addiw a0,a0,1` *and* a halt stub with its name string. Fib 90 → 74 lines.
* The `-O2` inliner expanded each candidate at every occurrence, so a chain
  cost one pass per occurrence. nofib's Lambda did not finish compiling.
  Resolve-once: 0.99 s at every level.

---

## 8. Open

* Knuthbendix has a *non*-recursive binding that benefits from laziness — the
  unrestricted `-O3` variant reached 19,563 (−7.0%) but cost Taut. Neither
  dominates, so there is more behind a better predictor than "in a recursive
  group".
* Whether morphisms make mhs *faster* — the graph compiles now; the reduction
  count against the 52.68M baseline has not been taken.
* Morphism detection in the frontend: the classifier finds few morphisms in
  code that is mostly folds over syntax trees.
* Aligning the rv64 backend with the rvfun backend.
