ENTRY(__main)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    RAM (rwx) : ORIGIN = 0x00110000, LENGTH = 128K - 64k
}


PROVIDE(_estack = 0x00100000 + 0x0001FFF0); 

SECTIONS
{
    .text :
    {
        . = ALIGN(4);
        *(.text)
        _etext = .;
        . = ALIGN(4);
    }> RAM

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