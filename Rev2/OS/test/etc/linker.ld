ENTRY(Reset_Handler)
OUTPUT_ARCH(m68k)
OUTPUT_FORMAT(srec)

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 500K
    RAM (rx) : ORIGIN = 0x00100000, LENGTH = 128K
}



SECTIONS
{
    .isr_vec :
    {
        *(.isr_vec)
    }> ROM

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

    _estack = 0x00100000 + 0x1FFFF;   
}