#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

//#define MAIN
#define TEST


char nl[] = "\n\r"; 
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
    serial_print(nl);
    write_register(d0, 0x69);
    serial_print(nl);
    read_register(d0);
#endif
    return 0;
}

