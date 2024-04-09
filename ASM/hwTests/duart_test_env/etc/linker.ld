ENTRY(start)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    VECTOR (rx) : ORIGIN = 0x0, LENGTH = 1k
    ROM (rx)  : ORIGIN = 0x00000400, LENGTH = 500K
    RAM (rwx) : ORIGIN = 0x00100000, LENGTH = 128K
}

PROVIDE(__stack = 0x0011fff0);

SECTIONS
{
    .vecs : {vector.o} > VECTOR

    .text :
    {
        *(.text)
        __end_text__ = .;
    }> ROM

    .data :
    {
        __start_data__ = .;
        *(.data)
        __end_data__ = .;
    }> RAM

    .bss :
    {
        __start_bss__ = .;
        *(.bss)
        __end_bss__ = .;
    }> RAM   
}