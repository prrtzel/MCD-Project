#ifndef STDIO_H
#define STDIO_H

#define RED         0x000000ff
#define GREEN       0x0000ff00
#define BLUE        0x00ff0000
#define WHITE       0x00ffffff
#define BOLD        0x1
#define ITALLIC     0x2
#define UNDERSCORE  0x4
#define STRIKEOUT   0x8
#define BACKSPACE   0x08

#define SIM
//#define HARDWARE

extern void set_font(int color, char style);

extern void reset_font();

extern void serial_print(char* str_p);

extern char get_char();

extern void put_char(char value);

extern void clear_buffer(char* input_buffer, int length);

extern void transfer_buffer(char* input_buffer, char* output_buffer, int length);

extern void get_string(char* input_buffer, unsigned char length);

extern void serial_print_error(char* error_message);

#endif