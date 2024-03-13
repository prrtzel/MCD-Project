#include "stdio.h"

char* serial_print_pointer = 0;
char style_buffer = 0;
int color_buffer = 0;
char backspace[] = " \b\0";
char eot[] = "\n\r\0";

extern void serial_print(char* str_p) {
    serial_print_pointer = str_p;
#ifdef SIM
    __asm__(" 
        move.l  serial_print_pointer, %a1
        move.b  #14, %d0   
        trap    #15
        ");
#endif
#ifdef HARDWARE
#endif
}

char charBuffer = 0;
extern char getChar() {
#ifdef SIM
    __asm__("
	    move.l	#5, %d0
	    trap	#15
	    move.b	%d1, charBuffer
    ");
    return charBuffer;
#endif
#ifdef HARDWARE
#endif
}

extern void set_font(int color, char style) {
    style_buffer = style;
    color_buffer = color;
#ifdef SIM
    __asm__("
        move.l  color_buffer, %d1
        move.b  style_buffer, %d2
        move.b  #21, %d0   
        trap    #15
        ");
#endif
#ifdef HARDWARE
#endif
}

extern void reset_font() {  
    set_font(0x00ffffff, 0);
}

extern void serial_print_error(char* error_message) {
    set_font(RED, BOLD);
    serial_print(error_message);
    reset_font();
}


extern void clear_buffer(char* input_buffer, char length) {
    int i = 0;
    for (i = 0; i < length; i++) {
        input_buffer[i] = 0;
    }
}

extern void getString(char* input_buffer, char length) {
    int i = 0;
    char char_buffer = 1;
    
    clear_buffer(input_buffer, length);

    while (char_buffer != '\r') {
        char_buffer = getChar();

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

    //this line eliminates the last character in the
    //last spot. Dont know why this is but...yeah
    input_buffer[length] = '\0';
}