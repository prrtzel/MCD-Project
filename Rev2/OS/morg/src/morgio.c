#include "morgio.h"
#include "crt0.h"

// Assembly references need a non local variable

// serial_print buffer
static char* str_ptr_buffer;
// get_char buffer
static char get_char_buffer;

const char input_overflow_error[] = "Error: too large an input!";
const char backspace[] = " \b\0";
const char eot[] = "\n\r\0";


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
#ifdef HARDWARE

#endif
    return;
}

extern void get_string() {
    int i = 0;
    char char_buffer = 1;
    
    clear_buffer(&input_buffer[0], INPUT_BUFFER_SIZE);

    while (char_buffer != '\r') {
        if (i > INPUT_BUFFER_SIZE) {
            serial_print(&input_overflow_error[0]);
            return;
        }

        char_buffer = get_char();

        if (char_buffer == BACKSPACE) {
            i--;
            input_buffer[i] = '\0';
            serial_print(&backspace[0]);
        }
        else {
            input_buffer[i] = char_buffer;
            i++;
        }
    }
    input_buffer[i + 1] = '\0';
    serial_print(&eot[0]);
}

extern void clear_buffer(char* buffer, int size) {
    int i = 0;
    for (i = 0; i < size; i++) {
        *buffer++ = 0;
    }
}

extern enum bool cmp_str(const char* str1, const char* str2, int length) {
    int i = 0;
    for (i = 0; i < length; i++) {
        if (*str1 != *str2) {
            return false;
        }
        str1++;
        str2++;
    }
    return true;
}