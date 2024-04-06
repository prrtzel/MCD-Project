#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#define HEX_BYTE_LENGTH 2 
#define HEX_WORD_LENGTH 4
#define HEX_LONG_LENGTH 8

extern long ascii_hex_to_bin (char* ascii_buffer, int length);

extern char ascii_decimal_to_bin(char ascii_char);

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
*/
extern void binary_to_ascii_hex(long int binary_value, char* str_buffer, unsigned char length);

#endif