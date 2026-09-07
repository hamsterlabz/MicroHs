/* linux32.ld - a fun program for Linux (rv32): the runtime object first, then
 * the graph object.  _fungraph_start marks the boundary between them (the value
 * the runtime writes to CSR 0x7c1); _funtext_start/_funtext_end bound the region
 * the runtime mprotects, because Turner updates write into graph cells.
 */
ENTRY(_start)

SECTIONS
{
  . = 0x80001000;

  .text : ALIGN(32) {
    *(.text.rt)
    . = ALIGN(32);
    _fungraph_start = .;
    *(.text .text.*)
    . = ALIGN(32);
  }
  _funtext_end = .;

  .data : ALIGN(32) {
    *(.rodata .rodata.* .srodata*)
    *(.data .data.* .sdata*)
    . = ALIGN(32);
  }

  .bss : ALIGN(4) {
    *(.bss .bss.* .sbss*)
    . = ALIGN(32);
  }
  _end = .;
}
