#!/usr/bin/env bash
# Compile the io test suite for a stock RV64GC host (-rv64g).  The .S files, the
# EXPECT headers and the ARGS lines travel together to the rv machine, which
# assembles, links and runs them; the expectations are the same ones the xfun
# qemu run checks against.
set -uo pipefail
HERE=/home/cecil/work/lambdalinux/MicroHs
T=$HERE/funboot/iotests
OUT=$HERE/funboot/rv64g_out
mkdir -p "$OUT"; rm -f "$OUT"/*.S "$OUT"/*.exp "$OUT"/*.args
cd "$T" || exit 1
ok=0; bad=0
for n in $(grep -l "^-- EXPECT:" *.hs | sed 's/\.hs//'); do
  sed -n "s/^-- EXPECT: \{0,1\}//p" "$n.hs" > "$OUT/$n.exp"
  sed -n "s/^-- ARGS: *//p" "$n.hs" | head -1 > "$OUT/$n.args"
  if (cd "$HERE" && ./bin/gmhs -rv64g -i -imhs -isrc -ilib -ipaths -ifunboot/iotests \
       "$n" -o"$OUT/$n") > "$OUT/$n.log" 2>&1; then
    ok=$((ok+1)); printf "."
  else
    bad=$((bad+1)); printf "\nCOMPILE-FAIL %s: %s\n" "$n" "$(head -2 "$OUT/$n.log"|tr '\n' ' ')"
  fi
done
printf "\ncompiled %d, failed %d\n" "$ok" "$bad"
