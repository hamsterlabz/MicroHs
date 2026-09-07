#!/usr/bin/env bash
# Assemble and link a graph that is the COMPILER itself: mhs compiled by mhs
# for a stock RV64GC host.  Same three-part recipe as run_suites.sh -- macros,
# combinator routines, the program's own graph -- kept in its own script
# because this graph is two orders of magnitude larger than a benchmark's and
# the numbers worth printing (assembly time, image size) are different.
#
# The spine is sized well past the suite's 1M: a compiler nests far deeper than
# a benchmark, and the spine lives in .bss, so an unused entry costs nothing
# but address space.
set -euo pipefail
H=$HOME/work/MicroHs
B=$H/funboot/rv64g
W=$B/build
n=${1:-mhs64}

{ printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
  printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
  cat "$W/rt64.S"
  printf '    .include "%s/fun_combi_rt.S"\n' "$B"
  cat "$W/$n.S"
  printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$n.all.S"

printf 'graph .S : %s\n' "$(du -h "$W/$n.S" | cut -f1)"
printf 'full  .S : %s\n' "$(du -h "$W/$n.all.S" | cut -f1)"

/usr/bin/time -f 'as: %e s, %M KB peak' as -march=rv64g -mno-relax "$W/$n.all.S" -o "$W/$n.o"
/usr/bin/time -f 'ld: %e s, %M KB peak' ld -no-pie "$W/$n.o" "$W/fun_gc.o" -o "$W/$n.elf"
size "$W/$n.elf" || true
ls -l "$W/$n.elf"
