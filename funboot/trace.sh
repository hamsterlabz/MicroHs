#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
timeout 300 $Q -cpu rv32,xfun=on -d exec,nochain -D /dev/stdout \
  ./funboot/mhsfun.elf --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot \
  Tiny -ofunboot/tiny_self 2>&1 | tail -c 200000 > funboot/exec_tail.log
echo "trace done rc=$?" >> funboot/exec_tail.log
