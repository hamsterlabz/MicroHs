#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
timeout 200 $Q -strace -cpu rv32,xfun=on \
  ./funboot/mhsfun.elf --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot \
  Tiny -ofunboot/tiny_self 2>&1 | grep -E "openat|write\(2" > funboot/opens.log
echo done >> funboot/opens.log
