#include "conversions.h"
#include "stdio.h"

//error codes
char ascii_hex_to_bin_error[] = "Conversion error in ascii_hex_to_bin: value > 0x0F\0";
char binary_to_ascii_hex_error[] = "Conversion error in binary_to_ascii_hex: idk some weird stuff\0";

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
        serial_print_error(&ascii_hex_to_bin_error[0]);
        return 0;
    }
    return value;
}

extern char ascii_decimal_to_bin(char ascii_char) {
    char value = ascii_char;
    value = value - 0x30;
    return value;
}

extern void binary_to_ascii_hex(int binary_value, char* str_buffer, unsigned char length) {
    int i = 0;
    unsigned char shift_value = 0;

    //set binary value to array of characters
    for (i = 0; i < length; i++) {
        //shift value decrements. Ex: 12, 8, 4 if length = 4
        shift_value = ((length - 1) * 4) - (i * 4);
        str_buffer[i] = (binary_value & (0x0000000f << shift_value)) >> shift_value;

        if (str_buffer[i] <= 0x09 && str_buffer[i] >= 0x00) {
            str_buffer[i] = str_buffer[i] | 0x30;
        }
        else if (str_buffer[i] <= 0x0f && str_buffer[i] >= 0x0a) {
            str_buffer[i] = str_buffer[i] - 0x09;
            str_buffer[i] = str_buffer[i] | 0x40;
        }
        else {
            serial_print_error(&binary_to_ascii_hex_error[0]);
            return;
        }
    }
    str_buffer[length] = 0;
}