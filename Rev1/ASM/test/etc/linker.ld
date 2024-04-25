ENTRY(main)

MEMORY
{
    VECTORS(rx): ORIGIN = 0x00000000, LENGTH = 4090
    ROM(rx)   : ORIGIN = 0x00001000, LENGTH = 400k
    SRAM(rwx) : ORIGIN = 0x00080000, LENGTH = 400k
}

SECTIONS
{
    .isr_vector :
    {
        *(.isr_vector)
    }> VECTORS
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
    }> SRAM AT> ROM

    .bss :
    {
        __start_bss__ = .;
        *(.bss)
        __end_bss__ = .;
    }> SRAM
}