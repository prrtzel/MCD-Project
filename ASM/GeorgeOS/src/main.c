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
    
    read_register(d0);
    serial_print(newline);
    write_register(d0, 0x12345678);
    serial_print(newline);
    read_register(d0);
#endif
    return 0;
}

