ENTRY(__main)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    VECTOR  (rx)    : ORIGIN = 0x00000000,  LENGTH = 500
    ROM     (rx)    : ORIGIN = 0x00000200,  LENGTH = 500K
    RAM     (rwx)   : ORIGIN = 0x00080200,  LENGTH = 128K
}

PROVIDE(__stack = 0x0008FFF0);

SECTIONS
{
    .vecs : {vector.o} > VECTOR

    .text :
    {
        . = ALIGN(0x10);
        *(.text)
    }> ROM

    .data :
    {
        . = ALIGN(0x10);
        *(.data)
    }> RAM

    .bss :
    {
        . = ALIGN(0x10);
        *(.bss)
    }> RAM   
}