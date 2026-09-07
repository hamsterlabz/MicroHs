# fun-backend bootstrap: state

The goal is mhs compiling itself while running on the fun graph-reduction
machine.  The compiler is built for the machine by `mhs --rvfun-io --rv32`,
which emits the graph ONLY; `funboot/rt_linux.S` is the whole runtime around it.

## Where it stands

* `mhsfun.elf` -- mhs itself, running on the machine -- compiles real modules,
  and its output is byte-identical to what the host gmhs produces for the same
  input (only the header comment, which names the output path, differs).
  Verified on `V1` and `Tiny`.
* Feature suite: `funboot/run_io_tests.sh`, 128 programs, one per runtime
  feature.  All pass.  Expectations for the tests whose output is more than a
  marker line come from `funboot/host_oracle.sh`, which runs the same program
  natively under GHC -- so those are differential tests against the host, not
  hand-written guesses.
* RTL gates unchanged: xfun 54/54, ISA 93/93.

## The four root causes that were in the way

**1. Combinator arity overflow.**  `wCombi` packs arity into 3 bits (max 7),
six argument slots, indices 0..6 (7 is the ROM's "absent" marker).  The
absorbing branch of `combineSc` bounded the hole count but NOT the resulting
arity -- the source even asked, "no bound testing here?".  IdentMap's `balance`
needs arity 8 and MicroHs.Main arity 9, so a corrupt word was emitted silently
and reduced to a two-cell cycle.  The branch is now bounded and `GenRomMem`
REFUSES an oversized word instead of emitting it.  Patterns 0..64 are all legal
(the decoder implements 65 types), so the "avoid pattern 64" dodge was removed.

**2. No evaluation frame.**  `fn.force` pushed a continuation onto a flat spine
with no boundary, so an under-applied WHNF inside the forced expression -- a
partial application, or a Scott constructor, both normal -- consumed the
CALLER's spine.  Fixed the way eval.c's `evali` does it: CSR 0x7c2 holds the
frame base, every depth test is frame-relative, and reaching WHNF at the frame
boundary branches to NF_ADDR.  `_fforce` is the one shared framed forcer; every
generic forcing site goes through it, saving the enclosing frame and the
enclosing forcer's resume on the C stack.

**3. qemu recipe 64 was corrupt.**  Six of ten heap bases scrambled and three
tags flipped, latent until the pattern-64 dodge came out.  It is now
regenerated from the RTL's own `Core/Fun.hs` by `qemu-xfun/gen_recipe.pl`, so
the two machines cannot drift.

**4. No exceptions.**  `catch` installs a record on the C stack -- previous
record, spine depth, C stack, handler, continuation, enclosing frame, enclosing
forcer's resume -- and runs the action with `_catch_done` as its continuation.
`_raise` takes the innermost record, DRAINS the spine down to the recorded
depth (the abandoned action's spine has to go; a frame write alone leaves it,
and the stale entries get re-entered later), restores the rest and runs
`handler e k`.  With no record it reports an uncaught exception and exits.

## Runtime notes worth keeping

* The heap and the C stack are both mmap'd by the KERNEL, not MAP_FIXED.  A
  fixed 1.5 GiB heap covers the loader stack, and MAP_FIXED replaces it
  silently -- taking argv with it, so `getArgs` returned `[]`.
* `mprotect` comes BEFORE the first store into the image.  ld gives the text
  segment write permission only when some input section asks for it, which
  depends on what the graph happens to contain; three tests segfaulted on the
  very first instruction because of that.  Taking the permission explicitly
  removes the dependency.
* The heap is mapped PROT_EXEC: the machine ENTERS heap cells, a box is jumped
  to.  It is bump-allocated with no GC, hence the size.
* Program entry follows `sw/xfun/hs/startup_check.S`: a LINK CELL holding the
  WHNF continuation, then `fn.elink main`.  NF_ADDR points at a real epilogue,
  never at a `_start`-like value.

## Parity gap: qemu is ahead of the RTL

CSR 0x7c2 (the evaluation frame) and the frame-relative depth tests exist in
qemu only.  `fn.pop` is in both.  The catch/raise mechanism is pure runtime
code and needs no new RTL beyond the frame CSR.  Porting 0x7c2 to the Clash
core is the outstanding parity item; it is not mine to do.

## Tools

* `funboot/rebuild.sh` -- host compiler, fun graph, link.  Never pipe the
  codegen through `head`: a SIGPIPE mid-write leaves a truncated .S that still
  links, and the stale ELF looks like a reduction bug.
* `funboot/mkrt.sh` + `mkrt2.py` + `host_effects.S` -- regenerate the runtime.
  Blob bodies come from the compiler's own generators so encodings cannot
  drift.
* `funboot/run_io_tests.sh`, `host_oracle.sh`, `set_expect.sh` -- the feature
  suite, the GHC oracle, and the header filler.  A test that reads the source
  tree states its `-- CWD:`.
* `funboot/selfhost.sh` -- the bootstrap gate.
* qemu diagnostics: spine-overflow abort (rpush used to DROP pushes silently),
  a no-progress detector that dumps pc/spine/heap, FUNNF_TRACE, FUNUPD_TRACE,
  FUNHW_TRACE.

## Caveat on the GHC oracle

Modules that `import MHSPrelude` get the `ghc/` shim under GHC and `lib/` under
mhs, so the two builds are not the same program.  One expectation is affected:
`nest` inside `sep` (T89Sep).  The Hackage `pretty` package agrees with the fun
machine there, and that is where that expectation comes from.
