#!/usr/bin/env bash
# Every program in flite, nofib and gadt at each -O level, on the rv64 runtime.
# Rows print as they finish and land in results/opt_levels.csv.
set -uo pipefail
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; S=$H/funboot/suites; R=$B/results
mkdir -p "$W" "$R"; OUT=$R/opt_levels.csv
echo "suite,bench,opt,status,reductions,lines,result" > "$OUT"
INC="-i -imhs -isrc -ilib -ipaths -i$S/flite -i$S/nofib -i$S/gadt"
for suite in flite nofib gadt; do
  for f in "$S/$suite"/*.hs; do
    n=$(basename "$f" .hs)
    case $n in Common|GExtra) continue;; esac
    for O in -O0 -O1 -O2 -O3; do
      if ! (cd "$H" && ./bin/gmhs -rv64g $O $INC "$n" -o"$W/x_$n") >/dev/null 2>&1; then
        printf "%s,%s,%s,COMPILE-FAIL,,,\n" "$suite" "$n" "$O" >> "$OUT"
        printf "%-8s %-14s %-4s COMPILE-FAIL\n" "$suite" "$n" "$O"; continue; fi
      { printf "    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n"
        printf "    .include \"%s/fun_macros.S\"\n    .include \"%s/fun_combi.S\"\n" "$B" "$B"
        cat "$W/rt64.S"; printf "    .include \"%s/fun_combi_rt.S\"\n" "$B"; cat "$W/x_$n.S"
        printf "\n    .globl _funtext_end\n_funtext_end:\n"; } > "$W/x_$n.all.S"
      if ! as -march=rv64g -mno-relax "$W/x_$n.all.S" -o "$W/x_$n.o" 2>/dev/null \
         || ! ld -no-pie "$W/x_$n.o" "$W/fun_gc.o" -o "$W/x_$n.elf" 2>/dev/null; then
        printf "%s,%s,%s,BUILD-FAIL,,,\n" "$suite" "$n" "$O" >> "$OUT"
        printf "%-8s %-14s %-4s BUILD-FAIL\n" "$suite" "$n" "$O"; continue; fi
      ( cd "$S/$suite" && timeout 600 "$W/x_$n.elf" > "$W/x_$n.out" 2> "$W/x_$n.err" ); rc=$?
      red=$(sed -n "s/^fun: reductions //p" "$W/x_$n.err" | head -1)
      res=$(head -1 "$W/x_$n.out" | tr -d ",\n" | cut -c1-24)
      [ -z "$res" ] && res=$(sed -n "s/^fun: result //p" "$W/x_$n.err" | head -1)
      st=RAN; [ $rc -ne 0 ] && st=FAIL
      lines=$(wc -l < "$W/x_$n.S")
      printf "%s,%s,%s,%s,%s,%s,%s\n" "$suite" "$n" "$O" "$st" "$red" "$lines" "$res" >> "$OUT"
      printf "%-8s %-14s %-4s %-4s %10s red %6s lines  %s\n" "$suite" "$n" "$O" "$st" "${red:-?}" "$lines" "$res"
    done
  done
done
echo "=== done: $OUT"
