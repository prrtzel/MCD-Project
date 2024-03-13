#ifndef STDIO_H
#define STDIO_H

#define RED         0x000000ff
#define GREEN       0x0000ff00
#define BLUE        0x00ff0000
#define WHITE       0
#define BOLD        0x1
#define ITALLIC     0x2
#define UNDERSCORE  0x4
#define STRIKEOUT   0x8
#define INPUT_BUFFER_SIZE 100
#define BACKSPACE 0x08

#define SIM
//#define HARDWARE

/**
 * \name set_font 
 * sets font color and style
 * \param color 
 * \param style 
*/
extern void set_font(int color, char style);

extern void reset_font();

/**
 * \name serial_print
 * Prints a string to the serial monitor
 * set definitions to use simulator vs hardware
 * \param char* Pointer to string
*/
extern void serial_print(char* str_p);


/**
 * \name getChar
 * Returns a character from the serial monitor
 * \return char
*/
extern char getChar();

/**
 * \name clear_input_buffer
 * initializes the buffer to 0
*/
extern void clear_buffer(char* input_buffer, int length);

/**
 * fills the input buffer with a string
*/
extern void getString(char* input_buffer, unsigned char length);

extern void serial_print_error(char* error_message);

#endif