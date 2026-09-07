#!/usr/bin/env bash
# The bootstrap gate: mhs64 -- the compiler running as a native graph on this
# machine -- compiles a module, and its output is compared byte-for-byte with
# what bin/gmhs (the same compiler, built by GHC) produces for the same input.
# Identical output is the only claim worth making: it says the graph runtime
# reproduces the compiler exactly, not merely that it ran without crashing.
#
#   usage: bootgate.sh <Module> [extra -i path]
set -uo pipefail
H=$HOME/work/MicroHs
W=$H/funboot/rv64g/build
n=${1:?module}
extra=${2:-}
INC="-i -imhs -isrc -ilib -ipaths"
[ -n "$extra" ] && INC="$INC -i$extra"

cd "$H"
echo "--- reference: bin/gmhs"
/usr/bin/time -f 'gmhs: %e s, %M KB' ./bin/gmhs -rv64g $INC "$n" -o"$W/ref_$n" || exit 1

echo "--- under test: mhs64 (graph on the metal)"
/usr/bin/time -f 'mhs64: %e s, %M KB' "$W/mhs64.elf" -rv64g $INC "$n" -o"$W/got_$n"
rc=$?
echo "mhs64 rc=$rc"
[ $rc -eq 0 ] || exit $rc

if cmp -s "$W/ref_$n.S" "$W/got_$n.S"; then
  echo "GATE PASS: $n -- output identical ($(wc -c < "$W/ref_$n.S") bytes)"
else
  echo "GATE FAIL: $n -- output differs"
  cmp "$W/ref_$n.S" "$W/got_$n.S" | head -3
  ls -l "$W/ref_$n.S" "$W/got_$n.S"
  exit 1
fi
