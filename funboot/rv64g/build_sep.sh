set -uo pipefail
H=$HOME/work/MicroHs; B=$H/funboot/rv64g; W=$B/build; O=$W/sep
mkdir -p $O; rm -f $O/*.o $O/*.S
cd $H/funboot/suites/flite
INC="-i -i$H/lib -i$H/src -i$H/mhs -i$H/paths -i."
PROG=${PROG:-Fib}
MODS="$PROG NanoPrelude Primitives Data.List_Type Data.Bool_Type Data.Ordering_Type"
for M in $MODS; do
  F=$(echo $M | tr . _)
  $H/bin/gmhs -c -rv64g $INC $M -o $O/g_$F >$O/$M.log 2>&1 || { echo "COMPILE FAIL $M"; tail -2 $O/$M.log; exit 1; }
  { printf "    .option norvc\n    .equ FN_SPINE_CAP, 8388608\n    FN_EXTERN_STATE = 1\n"
    printf "    .include \"%s/fun_macros.S\"\n    .include \"%s/fun_combi.S\"\n" "$B" "$B"
    cat $O/g_$F.S; } > $O/$M.all.S
  as -march=rv64g -mno-relax $O/$M.all.S -o $O/$M.o || { echo "AS FAIL $M"; exit 1; }
  echo "  $M.o  $(grep -c "^\s*\.globl" $O/g_$F.S) globals"
done
# the runtime object: startup, combinator dispatch, and the end marker
{ printf "    .option norvc\n    .equ FN_SPINE_CAP, 8388608\n"
  printf "    .include \"%s/fun_macros.S\"\n    .include \"%s/fun_combi.S\"\n" "$B" "$B"
  cat "$W/rt64.S.bak"; printf "    .include \"%s/fun_combi_rt.S\"\n" "$B"; } > $O/rt.all.S
# Everything the runtime defines was file-local when the program was one
# object.  Export every top-level label it defines so the module objects can
# reach it -- the library half of the header/library split.
{ grep -hoE "^[A-Za-z_][A-Za-z0-9_]*:" $B/fun_macros.S $B/fun_combi_rt.S $W/rt64.S.bak \
    | tr -d ":" | sort -u | sed "s/^/    .globl /"; } >> $O/rt.all.S
as -march=rv64g -mno-relax $O/rt.all.S -o $O/rt.o || { echo "AS FAIL rt"; exit 1; }
printf "    .text\n    .globl _funtext_end\n_funtext_end:\n" > $O/end.S
as -march=rv64g -mno-relax $O/end.S -o $O/end.o
OBJS="$O/rt.o"
for M in $MODS; do OBJS="$OBJS $O/$M.o"; done
ld --gc-sections -no-pie $OBJS $O/end.o $W/fun_gc.o -o $O/$PROG.sep.elf 2>&1 | head -10
echo "linked: $(ls -l $O/$PROG.sep.elf 2>/dev/null | awk "{print \$5}") bytes"
echo "=== run ==="; timeout 120 $O/$PROG.sep.elf; echo "rc=$?"
