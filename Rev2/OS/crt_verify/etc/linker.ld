ENTRY(Reset_Handler)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 500K
    RAM (rwx) : ORIGIN = 0x00100000, LENGTH = 128K
}


PROVIDE(_estack = 0x00100000 + 0x0001FFF0); 

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
        _etext = .;
        . = ALIGN(4);
    }> ROM

    .data :
    AT (ADDR(.text) + SIZEOF (.text))
    { 
        . = ALIGN(4);
        _sdata = .; 
        *(.data);
        _edata = .;  
        . = ALIGN(4);
    } > RAM

    .bss :
    {
        . = ALIGN(4);
        _sbss = .;
        *(.bss)
        _ebss = .;
        . = ALIGN(4);
    }> RAM
}