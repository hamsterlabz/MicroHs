# rv64g benchmark results

The fun graph-reduction runtime compiled for a stock RV64GC host: every
`fn.*` is an assembly macro, every cell -- whether the compiler emitted it or
a reduction allocated it -- is RV64 instructions, and every transfer is a
plain jump.  There is no interpreter.  A mark-compact collector is linked
alongside the program object and parses that code heap directly.

Measured on `rv` (SpacemiT RV64GC, Bianbu Linux) with the hardware counters
via `perf stat -e instructions,cycles`; wall time and peak RSS from
`/usr/bin/time`.  `reductions` is the combinator reductions the run performed,
counted in the runtime past each routine's arity gate, so a NORMAL_FORM bail
is not counted.  `insn/red` divides total host instructions by that count, so
it charges ALL the work between reductions -- walking link cells, entering
boxes, the arithmetic and comparison blobs, IO -- to the reductions that
bracket it.  It is a cost-per-reduction figure, not the size of a reduction.
`gc` is the number of collections.  `result` is the value the program
produced -- a 32-bit Int, printed signed.

## flite (25/25)

| benchmark | instructions | reductions | insn/red | IPC | seconds | peak RSS | gc | result |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| TreeSum | 115,903,505 | 114,682 | 1011 | 0.35 | 0.28 | 10.9 MB |  | 16383 |
| Clausify | 92,897,449 | 92,059 | 1009 | 0.39 | 0.23 | 10.5 MB |  | 0 |
| Mss | 72,156,616 | 69,975 | 1031 | 0.34 | 0.19 | 8.8 MB |  | 210 |
| Whilex | 48,162,582 | 47,614 | 1012 | 0.37 | 0.15 | 8.6 MB |  | 2 |
| Queens | 48,080,432 | 48,191 | 998 | 0.35 | 0.15 | 8.8 MB |  | 4 |
| Braun | 45,996,099 | 54,574 | 843 | 0.36 | 0.14 | 8.8 MB |  | 1 |
| Taut | 26,504,957 | 29,936 | 885 | 0.34 | 0.12 | 8.8 MB |  | 1 |
| TreePari | 26,404,926 | 30,451 | 867 | 0.34 | 0.13 | 8.9 MB |  | 42 |
| Knuthbendix | 20,804,962 | 21,040 | 989 | 0.34 | 0.12 | 8.6 MB |  | 4792 |
| Adjoxo | 19,587,944 | 18,886 | 1037 | 0.37 | 0.11 | 8.9 MB |  | 88 |
| SumEuler | 18,937,655 | 16,722 | 1132 | 0.34 | 0.11 | 8.8 MB |  | 277 |
| Countdown | 16,153,341 | 14,870 | 1086 | 0.35 | 0.10 | 8.8 MB |  | 4 |
| Queens2 | 15,382,150 | 15,163 | 1014 | 0.34 | 0.10 | 8.8 MB |  | 10 |
| TribeLie | 12,877,960 | 11,483 | 1121 | 0.33 | 0.09 | 8.8 MB |  | 48 |
| Ordlist | 12,615,450 | 13,489 | 935 | 0.33 | 0.09 | 8.8 MB |  | 1 |
| Permsort | 12,597,344 | 11,759 | 1071 | 0.34 | 0.09 | 8.8 MB |  | 6 |
| PerfDemo | 11,895,898 | 7,894 | 1507 | 0.32 | 0.10 | 8.8 MB |  | 987 |
| KnuthbendixN | 11,784,585 | 10,558 | 1116 | 0.33 | 0.09 | 8.8 MB |  | 4792 |
| Sumpuz | 8,207,042 | 6,617 | 1240 | 0.31 | 0.09 | 8.8 MB |  | 0 |
| Fibonacci | 3,701,514 | 1,150 | 3219 | 0.28 | 0.08 | 8.8 MB |  | 144 |
| Map | 3,046,723 | 818 | 3725 | 0.28 | 0.07 | 8.6 MB |  | 1275 |
| Factorial | 2,491,834 | 326 | 7644 | 0.27 | 0.08 | 8.8 MB |  | 3240 |
| Fib | 2,334,721 | 38 | 61440 | 0.25 | 0.09 | 8.8 MB |  | 5 |
| Fib5 | 2,258,553 | 62 | 36428 | 0.27 | 0.10 | 8.8 MB |  | 8 |
| List | 1,927,951 | 6 | 321325 | 0.25 | 0.08 | 8.9 MB |  | 1 |

## nofib (35/35)

