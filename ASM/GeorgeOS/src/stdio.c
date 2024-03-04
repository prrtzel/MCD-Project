#include "stdio.h"

char* serial_print_pointer = 0;

extern void serial_print(char* str_p) {
    serial_print_pointer = str_p;
#ifdef SIM
    __asm__(" 
        move.l  serial_print_pointer,%a1
        move.b  #14,%d0   
        trap    #15
        ");
#endif
#ifdef HARDWARE
#endif
}