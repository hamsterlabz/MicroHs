#!/usr/bin/env bash
# run_io_tests.sh [test ...] - one small program per runtime feature, each built
# the way a fun program is built (mhs --rvfun-io --rv32 emits the graph; gcc links
# it with the runtime rt_linux.o) and run under the xfun qemu.  The expected
# stdout is the "-- EXPECT:" header of the source.
set -uo pipefail
HERE=/home/cecil/work/lambdalinux/MicroHs
T=$HERE/funboot/iotests
AS="/opt/riscv/bin/riscv32-unknown-elf-as -march=rv32imf_zicsr_xfun"
GCC="/opt/riscv/bin/riscv32-unknown-elf-gcc -march=rv32ima_zicsr -mabi=ilp32 -nostdlib -nostartfiles -static -T $HERE/funboot/linux32.ld"
QEMU=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
TMO=${IOT_TIMEOUT:-25}

cd "$T" || exit 1
tests=("$@")
# a test is a .hs carrying an EXPECT header; helper modules have none
if [ ${#tests[@]} -eq 0 ]; then mapfile -t tests < <(grep -l "^-- EXPECT:" *.hs | sed "s/\.hs$//"); fi

pass=0; fail=0; err=0; failed=""
for n in "${tests[@]}"; do
  # every EXPECT line, in order; exactly ONE space is the separator, so an
  # expectation may start with the spaces a pretty-printer indented it by
  exp=$(sed -n "s/^-- EXPECT: \{0,1\}//p" "$n.hs")
  args=$(sed -n "s/^-- ARGS: *//p" "$n.hs" | head -1)
  log="$n.buildlog"
  if ! (cd "$HERE" && ./bin/gmhs --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot/iotests \
        "$n" -o"$T/$n.S") > "$log" 2>&1; then
    printf "%-16s COMPILE-FAIL  %s\n" "$n" "$(head -1 "$log")"; err=$((err+1)); continue
  fi
  if ! $AS "$n.S" -o "$n.o" >> "$log" 2>&1 \
     || ! $GCC "$HERE/funboot/rt_linux.o" "$n.o" -o "$n.elf" 2>> "$log"; then
    printf "%-16s LINK-FAIL     %s\n" "$n" "$(grep -v RWX "$log" | tail -1)"; err=$((err+1)); continue
  fi
  # a test that reads the source tree (the compiler driving itself) states the
  # directory it must run from, relative to here; the host oracle runs from the
  # repo root, so those tests say "../..".
  cwd=$(sed -n "s/^-- CWD: *//p" "$n.hs" | head -1)
  out=$(cd "${cwd:-.}" && timeout "$TMO" $QEMU -cpu rv32,xfun=on "$T/$n.elf" $args 2>/dev/null)
  rc=$?
  if [ "$rc" = 124 ]; then
    printf "%-16s HANG\n" "$n"; fail=$((fail+1)); failed="$failed $n(hang)"
  elif [ "$out" = "$exp" ]; then
    printf "%-16s PASS\n" "$n"; pass=$((pass+1))
  else
    printf "%-16s FAIL  got=[%s] want=[%s] rc=%s\n" "$n" "$out" "$exp" "$rc"
    fail=$((fail+1)); failed="$failed $n"
  fi
done
echo "PASS=$pass FAIL=$fail ERR=$err TOTAL=$((pass+fail+err))"
[ -n "$failed" ] && echo "FAILED:$failed"
exit 0
