#include "morgio.h"
#include "strings.h"
#include "conversions.h"

const char tr[] = "Little endian";
const char fl[] = "big endian";
const char str[] = "fale";

long two = 0x5678;

__attribute__((section(".bss")))
long three;
long one = 0x1234;

char y = 'Y';

int __main() {
    one++;
    serial_print("one: ");
    binary_to_ascii_hex(one, input_buffer, HEX_LONG_LENGTH);
    serial_print(&input_buffer[0]);
    return 0;
}