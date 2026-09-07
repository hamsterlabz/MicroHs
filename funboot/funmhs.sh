#!/bin/bash
# funmhs.sh <Module> <timeout> - run the fun-native mhs on one module, report
cd /home/cecil/work/lambdalinux/MicroHs
Q=/home/cecil/work/lambdalinux/qemu-src/build-rv32/qemu-riscv32
M=$1; T=${2:-300}
timeout $T $Q -cpu rv32,xfun=on ./funboot/mhsfun.elf --rvfun-io --rv32 \
  -i -imhs -isrc -ilib -ipaths -ifunboot $M -ofunboot/out_$M.S > funboot/out_$M.log 2>&1
rc=$?
echo "$M rc=$rc $(head -c 120 funboot/out_$M.log)"
[ -f funboot/out_$M.S ] && echo "  produced $(wc -c < funboot/out_$M.S) bytes"
