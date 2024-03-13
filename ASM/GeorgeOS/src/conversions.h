#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#define HEX_BYTE_LENGTH 2 
#define HEX_WORD_LENGTH 4
#define HEX_LONG_LENGTH 8

extern char ascii_hex_to_bin (char asciiChar);
char ascii_decimal_to_bin(char ascii_char);

/**
 * \name binary_to_ascii_hex
 * 
 * converts a binary value to ascii hexadecimal.
 * create an array of ascii hexadecimal values, ie a string
 * sets the string into a buffer given by the user
 * as to avoid any memory oopsies
 * 
 * BUFFER MUST BE EMPTY STRING!!
 * 
 * \param length BYTE, WORD, LONG
 * \param binary_value value to convert to ascii hexadecimal
 * 
 * \returns a pointer to the ascii string
*/
void binary_to_ascii_hex(int binary_value, char* str_buffer, char length);

#endif