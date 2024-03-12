#include "stdio.h"

char* serial_print_pointer = 0;
char style_buffer = 0;
int color_buffer = 0;
char input_buffer[INPUT_BUFFER_SIZE] = {0};

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
	move.l	%d1, charBuffer
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

extern void clear_input_buffer() {
    int i = 0;
    for (i = 0; i < INPUT_BUFFER_SIZE; i++) {
        input_buffer[i] = 0;
    }
}

extern void getString() {
    int i = 0;

    clear_input_buffer();

    while (i == 0) {
        input_buffer[i] = getChar();
        i++;
    }
    input_buffer[i + 1] = '\0';
}