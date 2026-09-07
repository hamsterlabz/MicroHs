#!/usr/bin/env bash
# run_gadt_morph.sh - the gadt Pure/Morph family, each module built three ways
# (no flag, --morph, --mmorph) so the hand-written recursion-scheme variants can
# be compared against the plain ones AND against what the classifier does.
set -uo pipefail
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; S=$H/funboot/suites; R=$B/results
mkdir -p "$W" "$R"; OUT=$R/gadt_morph.csv
INC="-i -imhs -isrc -ilib -ipaths -i$S/flite -i$S/nofib -i$S/gadt"
echo "bench,mode,status,reductions,cata,ana,para,hylo,lines,result" > "$OUT"
printf "%-20s %-7s %-5s %12s  %-16s %7s %s\n" BENCH MODE STAT REDUCTIONS MORPHS LINES RESULT

one() {                            # $1=module $2=mode $3=flags
  local n=$1 mode=$2 xf=$3 tag=${1}_${2}
  if ! (cd "$H" && ./bin/gmhs -rv64g $xf $INC "$n" -o"$W/$tag") >"$W/$tag.log" 2>&1; then
    printf "%s,%s,COMPILE-FAIL,,,,,,,\n" "$n" "$mode" >> "$OUT"
    printf "%-20s %-7s COMPILE-FAIL  %s\n" "$n" "$mode" "$(head -1 "$W/$tag.log"|cut -c1-52)"; return; fi
  local ca an pa hy ln
  ca=$(grep -c fn_cata "$W/$tag.S"); an=$(grep -c fn_ana "$W/$tag.S")
  pa=$(grep -c fn_para "$W/$tag.S"); hy=$(grep -c fn_hylo "$W/$tag.S")
  ln=$(wc -l < "$W/$tag.S")
  { printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
    printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
    cat "$W/rt64.S"; printf '    .include "%s/fun_combi_rt.S"\n' "$B"; cat "$W/$tag.S"
    printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$tag.all.S"
  if ! as -march=rv64g -mno-relax "$W/$tag.all.S" -o "$W/$tag.o" 2>"$W/$tag.aserr" \
     || ! ld -no-pie "$W/$tag.o" "$W/fun_gc.o" -o "$W/$tag.elf" 2>>"$W/$tag.aserr"; then
    printf "%s,%s,BUILD-FAIL,,%s,%s,%s,%s,%s,\n" "$n" "$mode" "$ca" "$an" "$pa" "$hy" "$ln" >> "$OUT"
    printf "%-20s %-7s BUILD-FAIL  %s\n" "$n" "$mode" "$(head -1 "$W/$tag.aserr"|cut -c1-52)"; return; fi
  ( cd "$S/gadt" && timeout 180 "$W/$tag.elf" > "$W/$tag.out" 2> "$W/$tag.err" ); local rc=$?
  local red res st=RAN
  red=$(sed -n "s/^fun: reductions //p" "$W/$tag.err" | head -1)
  res=$(head -1 "$W/$tag.out" | tr -d ",\n" | cut -c1-18)
  [ -z "$res" ] && res=$(sed -n "s/^fun: result //p" "$W/$tag.err" | head -1)
  [ $rc -ne 0 ] && st=FAIL
  printf "%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n" "$n" "$mode" "$st" "$red" "$ca" "$an" "$pa" "$hy" "$ln" "$res" >> "$OUT"
  printf "%-20s %-7s %-5s %12s  c%-2s a%-2s p%-2s h%-2s %7s %s\n" \
         "$n" "$mode" "$st" "${red:-?}" "$ca" "$an" "$pa" "$hy" "$ln" "$res"
}

for n in "$@"; do
  one "$n" plain  ""
  one "$n" morph  "--morph"
  one "$n" mmorph "--mmorph"
done
