#!/usr/bin/env bash
# Kahan alone, after the sweep has the machine to itself: it imports Common
# from the gadt sources, which the first run did not have on the search path.
set -uo pipefail
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; S=$H/funboot/suites; R=$B/results
while pgrep -f "[r]un_suites.sh" > /dev/null; do sleep 30; done
n=Kahan
(cd "$H" && ./bin/gmhs -rv64g -i -imhs -isrc -ilib -ipaths -i"$S/nofib" -i"$S/gadt" \
   "$n" -o"$W/$n") > "$W/$n.log" 2>&1 || { echo "COMPILE-FAIL"; tail -2 "$W/$n.log"; exit 1; }
{ printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
  printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
  cat "$W/rt64.S"
  printf '    .include "%s/fun_combi_rt.S"\n' "$B"
  cat "$W/$n.S"
  printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$n.all.S"
as -march=rv64g -mno-relax "$W/$n.all.S" -o "$W/$n.o" >> "$W/$n.log" 2>&1 || { echo ASM-FAIL; exit 1; }
ld -no-pie "$W/$n.o" "$W/fun_gc.o" -o "$W/$n.elf" >> "$W/$n.log" 2>&1 || { echo LINK-FAIL; exit 1; }
( cd "$S/nofib" && /usr/bin/time -f "%e %M" -o "$W/$n.time" \
    perf stat -x, -e instructions,cycles -o "$W/$n.perf" timeout 900 "$W/$n.elf" \
    > "$W/$n.out" 2> "$W/$n.err" )
rc=$?
ins=$(awk -F, '/instructions/{print $1}' "$W/$n.perf"); cyc=$(awk -F, '/cycles/{print $1}' "$W/$n.perf")
sec=$(awk '{print $1}' "$W/$n.time"|tail -1); rss=$(awk '{print $2}' "$W/$n.time"|tail -1)
res=$(head -1 "$W/$n.out"|tr -d ',\n'); [ -z "$res" ] && res=$(sed -n "s/^fun: result //p" "$W/$n.err"|head -1)
# replace the NOMAIN row rather than appending a second one
sed -i "/^nofib,Kahan,/d" "$R/rv64g_suites.csv"
printf "nofib,%s,%s,%s,%s,%s,%s,%s\n" "$n" "$([ $rc -eq 0 ] && echo RAN || echo FAIL)" \
       "$ins" "$cyc" "$sec" "$rss" "$res" >> "$R/rv64g_suites.csv"
printf "nofib      %-18s %-5s %14s insn %10ss %8s KB  %s\n" "$n" \
       "$([ $rc -eq 0 ] && echo RAN || echo FAIL)" "$ins" "$sec" "$rss" "$res"
