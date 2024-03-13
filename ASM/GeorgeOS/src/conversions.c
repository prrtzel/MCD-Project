#include "conversions.h"
#include "stdio.h"

//error codes
char error0[] = "Conversion error in ascii_hex_to_bin: value > 0x0F\0";


extern char ascii_hex_to_bin (char ascii_char) {
    char value = ascii_char;
    // if lowercase letter, subtract to convert to 0-16 range
    if (value >= 0x61 && value <= 0x66) {
        value = value - 0x57;
    }
    // if uppercase letter subtract amount to convert letter to number
    else if (value > 0x39) {
        value = value - 0x37;
    }
    // subtract 0x30 to extract just the digits
    else {
        value = value - 0x30;
    }
    if (value > 0x0F) {
        serial_print_error(&error0[0]);
        return 0;
    }
    return value;
}

char ascii_decimal_to_bin(char ascii_char) {
    char value = ascii_char;
    value = value - 0x30;
    return value;
}

void binary_to_ascii_hex(char binary_value, char* str_buffer, char length) {
    int i = 0;

    //set binary value to array of characters
    for(i = 0; i < length; i++) {
        
    }
}