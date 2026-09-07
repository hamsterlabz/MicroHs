#!/bin/bash
# The bootstrap gate: the fun-native mhs compiles MicroHs.Main, and its .S must
# match what the host gmhs produces for the same input (modulo the header
# comment, which names the output path).
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
FUNGC=${FUNGC:-1} FUNGCMB=${FUNGCMB:-1024} FUNGCFLOOR=${FUNGCFLOOR:-256} \
  timeout 86000 $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf --rvfun-io --rv32 -v \
  -i -imhs -isrc -ilib -ipaths MicroHs.Main -ofunboot/stage2 > funboot/selfhost.log 2>&1
echo "rc=$?" >> funboot/selfhost.log
