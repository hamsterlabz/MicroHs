#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
timeout 2400 $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf -v \
  --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot V1 -ofunboot/out_V1.S \
  > funboot/digfun.log 2>&1
echo "rc=$?" >> funboot/digfun.log
