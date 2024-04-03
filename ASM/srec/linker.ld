ENTRY(__main)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

SECTIONS
{
  . = 0x00300000;
  .text : { *(.text) }
  .data : { *(.data) }
  .bss : { *(.bss) }
}