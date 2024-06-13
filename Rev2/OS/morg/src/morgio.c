#include "startup.h"
extern void serial_print(const char* str_ptr);



static char* str_ptr_buffer;
void serial_print(const char* str_ptr) {
    str_ptr_buffer = (char*) str_ptr;
#ifdef SIM
    __asm__(" 
        move.l  str_ptr_buffer, %a1
        move.b  #14, %d0   
        trap    #15
    ");
#endif
#ifdef HW

#endif
}