| benchmark | instructions | reductions | insn/red | IPC | seconds | peak RSS | gc | result |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| Puzzle | 232,416,787,934 | 85,366,631 | 2723 | 0.73 | 198.32 | 106.2 MB | 188 | 2794 |
| Fish | 15,723,238,009 | 3,728,499 | 4217 | 0.75 | 13.22 | 123.4 MB | 9 | 169363 |
| Cryptarithm2 | 6,580,481,264 | 5,187,823 | 1268 | 0.50 | 8.27 | 34.2 MB | 14 | 1600636935 |
| Multiplier | 4,865,202,691 | 3,298,312 | 1475 | 0.55 | 5.67 | 37.6 MB | 9 | -323266598 |
| GenRegexps | 1,956,426,052 | 706,655 | 2769 | 0.65 | 1.95 | 45.0 MB | 2 | -284189200 |
| Minimax | 1,078,298,426 | 814,918 | 1323 | 0.50 | 1.44 | 34.4 MB | 2 | -689369074 |
| Treejoin | 778,881,118 | 388,543 | 2005 | 0.55 | 0.95 | 35.1 MB | 1 | -1045539005 |
| Cryptarithm1 | 612,362,733 | 304,109 | 2014 | 0.51 | 0.83 | 34.2 MB | 1 | 90344 |
| Awards | 238,598,660 | 251,074 | 950 | 0.36 | 0.49 | 25.2 MB |  | -283987732 |
| LastPiece | 183,969,016 | 177,810 | 1035 | 0.37 | 0.40 | 19.8 MB |  | 1292284983 |
| Calendar | 168,073,484 | 177,304 | 948 | 0.35 | 0.38 | 17.4 MB |  | 92416 |
| Mandel2 | 119,892,789 | 101,590 | 1180 | 0.35 | 0.29 | 12.5 MB |  | 1 |
| Cichelli | 113,971,458 | 117,914 | 967 | 0.34 | 0.30 | 12.0 MB |  | -1928824954 |
| Sphere | 76,014,321 | 63,511 | 1197 | 0.33 | 0.22 | 8.8 MB |  | 542619602 |
| Constraints | 52,395,200 | 59,071 | 887 | 0.34 | 0.18 | 8.8 MB |  | 536838146 |
| Ansi | 39,528,996 | 36,516 | 1083 | 0.35 | 0.14 | 8.8 MB |  | 1359627558 |
| Lambda | 30,218,484 | 31,332 | 964 | 0.36 | 0.13 | 8.8 MB |  | 1517948412 |
| Mandel | 27,176,833 | 19,419 | 1399 | 0.34 | 0.12 | 8.8 MB |  | -11851636 |
| Cse | 16,260,166 | 15,748 | 1033 | 0.33 | 0.10 | 8.6 MB |  | 1874194485 |
| Integrate | 16,152,438 | 11,224 | 1439 | 0.34 | 0.12 | 8.8 MB |  | 0 |
| NQueens | 13,831,058 | 11,992 | 1153 | 0.35 | 0.10 | 8.8 MB |  | 10 |
| Sorting | 12,052,217 | 10,067 | 1197 | 0.33 | 0.09 | 8.8 MB |  | -1203824192 |
| Lcss | 10,709,484 | 8,867 | 1208 | 0.33 | 0.09 | 8.6 MB |  | 1238125097 |
| X2n1 | 8,727,362 | 4,353 | 2005 | 0.31 | 0.09 | 8.8 MB |  | 6 |
| Life | 7,984,919 | 5,780 | 1381 | 0.32 | 0.09 | 8.8 MB |  | 81 |
| Scc | 6,026,256 | 4,143 | 1455 | 0.31 | 0.07 | 8.8 MB |  | -1246620538 |
| PrettyN | 5,624,203 | 3,203 | 1756 | 0.31 | 0.09 | 8.6 MB |  | -176409602 |
| Exp3_8 | 5,258,642 | 3,986 | 1319 | 0.30 | 0.09 | 8.6 MB |  | 81 |
| Tak | 5,078,734 | 3,078 | 1650 | 0.31 | 0.07 | 8.8 MB |  | 6 |
| RFib | 4,932,035 | 2,152 | 2292 | 0.28 | 0.09 | 8.8 MB |  | 287 |
| Kahan | 4,290,405 | 1,627 | 2637 | 0.28 | 0.07 | 8.8 MB |  | 14 |
| Atom | 4,027,768 | 1,730 | 2328 | 0.28 | 0.07 | 8.8 MB |  | -1338171588 |
| Primes | 3,885,588 | 1,789 | 2172 | 0.29 | 0.08 | 8.8 MB |  | 41 |
| WheelSieve2 | 3,721,200 | 1,416 | 2628 | 0.27 | 0.07 | 8.8 MB |  | 31 |
| WheelSieve1 | 3,230,204 | 855 | 3778 | 0.26 | 0.07 | 8.6 MB |  | 31 |

