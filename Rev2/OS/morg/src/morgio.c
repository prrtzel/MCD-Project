#include "startup.h"
#include "morgio.h"

extern char get_char() {
#ifdef SIM
    __asm__("
	    move.l	#5, %d0
	    trap	#15
	    move.b	%d1, get_char_buffer
    ");
    return get_char_buffer;
#endif
#ifdef HARDWARE
#endif
}

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

