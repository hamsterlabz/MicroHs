#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
FUNUPD_TRACE=1 FUNHW_TRACE=1 timeout 2400 $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf \
  --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot V1 -ofunboot/out_V1.S 2>&1 \
  | grep -E "mem\[3da86c[0-9a-f]|no progress" | head -60 > funboot/cellhist.log
echo done >> funboot/cellhist.log