## gadt (12/12)

| benchmark | instructions | reductions | insn/red | IPC | seconds | peak RSS | gc | result |
|---|---:|---:|---:|---:|---:|---:|---:|---:|
| QuadTreePure | 82,908,800 | 79,662 | 1041 | 0.35 | 0.23 | 9.0 MB |  | 1255315216 |
| MergeSortPure | 47,859,646 | 46,980 | 1019 | 0.36 | 0.15 | 8.8 MB |  | -26356897 |
| ChurchPure | 44,533,855 | 50,543 | 881 | 0.33 | 0.16 | 8.6 MB |  | -649613890 |
| InsertSortPure | 41,079,927 | 42,270 | 972 | 0.37 | 0.15 | 8.8 MB |  | -26356897 |
| HeapSortPure | 36,738,856 | 33,950 | 1082 | 0.37 | 0.14 | 8.8 MB |  | -26356897 |
| QueuePure | 20,910,963 | 18,737 | 1116 | 0.35 | 0.11 | 8.8 MB |  | -1316886862 |
| BTreePure | 20,375,824 | 17,354 | 1174 | 0.36 | 0.12 | 8.6 MB |  | 1086800167 |
| PatriciaPure | 20,282,613 | 15,944 | 1272 | 0.34 | 0.11 | 8.6 MB |  | 889214830 |
| ListPure | 18,457,225 | 14,295 | 1291 | 0.34 | 0.12 | 8.9 MB |  | -188677176 |
| ZipperPure | 15,065,652 | 13,198 | 1142 | 0.34 | 0.10 | 8.6 MB |  | 739504078 |
| RoseTreePure | 9,433,491 | 6,999 | 1348 | 0.32 | 0.09 | 8.6 MB |  | 2111870790 |
| TuplePure | 3,295,201 | 762 | 4324 | 0.26 | 0.08 | 8.8 MB |  | -1638190443 |

## Totals

| | |
|---|---:|
| programs | 72 |
| instructions | 266,206,964,393 |
| cycles | 374,183,939,480 |
| combinator reductions | 101,902,098 |
| host instructions per reduction | 2612 (see note) |
| wall time | 239 s |
| peak RSS (max over programs) | 123 MB |
| collections | 226 passes across 8 programs |

## Heap and collection

| | |
|---|---|
| mapping | `mmap(0x20000000, 134217728, RWX, MAP_FIXED_NOREPLACE)` |
| heap size | 128 MB (`0x20000000`-`0x28000000`) |
| first collection due at | base + 32 MB |
| pacing after that | 2x the live set, clamped to [32 MB, heap/2] |

| program | passes | live at last pass | words freed |
|---|---:|---:|---:|
| Puzzle | 188 | 9,431,801 (36 MB) | 1,938,296,855 |
| Cryptarithm2 | 14 | 21,835 (0 MB) | 117,418,921 |
| Fish | 9 | 14,675,809 (56 MB) | 89,476,069 |
| Multiplier | 9 | 705,207 (3 MB) | 74,792,423 |
| GenRegexps | 2 | 4,025,581 (15 MB) | 12,751,649 |
| Minimax | 2 | 10,229 (0 MB) | 16,767,018 |
| Cryptarithm1 | 1 | 343,594 (1 MB) | 8,045,034 |
| Treejoin | 1 | 1,378,050 (5 MB) | 7,010,583 |

## Notes

* Every flite answer is byte-identical to the run made before the runtime was
  rewritten to native code, which is the main correctness check on that change.
* `HeapSortPure`, `InsertSortPure` and `MergeSortPure` agree exactly
  (-26356897): three different algorithms, one sorted-output hash.
* The reduction counter costs four instructions per reduction, so the
  instruction counts here are about 1% above an uncounted build.
* Start-up is roughly 1.9 M instructions -- mapping the heap, making the image
  writable and faulting it in.  That floor dominates the small programs: `List`
  performs 6 reductions inside 1.93 M instructions, so its 321,325 insn/red
  says nothing about reduction cost.  Read `insn/red` only for the programs
  that do real work.
* Across the 14 programs performing more than 100k reductions, cost per
  reduction runs from 948 (Calendar) to 4217 (Fish), aggregating to about 2630.
  The spread is the mix: programs heavy in arithmetic and list walking spend
  most of their instructions between reductions rather than in them.
* `ClausifyN` was dropped from the nofib suite (`funboot/suites/dropped/`).
  `funboot/repro/V6.hs` is a 12-line reproducer for the loop it hit.
