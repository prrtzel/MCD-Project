#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

#define MAIN
//#define TEST

char str[8] = {0};
extern int __main() {
#ifdef MAIN
    init();
    while (exit_status == 0) {
        get_input();
        parse_cmd(input_buffer, INPUT_BUFFER_SIZE);
        
    }

#endif
#ifdef TEST

    int i = 0;
    get_input();
    for (i = 0; i < 8; i++) {
        str[i] = ascii_hex_to_bin(input_buffer[i]);
    }

    binary_to_ascii_hex(0x12345678, &str[0], 8);
    serial_print(&str[0]);
#endif
    return 0;
}

