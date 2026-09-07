/* mech.ld - the compliance tests on the rv64 runtime.
   The tests' cells are FUN WORDS, not macros: they are read, entered and
   memoized into exactly as on the reference machine.  So they must live where
   this runtime interprets cells rather than executing them -- at or above the
   heap base.  .funheap is placed below the runtime's mapping so the two never
   collide.  */
ENTRY(_start)
SECTIONS
{
  . = 0x10000;
  .text   : { *(.text .text.*) }
  .rodata : { *(.rodata .rodata.*) }
  .data   : { *(.data .data.*) }
  .bss    : { *(.bss .bss.*) *(COMMON) }
  . = 0x18000000;
  .funheap : { *(.funheap) }
}
