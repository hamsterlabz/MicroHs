#!/bin/bash
# mhs64 compiling every module of the compiler, one object at a time.
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; O=$W/self
exec > $O/self64.log 2>&1
cd $H
INC="-i -i$H/lib -i$H/src -i$H/mhs -i$H/paths"
rm -f $(find lib src mhs paths -name "*.hi.hs") 2>/dev/null
: > $O/self64.tsv
OK=0; BAD=0; T0=$(date +%s)
while read M; do
  F=$(echo $M | tr . _); t0=$(date +%s)
  nice -n 19 timeout 900 $W/ph.elf -c -hi -rv64g $INC $M -o $O/$F >$O/$F.mod.log 2>&1; rc=$?
  t1=$(date +%s); R=$(sed -n "s/^fun: reductions //p" $O/$F.mod.log | tail -1)
  if [ $rc -eq 0 ]; then OK=$((OK+1)); st=ok; else BAD=$((BAD+1)); st="FAIL($rc)"; fi
  printf "%s\t%s\t%s\t%s\n" "$M" "$((t1-t0))" "${R:-}" "$st" >> $O/self64.tsv
  printf "%-34s %5ds %13s %s\n" "$M" "$((t1-t0))" "${R:-?}" "$st"
done < $O/order.txt
echo "TOTAL ok=$OK fail=$BAD wall=$(( $(date +%s) - T0 ))s"
