#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

extern int __main() {
    char value = read_memory(0);
    binary_to_ascii_hex(value, hex_ascii_buffer, HEX_BYTE_LENGTH);
    serial_print(&hex_ascii_buffer[0]);
    return 0;
}