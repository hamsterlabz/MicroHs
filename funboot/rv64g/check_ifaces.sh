#!/bin/bash
H=$HOME/work/MicroHs; O=$H/funboot/rv64g/build/self
exec > $O/check.log 2>&1
cd $H
INC="-i -i$H/lib -i$H/src -i$H/mhs -i$H/paths"
rm -f $(find lib src mhs paths -name "*.hi.hs") 2>/dev/null
OK=0; BAD=0
while read M; do
  if nice -n 19 timeout 300 ./bin/gmhs -c -hi -rv64g $INC $M -o $O/chk_tmp >$O/chk.log 2>&1; then
    OK=$((OK+1))
  else
    BAD=$((BAD+1)); printf "FAIL %-34s %s\n" "$M" "$(grep -m1 -E "error|found:" $O/chk.log | cut -c1-95)"
  fi
done < $O/order.txt
echo "TOTAL ok=$OK fail=$BAD"
