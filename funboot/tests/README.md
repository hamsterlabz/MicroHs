# funboot/tests

Two targets, two sets of tests, written for the machine each one runs on.

| Directory | Target | A cell is |
|---|---|---|
| `rvfun/` | the xfun machine (`--bare`, rv32) | a 32-bit word the fetch unit decodes: `fn.combi.t2`, `fn.databox`, raw `.word` encodings |
| `rv64/`  | a stock RV64GC host (`-rv64g`) | a run of instructions the CPU executes: `fn_combi_t2`, `fn_databox` |

## rvfun/

`rvfun/*.S` are whole graphs from the xfun era (hello, put, arr, caf, and the
old `mhs` compiles); `rvfun/mech/*.S` is the mechanism suite, one file per
graph operation.

## rv64/

`rv64/mech/*.S` is the mechanism suite for the native runtime, and it is
**written for that runtime**, not translated from the rvfun side. This matters
because most of what the rvfun tests assert does not exist here:

* there is no fetch line and no per-chunk push cap, so a "chunk" is just
  straight-line code and the tests that walk over those boundaries have
  nothing to walk over -- what carries across is that a long run of link cells
  still pushes every entry, in order;
* a combinator is not a word with bit fields, so a test cannot read one back
  and check the encoding -- what carries across is that the right argument is
  selected, the application is really built, and the root is memoized;
* an over-applied combinator does not trap, because there is no decoder to
  trap: too few arguments means the head cannot reduce, which is normal form.
  `combi_ill` installs its own `fn_nfa` and checks that nothing was consumed,
  counted or allocated;
* the reduct addresses are not `_heap+0,4,8`; cells are 16 or 20 bytes. Where
  the rvfun test asserts an address, the rv64 test asserts the relation the
  address stood for.

Run it with `rv64/run_mech.sh` -- exit status is the protocol: 0 = pass,
otherwise the number of the check that failed. **27 tests, 27 passing**, so
the suite is a gate and not a status report.

`rv64/suites/{flite,nofib,gadt}/*.S` are the compiled graphs for all 72
benchmark programs -- the compiler's own output for each source in
`funboot/suites`, which is what "the rv64 version of a program" means. They
are the graphs that produced the recorded results in
`funboot/rv64g/results/RESULTS.md`; regenerate with
`funboot/rv64g/run_suites.sh`.

## Morphisms

`fn_cata`, `fn_ana`, `fn_para` and `fn_hylo` are implemented on this target
(macros in `funboot/rv64g/fun_macros.S`, routines `_rt_cata` / `_rt_ana` /
`_rt_hylo` in the generated runtime, from `MicroHs.FunBlobs64`). Each rewrites
its redex into a graph containing a reference back to the morphism cell
itself, which is what makes the next layer unfold the same way:

    cata F A x    ->  A (F (cata F A) x)
    para F A x    ->  the same rewrite; the schemes differ only in which cell
                      the back-reference names, and that is the cell itself
    ana  F C s    ->  F (ana F C) (C s)
    hylo F A C s  ->  A (F (hylo F A C) (C s))

hylo is the odd one: its algebra is entered directly and there is **no root
update**, because it consumes its seed rather than replacing it. The seed cell
must still be there afterwards, and `morph_hylo` check 2 is that cell.
