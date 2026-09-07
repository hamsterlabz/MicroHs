#!/usr/bin/env bash
# run_rv64g.sh [test ...] - the io test suite built for a stock RV64GC host
# (mhs -rv64g emits the graph as native instructions; the fn.* macros and the
# runtime are assembled with it) and run natively on this machine.  The
# expectations are the "-- EXPECT:" headers the xfun qemu run checks against.
set -uo pipefail
HERE=$HOME/work/MicroHs
T=$HERE/funboot/iotests
B=$HERE/funboot/rv64g
W=$B/build
mkdir -p "$W"
cd "$T" || exit 1
tests=("$@")
if [ ${#tests[@]} -eq 0 ]; then mapfile -t tests < <(grep -l "^-- EXPECT:" *.hs | sed "s/\.hs$//"); fi
pass=0; fail=0; err=0; failed=""
for n in "${tests[@]}"; do
  exp=$(sed -n "s/^-- EXPECT: \{0,1\}//p" "$n.hs")
  args=$(sed -n "s/^-- ARGS: *//p" "$n.hs" | head -1)
  log="$W/$n.log"
  if ! (cd "$HERE" && ./bin/gmhs -rv64g -i -imhs -isrc -ilib -ipaths -ifunboot/iotests \
        "$n" -o"$W/$n") > "$log" 2>&1; then
    printf "%-14s COMPILE-FAIL %s\n" "$n" "$(head -1 "$log")"; err=$((err+1)); continue
  fi
  # THE PROGRAM .S IS SELF-CONTAINED. gmhs -rv64g emits .option norvc, the
  # FN_SPINE_CAP equate, all three .include lines, _start and the
  # prim/cmp/effect blobs ahead of the graph. Prepending that prologue again
  # -- and concatenating rt64.S, a stale artifact nothing here builds any
  # more -- included fun_macros.S twice and defined _iobuf, _cur_fd and
  # _fungraph_start a second time, so the assembler rejected the file.
  { cat "$W/$n.S"
    printf '\n    .globl _funtext_end\n_funtext_end:\n'; } > "$W/$n.all.S"
  if ! as -march=rv64g -mno-relax "$W/$n.all.S" -o "$W/$n.o" >> "$log" 2>&1; then
    printf "%-14s ASM-FAIL %s\n" "$n" "$(grep -m1 Error "$log")"; err=$((err+1)); continue
  fi
  # THE COLLECTOR IS PART OF THE IMAGE. The blob emitter splices a GC poll
  # after every box tail and _gc_safepoint calls fun_gc, so link it: without
  # it the weak reference resolves to 0, the poll skips, and the program runs
  # with no collector at all -- which is not what this suite is testing.
  if ! ld -no-pie "$W/$n.o" "$W/fun_gc.o" -o "$W/$n.elf" >> "$log" 2>&1; then
    printf "%-14s LINK-FAIL %s\n" "$n" "$(grep -m1 -i "undefined\|truncated" "$log")"; err=$((err+1)); continue
  fi
  got=$(cd "$T" && timeout 90 "$W/$n.elf" $args 2>/dev/null)
  rc=$?
  if [ "$got" = "$exp" ]; then
    pass=$((pass+1)); printf "%-14s PASS\n" "$n"
  else
    fail=$((fail+1)); failed="$failed $n"
    printf "%-14s FAIL rc=%d got=[%s] want=[%s]\n" "$n" "$rc" "$(echo "$got"|head -2|tr '\n' '|')" "$(echo "$exp"|head -2|tr '\n' '|')"
  fi
done
printf "\n=== rv64g: pass=%d fail=%d err=%d\n" "$pass" "$fail" "$err"
[ -n "$failed" ] && printf "failed:%s\n" "$failed"
exit 0
