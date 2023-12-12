#include "headers/stdio.h"

/*
until the EOT char is recieved
a character is put into a string buffer
the buffer index is incremented and it repeats
*/
char * sgetStr(void) {
    char character;
    char buffer[50];
    unsigned int i = 0;

    while(character != EOT) {
        unsigned int value = (unsigned int)character;
        character = sgetChar();
        buffer[i] = character;
        i++;
    }
    return buffer;
}
//--------------------------------------------------------------
// Conversions

//Converts Ascii Hex to Hex Ex: 'F' -> 0x0F
char aHex2Bin(char asciiChar) {
    unsigned int value = (unsigned int) asciiChar;
    // if lowercase value subtract amount to convert letter to number
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
    return (char) value;
}