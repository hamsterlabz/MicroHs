#!/usr/bin/env bash
# set_expect.sh <Test>... - replace a test's EXPECT header with what the same
# program prints natively under GHC (funboot/host_oracle.sh).  The header then
# states the program's meaning, so the fun run is a differential test against
# the host, not against a hand-written guess.
set -uo pipefail
HERE=/home/cecil/work/lambdalinux/MicroHs
for n in "$@"; do
  out=$("$HERE/funboot/host_oracle.sh" "$n" 2>/dev/null)
  rc=$?
  if [ $rc != 0 ]; then echo "$n: ORACLE-FAIL rc=$rc"; continue; fi
  python3 - "$n" <<PY
import sys
n = sys.argv[1]
p = "$HERE/funboot/iotests/%s.hs" % n
out = """$out"""
lines = open(p).read().split("\n")
body = [l for l in lines if not l.startswith("-- EXPECT:")]
hdr = ["-- EXPECT: " + l for l in out.split("\n")]
open(p, "w").write("\n".join(hdr + body))
PY
  echo "$n: $(grep -c '^-- EXPECT:' "$HERE/funboot/iotests/$n.hs") expected line(s)"
done
