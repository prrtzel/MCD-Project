#ifndef CONVERSIONS_H
#define CONVERSIONS_H

#define HEX_BYTE_LENGTH 2 
#define HEX_WORD_LENGTH 4
#define HEX_LONG_LENGTH 8

/**
 * @brief Converts ascii hex string to binary
 * 
 * @param ascii_buffer 
 * @param length 
 * @return long 
 */
extern long ascii_hex_to_bin (char* ascii_buffer, int length);

/**
 * @brief Converts ascii decimal string to binary
 * 
 * @param ascii_char 
 * @return char 
 */
extern char ascii_decimal_to_bin(char ascii_char);

/**
 * @brief Converts a binary number to ascii hex
 * 
 * @param binary_value raw value
 * @param str_buffer buffer to place the string in
 * @param length number of characters to produce
 */
extern void binary_to_ascii_hex(long int binary_value, char* str_buffer, unsigned char length);

#endif