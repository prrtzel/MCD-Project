ENTRY(__main)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

SECTIONS
{
  . = 0x01000000;
  .text : { *(.text) }
  .data : { *(.data) }
  .bss : { *(.bss) }
}