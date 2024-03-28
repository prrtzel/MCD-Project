#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

#define MAIN
//#define TEST

char str[8] = {0};
long value;
extern int __main() {
#ifdef MAIN
    init();
    while (exit_status == 0) {
        get_input();
        parse_cmd();      
    }

#endif
#ifdef TEST
    int i = 0;
    get_input();
    value = ascii_hex_to_bin(&input_buffer[i], 8);
    binary_to_ascii_hex(value, &str[0], 8);
    serial_print(&str[0]);
#endif
    return 0;
}

