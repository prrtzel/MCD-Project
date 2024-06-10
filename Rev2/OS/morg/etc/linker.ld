ENTRY(Reset_Handler)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 500K
    RAM (rwx) : ORIGIN = 0x00100000, LENGTH = 128K
}



SECTIONS
{
    .isr_vec :
    {
        . = ALIGN(4);
        *(.isr_vec)
        . = ALIGN(4);
    }> ROM

    .text :
    {
        . = ALIGN(4);
        *(.text)
        *(.rodata)
        . = ALIGN(4);
    }> ROM

    .data :
    {
        . = ALIGN(4);
        _sidata = LOADADDR(.data);
        _sdata = .;
        *(.data)
        _edata = .;
        . = ALIGN(4);
    } > RAM AT > ROM

    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        _ebss = .;
        . = ALIGN(4);
    }> RAM

    _estack = 0x00100000 + 0x1FFFF;   
}