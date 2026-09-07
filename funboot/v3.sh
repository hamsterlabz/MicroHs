#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
timeout 2400 $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf -v -v -v \
  --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot V1 -ofunboot/v1.S \
  > funboot/v3.log 2>&1
echo "rc=$?" >> funboot/v3.log
