#include "main.h"
#include "stdio.h"
#include "conversions.h"

extern int __main() {
    getString(&string_input_buffer[0], 100);
    binary_to_ascii_hex(0x69, hex_ascii_buffer, HEX_BYTE_LENGTH);
    serial_print(&hex_ascii_buffer[0]);
    return 0;
}