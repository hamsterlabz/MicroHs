#!/bin/bash
# Waits for the flite run in flight, then re-runs nofib and gadt with the
# corrected program list (no .hi.hs, no module without a main) and rewrites
# SELFCOMPILE.md.  Does not commit; the tree is left for review.
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; O=$B/build/self; S=$H/funboot/suites
exec > $O/finish.log 2>&1
while pgrep -f "[r]un_plain" >/dev/null; do sleep 20; done
cd $B
for suite in nofib gadt; do
  MODS=$(cd $S/$suite && ls *.hs | grep -v "\.hi\.hs$" | while read f; do grep -q "^main" "$f" && echo "${f%.hs}"; done | tr "\n" " ")
  echo "=== $(date +%H:%M:%S) $suite: $(echo $MODS | wc -w) programs ==="
  OPT= bash run_plain.sh $MODS > $O/suite_$suite.txt 2>&1
  echo "$suite: ran=$(grep -c RAN $O/suite_$suite.txt) fail=$(grep -cE 'FAIL' $O/suite_$suite.txt)"
done
find $H/lib $H/src $H/mhs $H/paths $S -name "*.hi.hs" -delete 2>/dev/null
cd $H && python3 $B/mkmd.py 2>&1 | tail -2
echo "=== $(date +%H:%M:%S) done ==="
