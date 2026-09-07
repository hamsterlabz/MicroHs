#!/usr/bin/env bash
# run_mech.sh - the mechanism suite, rv64 versions (funboot/rv64/mech).
# These are real files, not a translation done on the way past: the rvfun
# originals live in funboot/rvfun/mech and adapt.py regenerates this side when
# they change.
# Exit status is the protocol: 0 = PASS, otherwise the failing test number.
set -uo pipefail
H=$HOME/work/MicroHs
B=$H/funboot/rv64g
W=$B/build
M=$H/funboot/tests/rv64/mech
pass=0; fail=0; err=0; failed=""
for s in "$M"/*.S; do
  n=$(basename "$s" .S)
  { printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
    printf '    .equ _heap, 0x24000000\n'   # inside the runtime's heap mapping
    printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
    cat "$W/rt64.S"
    printf '    .include "%s/fun_combi_rt.S"\n' "$B"
    cat "$s"
    printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/m_$n.all.S"
  if ! as -march=rv64g -mno-relax "$W/m_$n.all.S" -o "$W/m_$n.o" >"$W/m_$n.log" 2>&1; then
    printf "%-16s ASM-FAIL  %s\n" "$n" "$(grep -m1 Error "$W/m_$n.log" | cut -c1-60)"; err=$((err+1)); continue
  fi
  if ! ld -no-pie "$W/m_$n.o" "$W/fun_gc.o" -o "$W/m_$n.elf" >>"$W/m_$n.log" 2>&1; then
    printf "%-16s LINK-FAIL %s\n" "$n" "$(grep -m1 -i 'undefined\|truncated' "$W/m_$n.log" | cut -c1-60)"; err=$((err+1)); continue
  fi
  timeout 60 "$W/m_$n.elf" > "$W/m_$n.out" 2>&1
  rc=$?
  if [ $rc -eq 0 ]; then pass=$((pass+1)); printf "%-16s PASS\n" "$n"
  else fail=$((fail+1)); failed="$failed $n"
       printf "%-16s FAIL (test %d) %s\n" "$n" "$rc" "$(head -1 "$W/m_$n.out" | cut -c1-40)"; fi
done
printf "\n=== mechanism suite, rv64: pass=%d fail=%d err=%d\n" "$pass" "$fail" "$err"
[ -n "$failed" ] && printf "failed:%s\n" "$failed"
exit 0
