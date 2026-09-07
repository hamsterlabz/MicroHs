# Self-compilation and suite results

mhs64 is the compiler compiled to the rv64 fun target and run on the reducer.
All figures are `fun: reductions` unless a time is given.  Everything here was
produced with `-c -hi`: one object per module, imports satisfied from the
interface written beside each object.

## 1. Interface round-trip

Every module writes `<module>.hi.hs` and every module is then compiled against
the interfaces, with the GHC-built compiler.  This is the gate: mhs64 is not
worth running until it passes.

```
TOTAL ok=148 fail=0
```

Eight bugs had to be fixed to get there, all found by running this check rather
than by running the self-compile:

| bug | what it produced |
|---|---|
| partial operator application | `Functor ((a ->))` for `(->) a` |
| multi-line import lists cut off | `import Data.List(map,` and nothing after |
| two imports on one line | `import Prelude(); import MHSPrelude` -- MHSPrelude never seen |
| closure walk stopped at interfaces | hid `import Text.Show(showChar)` behind one |
| qualified-only imports | `undefined type: IntMap` -- types print unqualified |
| operator type constructors | `type :~: ::`, `data :~: a b` |
| tuple constructor | `instance Typeable ,` |
| empty file left on a throw | `MiniPrelude` read as a nameless module, 13 cascades |

## 2. mhs64 self-compile

The compiler compiling its own modules, one object at a time, in dependency order.
Before this work mhs64 could not compile MicroHs at all: the whole-program compile
exhausts the 128 MiB heap, at `-O0` as well, so it was never a question of the
optimizer.  Per module, it fits.

| | |
|---|---:|
| modules compiled | **32** |
| modules timed out | 1 |
| wall clock | 3612 s |
| reductions | 1,307,400,209 |

### Per module

| module | s | reductions |
|---|---:|---:|
| Data.Bool_Type | 0 | 278,766 |
| Data.Ordering_Type | 1 | 325,911 |
| Primitives | 68 | 38,867,655 |
| Data.Function | 9 | 6,358,756 |
| Data.Functor | 14 | 9,027,182 |
| Data.Bounded | 14 | 8,594,924 |
| Data.Eq | 9 | 5,802,143 |
| Data.List_Type | 7 | 4,380,404 |
| Data.Char_Type | 5 | 3,643,685 |
| Text.Show | 11 | 7,484,664 |
| Data.Ord | 27 | 17,233,231 |
| Data.Bool | 21 | 13,046,340 |
| Data.Int.IntN | 6 | 4,031,456 |
| Data.Integer_Type | 20 | 12,810,915 |
| Data.Maybe_Type | 0 | 303,451 |
| Control.Exception.Internal | 47 | 27,290,558 |
| Control.Error | 22 | 14,208,176 |
| Data.Num | 38 | 21,399,066 |
| Data.Ratio_Type | 9 | 5,972,128 |
| Data.Real | 24 | 15,401,109 |
| Data.Integral | 99 | 54,373,484 |
| Data.Int | 53 | 30,591,347 |
| Data.Functor.Const_Type | 47 | 27,084,239 |
| Control.Applicative | 76 | 42,588,708 |
| Data.List.NonEmpty_Type | 0 | 254,787 |
| Data.Proxy | 13 | 8,709,444 |
| Data.Records | 26 | 16,025,090 |
| Data.Monoid.Internal | 557 | 234,136,275 |
| Data.Char | 79 | 44,459,117 |
| Data.Tuple | 716 | 323,255,424 |
| Data.List | 485 | 212,006,058 |
| Data.String | 209 | 97,455,716 |
| Data.Text | 900 | timeout |

### Where it stops

`Data.Text` is 66 lines with 6 instances and does not finish in 15 minutes,
while `Data.String` -- comparable size -- takes 209 s.  The difference is the
import: `Data.String` names five modules directly, `Data.Text` imports
`MiniPrelude`, which re-exports 23 modules.  Compiling against a re-export hub
pulls its whole closure, roughly a hundred interfaces, and the name filter
cannot prune any of it because the hub's export list mentions everything.

So the interface scheme scales with a small prelude -- the flite programs below
compile in seconds -- and does not yet scale to the compiler's own module graph,
where every module imports `MHSPrelude`.  That is the next thing to fix, and it
is a real interface system rather than a lexical filter.

## 3. Suites

### flite -- 62 programs, 0 failed

