#!/usr/bin/env bash
# run_morph.sh - each benchmark built twice, with and without --morph, so the
# effect of the explicit morphism dispatch is a like-for-like difference in
# reductions.  Rows print as they finish.
set -uo pipefail
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; S=$H/funboot/suites; R=$B/results
mkdir -p "$W" "$R"; OUT=$R/morph_effect.csv
INC="-i -imhs -isrc -ilib -ipaths -i$S/flite -i$S/nofib -i$S/gadt"
echo "bench,mode,status,reductions,cata,ana,para,hylo,result" > "$OUT"
printf "%-14s %-8s %-5s %12s  %-16s %s\n" BENCH MODE STAT REDUCTIONS MORPHS RESULT

build_run() {                      # $1=bench $2=mode $3=extra flags
  local n=$1 mode=$2 xf=$3 tag=${1}_${2}
  if ! (cd "$H" && ./bin/gmhs -rv64g $xf $INC "$n" -o"$W/$tag") >"$W/$tag.log" 2>&1; then
    printf "%s,%s,COMPILE-FAIL,,,,,,\n" "$n" "$mode" >> "$OUT"
    printf "%-14s %-8s COMPILE-FAIL %s\n" "$n" "$mode" "$(head -1 "$W/$tag.log"|cut -c1-60)"; return; fi
  local ca an pa hy
  ca=$(grep -c fn_cata "$W/$tag.S"); an=$(grep -c fn_ana "$W/$tag.S")
  pa=$(grep -c fn_para "$W/$tag.S"); hy=$(grep -c fn_hylo "$W/$tag.S")
  { printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
    printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
    cat "$W/rt64.S"; printf '    .include "%s/fun_combi_rt.S"\n' "$B"; cat "$W/$tag.S"
    printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$tag.all.S"
  if ! as -march=rv64g -mno-relax "$W/$tag.all.S" -o "$W/$tag.o" 2>"$W/$tag.aserr" \
     || ! ld -no-pie "$W/$tag.o" "$W/fun_gc.o" -o "$W/$tag.elf" 2>>"$W/$tag.aserr"; then
    printf "%s,%s,BUILD-FAIL,,%s,%s,%s,%s,\n" "$n" "$mode" "$ca" "$an" "$pa" "$hy" >> "$OUT"
    printf "%-14s %-8s BUILD-FAIL  %s\n" "$n" "$mode" "$(head -1 "$W/$tag.aserr"|cut -c1-60)"; return; fi
  ( cd "$S/flite" && timeout 900 "$W/$tag.elf" > "$W/$tag.out" 2> "$W/$tag.err" ); local rc=$?
  local red res st=RAN
  red=$(sed -n "s/^fun: reductions //p" "$W/$tag.err" | head -1)
  res=$(head -1 "$W/$tag.out" | tr -d ",\n" | cut -c1-16)
  [ -z "$res" ] && res=$(sed -n "s/^fun: result //p" "$W/$tag.err" | head -1)
  [ $rc -ne 0 ] && st=FAIL
  printf "%s,%s,%s,%s,%s,%s,%s,%s,%s\n" "$n" "$mode" "$st" "$red" "$ca" "$an" "$pa" "$hy" "$res" >> "$OUT"
  printf "%-14s %-8s %-5s %12s  c%-2s a%-2s p%-2s h%-2s  %s\n" \
         "$n" "$mode" "$st" "${red:-?}" "$ca" "$an" "$pa" "$hy" "$res"
}

for n in "$@"; do
  build_run "$n" plain ""
  build_run "$n" morph "--morph"
  build_run "$n" mmorph "--mmorph"
done
