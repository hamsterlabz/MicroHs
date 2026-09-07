#!/usr/bin/env bash
set -uo pipefail
OPT=${OPT:-}
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; S=$H/funboot/suites; R=$B/results
mkdir -p "$W" "$R"; OUT=$R/idiom.csv
INC="-i -imhs -isrc -ilib -ipaths -i$S/flite -i$S/nofib -i$S/gadt"
echo "bench,status,reductions,result" > "$OUT"
for n in "$@"; do
  if ! (cd "$H" && ./bin/gmhs $OPT -rv64g $INC "$n" -o"$W/p_$n") >"$W/p_$n.log" 2>&1; then
    printf "%s,COMPILE-FAIL,,\n" "$n" >> "$OUT"; printf "%-18s COMPILE-FAIL\n" "$n"; continue; fi
  # mhs emits the runtime and the end marker itself now -- the OS is its
  # choice (--bare/--thin/--linux), not the script's.  What is left here is the
  # assembler MACRO definitions, which are textual includes and nothing else.
  { printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
    printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
    printf '    .include "%s/fun_combi_rt.S"\n' "$B"
    cat "$W/p_$n.S"; } > "$W/p_$n.all.S"
  as -march=rv64g -mno-relax "$W/p_$n.all.S" -o "$W/p_$n.o" 2>/dev/null && \
  ld -no-pie "$W/p_$n.o" "$W/fun_gc.o" -o "$W/p_$n.elf" 2>/dev/null || {
    printf "%s,BUILD-FAIL,,\n" "$n" >> "$OUT"; printf "%-18s BUILD-FAIL\n" "$n"; continue; }
  ( cd "$S/flite" && timeout 600 "$W/p_$n.elf" > "$W/p_$n.out" 2> "$W/p_$n.err" ); rc=$?
  red=$(sed -n "s/^fun: reductions //p" "$W/p_$n.err" | head -1)
  res=$(head -1 "$W/p_$n.out" | tr -d ",\n" | cut -c1-18)
  [ -z "$res" ] && res=$(sed -n "s/^fun: result //p" "$W/p_$n.err" | head -1)
  st=RAN; [ $rc -ne 0 ] && st=FAIL
  printf "%s,%s,%s,%s\n" "$n" "$st" "$red" "$res" >> "$OUT"
  printf "%-18s %-5s %10s  %s\n" "$n" "$st" "${red:-?}" "$res"
done
