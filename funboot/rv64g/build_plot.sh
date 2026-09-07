#!/usr/bin/env bash
# build_plot.sh <Module> - build a fun program that links against libsdlfun.
#
# gmhs emits the graph and then tries its own freestanding link, which FAILS
# on the sdl_* symbols -- that is the point: mhs does not define them, the
# library does.  So take the .S it produced, assemble it together with the
# library's asm half (the fn_* macros belong to that translation unit), and
# link the result with the C half and SDL through gcc.
set -uo pipefail
H=$HOME/work/MicroHs
B=$H/funboot/rv64g
W=$B/build
n=${1:?module}
SDL=/usr/lib/riscv64-linux-gnu/libSDL2-2.0.so.0

base=$(echo "${n%Plot}" | tr "A-Z" "a-z")   # MandelPlot -> mandel, NBodyPlot -> nbody
mkdir -p "$B/$base"          # where this program writes its results
cd "$H" || exit 1
./bin/gmhs -rv64g -i -imhs -isrc -ilib -ipaths -ifunboot/suites/nofib -ifunboot/suites/magneto \
     "$n" -o"$W/$n" > "$W/$n.plot.log" 2>&1
[ -f "$W/$n.S" ] || { echo "no $W/$n.S"; tail -3 "$W/$n.plot.log"; exit 1; }

gcc -O2 -fno-stack-protector -DOUTDIR="\"$B/$base/\"" -DPLOTBASE="\"$base\"" \
    -c "$B/sdl_plot.c" -o "$W/sdl_plot.o" || exit 1
cat "$W/$n.S" "$B/sdlfun.S" "$B/funmath.S" > "$W/$n.plot.all.S"
as -march=rv64g -mno-relax "$W/$n.plot.all.S" -o "$W/$n.plot.o" || exit 1

# UNRESOLVED IMPORTS BECOME HALTING STUBS -- in a library, not in the compiler.
# mhs emits a reference for every foreign import and defines none of them, so
# an import the program never calls (Floating pulls in exp, log, sin...) is
# still an undefined symbol.  Ask the object what is actually missing and
# generate a stub for each: the ones with a real implementation are already
# resolved by sdlfun.S, and anything else halts NAMING ITSELF if it is ever
# entered.
nm -u "$W/$n.plot.o" | grep -o '_unimpfi_[A-Za-z0-9_]*' | sort -u > "$W/$n.missing"
echo '    .text' > "$W/$n.stubs.S"
while read -r sym; do
  [ "$sym" = "_unimpfi_halt" ] && continue
  {
    echo '    .balign 4, 0'
    echo "    .globl $sym"
    echo "$sym:"
    echo "    la a0, ${sym}_nm"
    echo '    tail _unimpfi_halt'
    echo "${sym}_nm:"
    echo "    .asciz \"${sym#_unimpfi_}\""
    echo '    .balign 4, 0'
  } >> "$W/$n.stubs.S"
done < "$W/$n.missing"
if [ -s "$W/$n.missing" ]; then
  echo "unresolved imports stubbed:" $(cat "$W/$n.missing")
  cat "$W/$n.plot.all.S" "$W/$n.stubs.S" > "$W/$n.plot.all2.S"
  as -march=rv64g -mno-relax "$W/$n.plot.all2.S" -o "$W/$n.plot.o" || exit 1
fi

# -nostartfiles: the graph brings its own _start.  libc still comes in for
# SDL's sake, and the dynamic loader initialises it before the entry point.
gcc -no-pie -nostartfiles "$W/$n.plot.o" "$W/fun_gc.o" "$W/sdl_plot.o" \
    "$SDL" -o "$W/$n.plot" || exit 1
echo "built $W/$n.plot"
