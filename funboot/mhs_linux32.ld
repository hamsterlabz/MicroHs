/* mhs_linux32.ld - qemu-user (rv32 Linux) layout for the self-hosted mhs.
 *
 * ONE RWX load segment: a Turner update memoizes a redex by writing the reduct
 * back into the graph cell it came from, so the graph -- which the assembler
 * emits into .text -- must be writable, not read-only text.
 *
 * The reducer heap is NOT part of the image: _start maps it anonymously and
 * seeds CSR 0x7c0 with what the kernel returns, using _heap_page only as a
 * hint so the heap keeps sitting above the graph as it does on the SoC.
 */
ENTRY(_start)

PHDRS { all PT_LOAD FLAGS(7); }   /* R | W | X */

SECTIONS
{
  . = 0x80001000;

  .text : ALIGN(32) {
    *(.text .text.*)
    . = ALIGN(32);
  } :all

  .data : ALIGN(32) {
    *(.rodata .rodata.* .srodata*)
    *(.data .data.* .sdata*)
    . = ALIGN(32);
  } :all

  .bss : ALIGN(4) {
    *(.bss .bss.* .sbss*)
    . = ALIGN(32);
  } :all

  _heap      = ALIGN(., 32);
  _heap_page = ALIGN(., 4096);
}

_heap_bytes = 768 * 1024 * 1024;
