#!/usr/bin/env bash
# run_suites.sh - flite, nofib and gadt built for a stock RV64GC host (-rv64g:
# the graph is native instructions, the fn.* macros and the mark-compact
# collector are linked with it) and run natively on this machine.  The suites
# suites are copied onto this machine first, not read over the mount.
# Each row carries the retired instruction count and cycle count from the
# hardware counters, plus wall time, peak RSS and the answer.
set -uo pipefail
H=$HOME/work/MicroHs
B=$H/funboot/rv64g
W=$B/build
S=$H/funboot/suites
R=$B/results
mkdir -p "$W" "$R"
OUT=$R/rv64g_suites.csv
echo "suite,bench,status,instructions,cycles,seconds,rss_kb,result" > "$OUT"
INC="-i$S/flite -i$S/nofib -i$S/gadt"

run_one() {
  local suite=$1 n=$2 dir=$3
  local log=$W/$n.log
  if ! (cd "$H" && ./bin/gmhs -rv64g -i -imhs -isrc -ilib -ipaths $INC "$n" -o"$W/$n") > "$log" 2>&1; then
    printf "%s,%s,COMPILE-FAIL,,,,,\n" "$suite" "$n" >> "$OUT"
    printf "%-6s %-14s COMPILE-FAIL  %s\n" "$suite" "$n" "$(head -1 "$log"|cut -c1-70)"; return
  fi
  { printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
    printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
    cat "$W/rt64.S"
    printf '    .include "%s/fun_combi_rt.S"\n' "$B"
    cat "$W/$n.S"
    printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$n.all.S"
  if ! as -march=rv64g -mno-relax "$W/$n.all.S" -o "$W/$n.o" >> "$log" 2>&1; then
    printf "%s,%s,ASM-FAIL,,,,,\n" "$suite" "$n" >> "$OUT"
    printf "%-6s %-14s ASM-FAIL  %s\n" "$suite" "$n" "$(grep -m1 Error "$log"|cut -c1-70)"; return
  fi
  if ! ld -no-pie "$W/$n.o" "$W/fun_gc.o" -o "$W/$n.elf" >> "$log" 2>&1; then
    printf "%s,%s,LINK-FAIL,,,,,\n" "$suite" "$n" >> "$OUT"
    printf "%-6s %-14s LINK-FAIL  %s\n" "$suite" "$n" "$(grep -m1 -i 'undefined\|truncated' "$log"|cut -c1-70)"; return
  fi
  ( cd "$dir" && /usr/bin/time -f "%e %M" -o "$W/$n.time" \
      perf stat -x, -e instructions,cycles -o "$W/$n.perf" \
      timeout 1800 "$W/$n.elf" > "$W/$n.out" 2> "$W/$n.err" )
  local rc=$? ins cyc sec rss res
  # perf and time both swallow a signal death, so ask the stderr as well:
  # a crash there is a FAIL however the wrappers reported it
  grep -qiE "segmentation fault|core dumped|illegal instruction|killed" "$W/$n.err" 2>/dev/null && rc=139
  ins=$(awk -F, '/instructions/{print $1}' "$W/$n.perf" 2>/dev/null)
  cyc=$(awk -F, '/cycles/{print $1}'       "$W/$n.perf" 2>/dev/null)
  sec=$(awk '{print $1}' "$W/$n.time" 2>/dev/null | tail -1)
  rss=$(awk '{print $2}' "$W/$n.time" 2>/dev/null | tail -1)
  res=$(head -1 "$W/$n.out" 2>/dev/null | tr -d ',\n' | cut -c1-40)
  # a benchmark whose main is a value prints nothing: the epilogue reports it
  [ -z "$res" ] && res=$(sed -n 's/^fun: result //p' "$W/$n.err" 2>/dev/null | head -1)
  printf "%s,%s,%s,%s,%s,%s,%s,%s\n" "$suite" "$n" "$([ $rc -eq 0 ] && echo RAN || echo FAIL)" \
         "$ins" "$cyc" "$sec" "$rss" "$res" >> "$OUT"
  printf "%-6s %-14s %-4s %15s insn %9ss %8s KB  %s\n" "$suite" "$n" \
         "$([ $rc -eq 0 ] && echo RAN || echo FAIL)" "${ins:-?}" "${sec:-?}" "${rss:-?}" "$res"
}

for suite in flite nofib gadt; do
  for f in "$S/$suite"/*.hs; do
    n=$(basename "$f" .hs)
    case $n in Common|GExtra) continue;; esac   # helper modules, no main
    run_one "$suite" "$n" "$S/$suite"
  done
done
echo "=== done: $OUT"
