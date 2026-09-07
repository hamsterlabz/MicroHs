#!/usr/bin/env bash
# rerun.sh - relink every program against the current runtime and run it.
# The program graphs are unaffected by runtime changes, so the .S files are
# reused; only the assemble/link/run steps repeat.
set -uo pipefail
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; S=$H/funboot/suites; R=$B/results
OUT=$R/rv64g_suites.csv
echo "suite,bench,status,instructions,cycles,seconds,rss_kb,reductions,result" > $OUT
echo "suite,bench,gc_passes,live_words_last,freed_words_total" > $R/rv64g_gc.csv
pass=0; fail=0
for suite in flite nofib gadt; do
  for f in "$S/$suite"/*.hs; do
    n=$(basename "$f" .hs)
    case $n in Common|GExtra) continue;; esac
    [ -f "$W/$n.S" ] || { echo "$n: no graph"; continue; }
    { printf '    .option norvc\n    .equ FN_SPINE_CAP, 1048576\n'
      printf '    .include "%s/fun_macros.S"\n    .include "%s/fun_combi.S"\n' "$B" "$B"
      cat "$W/rt64.S"; printf '    .include "%s/fun_combi_rt.S"\n' "$B"; cat "$W/$n.S"
      printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$n.all.S"
    as -march=rv64g -mno-relax "$W/$n.all.S" -o "$W/$n.o" 2>/dev/null || { echo "$n ASM-FAIL"; continue; }
    ld -no-pie "$W/$n.o" "$W/fun_gc.o" -o "$W/$n.elf" 2>/dev/null || { echo "$n LINK-FAIL"; continue; }
    ( cd "$S/$suite" && /usr/bin/time -f "%e %M" -o "$W/$n.time" \
        perf stat -x, -e instructions,cycles -o "$W/$n.perf" \
        timeout 900 "$W/$n.elf" > "$W/$n.out" 2> "$W/$n.err" )
    rc=$?
    grep -qiE "segmentation|core dumped|illegal instruction|exhausted|killed" "$W/$n.err" && rc=139
    ins=$(awk -F, '/instructions/{print $1}' "$W/$n.perf"); cyc=$(awk -F, '/cycles/{print $1}' "$W/$n.perf")
    sec=$(awk '{print $1}' "$W/$n.time"|tail -1); rss=$(awk '{print $2}' "$W/$n.time"|tail -1)
    res=$(head -1 "$W/$n.out"|tr -d ',\n'); [ -z "$res" ] && res=$(sed -n 's/^fun: result //p' "$W/$n.err"|head -1)
    red=$(sed -n 's/^fun: reductions //p' "$W/$n.err"|head -1)
    st=$([ $rc -eq 0 ] && echo RAN || echo FAIL)
    [ $rc -eq 0 ] && pass=$((pass+1)) || fail=$((fail+1))
    printf "%s,%s,%s,%s,%s,%s,%s,%s,%s\n" "$suite" "$n" "$st" "$ins" "$cyc" "$sec" "$rss" "${red:-0}" "$res" >> "$OUT"
    # collection counts, from a second run with the summary on
    g=$( (cd "$S/$suite" && FUNGC=1 timeout 900 "$W/$n.elf" 2>&1 >/dev/null) | tr '\n' ' ')
    p=$(echo "$g" | grep -o "fun-gc: pass" | wc -l)
    lw=$(echo "$g" | sed 's/.*live words \([0-9]*\).*/\1/;t;d')
    fw=$(echo "$g" | grep -o "freed words [0-9]*" | awk '{s+=$3} END{print s+0}')
    printf "%s,%s,%s,%s,%s\n" "$suite" "$n" "$p" "${lw:-0}" "$fw" >> "$R/rv64g_gc.csv"
    printf "%-6s %-14s %-4s %14s insn %13s red %8ss gc=%-3s %s\n" \
      "$suite" "$n" "$st" "${ins:-?}" "${red:-0}" "${sec:-?}" "$p" "$res"
  done
done
printf "\n=== 128 MB heap: pass=%d fail=%d\n" "$pass" "$fail"