| program | reductions | result |
|---|---:|---|
| Adjoxo | 18,921 | 88 |
| Braun | 54,570 | 1 |
| BraunMorphM | 41,054 | 1 |
| Clausify | 92,060 | 0 |
| ClausifyHylo | 80,572 | 0 |
| Countdown | 14,759 | 4 |
| Exp38MorphC | 88,999 | 6561 |
| Exp38MorphM | 72,464 | 6561 |
| Exp38Pure | 24,235,158 | 6561 |
| Factorial | 325 | 3240 |
| Fib5 | 61 | 8 |
| Fib5MorphM | 40 | 8 |
| Fib | 37 | 5 |
| FibMorphM | 32 | 5 |
| Fibonacci | 1,149 | 144 |
| FibonacciMorphM | 88 | 144 |
| ISortNaive | 17,597 | 5050 |
| Knuthbendix | 19,923 | 4792 |
| KnuthbendixN | 10,546 | 4792 |
| List | 2 | 1 |
| Map | 817 | 1275 |
| MapMorphM | 407 | 1275 |
| MSortMorphM2 | 10,810 | 5050 |
| MSortNaive | 17,242 | 5050 |
| Mss | 70,794 | 210 |
| MssMorphM | 1,082 | 210 |
| Ordlist | 13,488 | 1 |
| OrdlistMorphM | 9,001 | 1 |
| PerfDemo | 7,893 | 987 |
| PerfDemoMorphM | 120 | 987 |
| Permsort | 11,758 | 6 |
| QSortMorphM | 12,091 | 5050 |
| QSortNaive | 16,333 | 5050 |
| Queens2 | 15,162 | 10 |
| Queens2MorphM | 14,405 | 10 |
| QueensBits | 5,820 | 4 |
| Queens | 48,190 | 4 |
| Scale40 | 2 | 820 |
| Scale80 | 2 | 3240 |
| ScaleA0 | 2 | 1 |
| ScaleA160 | 2 | 160 |
| ScaleA40 | 2 | 40 |
| ScaleA80 | 2 | 80 |
| ScaleA | 2 | 80 |
| ScaleB | 2 | 3240 |
| ScaleC | 2 | 1 |
| SumEuler | 16,721 | 277 |
| SumEulerMorphM | 13,379 | 277 |
| Sumpuz | 6,616 | 0 |
| Taut | 29,945 | 1 |
| TautMorphM | 24,764 | 1 |
| Tiny | 2 | 1 |
| TreePariFused | 154 | 42 |
| TreePari | 30,449 | 42 |
| TreePariMorphM | 24,421 | 42 |
| TreeSumFused | 70 | 16383 |
| TreeSum | 114,681 | 16383 |
| TreeSumMorphM | 65,628 | 16383 |
| TribeLie | 11,482 | 48 |
| TribeLieMorphM | 10,710 | 48 |
| TSortMorphM | 10,011 | 5050 |
| Whilex | 47,613 | 2 |

### nofib -- 40 programs, 0 failed

| program | reductions | result |
|---|---:|---|
| Ansi | 36,514 | 1359627558 |
| Atom | 1,784 | -1338171588 |
| Awards | 225,844 | -283987732 |
| Calendar | 174,031 | 92416 |
| Cichelli | 117,843 | -1928824954 |
| Constraints | 58,336 | 536838146 |
| Cryptarithm1 | 304,118 | 90344 |
| Cryptarithm2 | 5,190,301 | 1600636935 |
| Cse | 15,711 | 1874194485 |
| Exp3_8 | 3,985 | 81 |
| Fish | 3,728,498 | 169363 |
| GenRegexps | 706,654 | -284189200 |
| Integrate | 11,222 | 0 |
| Kahan | 1,662 | 14 |
| Lambda | 31,140 | 1517948412 |
| LastPiece | 177,979 | 1292284983 |
| Lcss | 8,888 | 1238125097 |
| Life | 5,855 | 81 |
| Mandel2 | 108,861 | 1 |
| Mandel | 19,417 | -11851636 |
| Minimax | 920,934 | -689369074 |
| MinimaxLines | 172,656 | -689369074 |
| Multiplier | 558,207 | -323266598 |
| NQueensBits | 1,866 | 10 |
| NQueens | 11,991 | 10 |
| NQueensMorphM | 10,691 | 10 |
| PrettyN | 3,426 | -176409602 |
| Primes | 1,788 | 41 |
| PuzzleBits | 42,209,749 | 2794 |
| Puzzle | 83,727,144 | 2794 |
| PuzzleInt | 25,771,467 | 2794 |
| RFib | 2,151 | 287 |
| Scc | 4,122 | -1246620538 |
| Sorting | 10,110 | -1203824192 |
| Sphere | 63,614 | 542619602 |
| Tak | 3,077 | 6 |
| Treejoin | 393,636 | -1045539005 |
| WheelSieve1 | 809 | 31 |
| WheelSieve2 | 1,415 | 31 |
| X2n1 | 4,298 | 6 |

