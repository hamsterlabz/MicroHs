#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
FUNUPD_WATCH=1 timeout 2400 $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf \
  --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot V1 -ofunboot/v1.S 2>&1 \
  | grep -E "WATCH|s\[|no progress" | head -80 > funboot/watch.log
echo done >> funboot/watch.log
