#!/bin/bash
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
FUNUPD_TRACE=1 FUNHW_TRACE=1 timeout 3000 $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf \
  --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths -ifunboot Tiny -ofunboot/tiny_self.S 2>&1 \
  | grep -E "8002689|3dc16ef|no progress" | tail -30 > funboot/cell_trace.log
echo "done rc=$?" >> funboot/cell_trace.log
