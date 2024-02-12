ENTRY(main)

MEMORY
{
    ROM (RX)  : ORIGIN = 0X00000000, LENGTH = 500k
    RAM (!RX) : ORIGIN = 0x00080000, LENGTH = 128k
    UART (!RX): ORIGIN = 0x000C0000, LENGTH = 255
}

SECTIONS
{
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
    }> RAM AT> ROM

    .bss :
    {
        __start_bss__ = .;
        *(.bss)
        __end_bss__ = .;
    }> RAM   
}