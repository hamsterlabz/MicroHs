#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
timeout 280 $Q -cpu rv32,xfun=on -d in_asm,nochain -D /dev/stdout \
  ./funboot/mhsfun.elf --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot \
  Tiny -ofunboot/tiny_self 2>&1 | grep -A8 "35fcbf78" | head -60 > funboot/heapcell.log
echo done >> funboot/heapcell.log
