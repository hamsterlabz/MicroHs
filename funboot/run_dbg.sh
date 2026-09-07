#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
timeout 300 /home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32 -cpu rv32,xfun=on \
  ./funboot/mhsdbg.elf --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot \
  Tiny -ofunboot/tiny_self > funboot/dbgrun.log 2>&1
echo "rc=$?" >> funboot/dbgrun.log
