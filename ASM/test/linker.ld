ENTRY(main)

SECTIONS
{
    . = 0000;

    .text :
    {
        *(.text)
    }
}