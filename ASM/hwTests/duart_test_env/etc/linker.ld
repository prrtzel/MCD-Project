ENTRY(start)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    VECTOR  (rx)    : ORIGIN = 0x00000000,  LENGTH = 1k
    ROM     (rx)    : ORIGIN = 0x00000400,  LENGTH = 500K
    RAM     (rwx)   : ORIGIN = 0x00100000,  LENGTH = 128K
}

PROVIDE(__stack = 0x0011fff0);

SECTIONS
{
    .vecs : {vector.o} > VECTOR

    .text :
    {
        *(.text)
    }> ROM

    .data :
    {
        *(.data)
    }> RAM

    .bss :
    {
        *(.bss)
    }> RAM   
}