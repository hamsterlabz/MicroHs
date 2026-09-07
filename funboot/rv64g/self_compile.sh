#!/bin/bash
# Self-compile: rebuild gmhs, rebuild mhs64, then compile every module of the
# compiler with mhs64 itself, one object at a time.  All artefacts stay under
# the project tree.
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; O=$W/self
mkdir -p $O
exec >> $O/driver.log 2>&1
echo "=== $(date +%H:%M:%S) rebuilding gmhs ==="
cd $H && rm -f bin/gmhs && nice -n 19 make bin/gmhs 2>&1 | grep -iE "^src.*error" -A4 | head -20
[ -s bin/gmhs ] || { echo "GMHS BUILD FAILED"; exit 1; }
echo "=== $(date +%H:%M:%S) building mhs64 ==="
nice -n 19 ./bin/gmhs -rv64g -i -imhs -isrc -ilib -ipaths MicroHs.Main -o $W/ph 2>&1 | tail -2
{ printf "    .option norvc\n    .equ FN_SPINE_CAP, 8388608\n"
  printf "    .include \"%s/fun_macros.S\"\n    .include \"%s/fun_combi.S\"\n" "$B" "$B"
  cat "$W/rt64.S.bak"; printf "    .include \"%s/fun_combi_rt.S\"\n" "$B"; cat "$W/ph.S"
  printf "\n    .globl _funtext_end\n_funtext_end:\n"; } > "$W/ph.all.S"
nice -n 19 as -march=rv64g -mno-relax "$W/ph.all.S" -o "$W/ph.o" && nice -n 19 ld -no-pie "$W/ph.o" "$W/fun_gc.o" -o "$W/ph.elf" || { echo "MHS64 LINK FAILED"; exit 1; }
echo "mhs64 ready: $(wc -l < $W/ph.S) lines"
echo "=== $(date +%H:%M:%S) self-compiling $(wc -l < $O/order.txt) modules ==="
rm -f $O/*.mod.log
rm -f $(find $H/lib $H/src $H/mhs $H/paths -name "*.hi.hs") 2>/dev/null
cd $H
INC="-i -i$H/lib -i$H/src -i$H/mhs -i$H/paths"
START=$(date +%s); OK=0; FAIL=0
while read M; do
  F=$(echo $M | tr . _); T0=$(date +%s)
  nice -n 19 timeout 1800 $W/ph.elf -c -hi -rv64g $INC $M -o $O/$F > $O/$F.mod.log 2>&1; RC=$?
  T1=$(date +%s); R=$(sed -n "s/^fun: reductions //p" $O/$F.mod.log | tail -1)
  if [ $RC -eq 0 ]; then OK=$((OK+1)); printf "%-34s %5ds %12s\n" "$M" $((T1-T0)) "${R:-?}"
  else FAIL=$((FAIL+1)); printf "%-34s FAIL rc=%s %s\n" "$M" "$RC" "$(tail -1 $O/$F.mod.log | cut -c1-60)"; fi
done < $O/order.txt
echo "TOTAL $(( $(date +%s) - START ))s  ok=$OK fail=$FAIL"
echo "=== $(date +%H:%M:%S) done ==="
