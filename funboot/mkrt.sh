#!/bin/bash
# Regenerate the linux runtime from the CURRENT compiler, then apply the two
# runtime-only pieces the generator does not emit: NF_ADDR pointing at a real
# epilogue, and the epilogue itself.  The epilogue completes the nested-frame
# force (eval.c's evali on the C stack, see the _seq blob): at NORMAL_FORM the
# spine holds only the innermost force's frame, so drain it and jump to that
# frame's resume; with no force in flight the whole program reduced to a
# function, which is reported and is exit 71.
set -e
cd /home/cecil/work/lambdalinux/MicroHs
./bin/gmhs --bare --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot Nop -ofunboot/pre32 > /dev/null 2>&1
./bin/gmhs --bare       -i -imhs -isrc -ilib -ipaths -ifunboot Nop -ofunboot/pre64 > /dev/null 2>&1
cd funboot
python3 mkrt2.py > /dev/null
python3 - <<'PYEOF'
s = open("rt_linux.S").read()

# the runtime's text goes in its own section (the linker script places it first)
s = s.replace('  .text\n', '  .section .text.rt,"ax",@progbits\n', 1)

# NF_ADDR must be a real epilogue, never a _start-like value
old = """  la   t0, _fungraph_start
  csrw 0x7c1, t0               # graph base (bookkeeping)"""
new = """  la   t0, _nf_epi
  csrw 0x7c1, t0               # NF_ADDR: the NORMAL_FORM epilogue"""
assert old in s, "csr 0x7c1 anchor"
s = s.replace(old, new, 1)

old2 = "_heap_fail:"
new2 = """_nf_epi:                       # NORMAL FORM: an under-applied head.  Inside a
1:                             # nested force the spine holds only that frame:
  fn.pop t0                    # drain it and resume the forcer, which discards
  bnez t0, 1b                  # or inspects the value as it sees fit.
  la   t1, _force_resume
  lw   t1, 0(t1)
  beqz t1, _nf_top
  jr   t1

_nf_top:                       # no force in flight: the program IS a function
  la   a1, _nfmsg
  li   a2, 33
  li   a0, 2
  li   a7, 64
  ecall
  li   a0, 71
  li   a7, 93
  ecall
  .balign 4
_nfmsg:
  .asciz "fun: normal form, nothing to resume\\n"
  .balign 4

_heap_fail:"""
assert old2 in s, "heap_fail anchor"
s = s.replace(old2, new2, 1)
open("rt_linux.S", "w").write(s)
print("runtime regenerated: nested-frame NF epilogue")
PYEOF
/opt/riscv/bin/riscv32-unknown-elf-as -march=rv32imf_zicsr_xfun rt_linux.S -o rt_linux.o
echo "OK: rt_linux.o rebuilt; _seq is now:"
sed -n '/^_seq:/,/^_seq_resume:/p' rt_linux.S | head -8
