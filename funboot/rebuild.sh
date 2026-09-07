#!/bin/bash
# rebuild.sh - host compiler, fun graph, runtime link. Never pipe this through
# head: a SIGPIPE mid-codegen leaves a truncated .S that still links.
set -e
cd /home/cecil/work/lambdalinux/MicroHs
make bin/gmhs > funboot/build_gmhs.log 2>&1 || { echo "GMHS BUILD FAILED"; tail -6 funboot/build_gmhs.log; exit 1; }
./bin/gmhs --rvfun-io --rv32 -i -imhs -isrc -ilib -ipaths MicroHs.Main -ofunboot/mhsfun > funboot/gen.log 2>&1 || { echo "CODEGEN FAILED"; tail -6 funboot/gen.log; exit 1; }
cd funboot
/opt/riscv/bin/riscv32-unknown-elf-as -march=rv32imf_zicsr_xfun mhsfun.S -o mhsfun.o
/opt/riscv/bin/riscv32-unknown-elf-gcc -march=rv32ima_zicsr -mabi=ilp32 -nostdlib -nostartfiles -static -T linux32.ld rt_linux.o mhsfun.o -o mhsfun.elf 2>/dev/null
echo "REBUILT mhsfun.elf $(stat -c%s mhsfun.elf) bytes from $(stat -c%s mhsfun.S) bytes of .S"
