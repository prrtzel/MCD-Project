ENTRY(start)

SECTIONS
{
    . = 0000;

    .text :
    {
        *(.text)
    }
}