### gadt -- 68 programs, 0 failed

| program | reductions | result |
|---|---:|---|
| BTreeMorph | 20,153 | 1086800167 |
| BTreeMorphM | 17,153 | 1086800167 |
| BTreeMorphXFix | 24,232 | 1086800167 |
| BTreeMorphX | 20,237 | 1086800167 |
| BTreePure | 17,353 | 1086800167 |
| ChurchMorph | 423,628 | -649613890 |
| ChurchMorphM | 198,766 | -649613890 |
| ChurchMorphXBB | 302,890 | -649613890 |
| ChurchMorphXFix | 635,471 | -649613890 |
| ChurchMorphX | 424,004 | -649613890 |
| ChurchPure | 198,726 | -649613890 |
| HeapSortMorph | 36,286 | -26356897 |
| HeapSortMorphM | 33,948 | -26356897 |
| HeapSortMorphXFix | 40,984 | -26356897 |
| HeapSortMorphX | 35,768 | -26356897 |
| HeapSortPure | 33,949 | -26356897 |
| InsertSortMorph | 59,253 | -26356897 |
| InsertSortMorphM | 42,269 | -26356897 |
| InsertSortMorphXFix | 96,899 | -26356897 |
| InsertSortMorphX | 75,182 | -26356897 |
| InsertSortPure | 42,269 | -26356897 |
| ListMorph | 16,741 | -188677176 |
| ListMorphM | 12,565 | -188677176 |
| ListMorphXFix | 23,088 | 1772084490 |
| ListMorphX | 18,833 | 1772084490 |
| ListPure | 14,282 | -188677176 |
| MergeSortMorph | 49,253 | -26356897 |
| MergeSortMorphM | 45,193 | -26356897 |
| MergeSortMorphXFix | 48,496 | -26356897 |
| MergeSortMorphX | 48,493 | -26356897 |
| MergeSortPure | 45,191 | -26356897 |
| PatriciaMorph | 19,535 | 889214830 |
| PatriciaMorphM | 15,730 | 889214830 |
| PatriciaMorphXFix | 22,937 | 889214830 |
| PatriciaMorphX | 19,837 | 889214830 |
| PatriciaPure | 15,923 | 889214830 |
| QuadTree2Morph | 70,014 | 1255315216 |
| QuadTree2Pure | 57,557 | 1255315216 |
| QuadTreeMorph | 90,763 | 1255315216 |
| QuadTreeMorphM | 77,723 | 1255315216 |
| QuadTreeMorphXFix | 109,540 | 1255315216 |
| QuadTreeMorphX | 93,861 | 1255315216 |
| QuadTreePure | 81,575 | 1255315216 |
| QueueMorph | 20,091 | -1316886862 |
| QueueMorphM | 17,807 | -1316886862 |
| QueueMorphXFix | 19,534 | -1316886862 |
| QueueMorphX | 17,239 | -1316886862 |
| QueuePure | 18,740 | -1316886862 |
| QuickSortMorph | 39,718 | -26356897 |
| QuickSortMorphM | 35,587 | -26356897 |
| QuickSortMorphXFix | 38,688 | -26356897 |
| QuickSortMorphX | 38,685 | -26356897 |
| QuickSortPure | 35,331 | -26356897 |
| RoseTreeMorph | 7,945 | 2111870790 |
| RoseTreeMorphM | 6,637 | 2111870790 |
| RoseTreeMorphXFix | 10,544 | 2111870790 |
| RoseTreeMorphX | 9,393 | 2111870790 |
| RoseTreePure | 6,998 | 2111870790 |
| TupleMorph | 985 | -1638190443 |
| TupleMorphM | 757 | -1749017355 |
| TupleMorphXFix | 862 | -718394882 |
| TupleMorphX | 761 | -718394882 |
| TuplePure | 821 | -1638190443 |
| ZipperMorph | 9,747 | -710464603 |
| ZipperMorphM | 8,469 | -710464603 |
| ZipperMorphXFix | 11,468 | -710464603 |
| ZipperMorphX | 9,833 | -710464603 |
| ZipperPure | 13,197 | 739504078 |

