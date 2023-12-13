#include "headers/stdio.h"

//NEEDS MALLOC FOR SAFE OPERATION
char* sgetStr(void) {
    char eot[] = "\n\r\0";
    char back[] = " \b\0";
    char character = 1; //DO NOT CHANGE TO 0!!!
    char buffer[50];
    unsigned int i = 0;
    //clear buffer
    for(int i=0; i<50; i++){
        buffer[i] = 0;
    }
    
    while(character != '\r') {
        character = sgetChar();
        sprint(&character);
        if(character == BACKSPACE) {
            sprint(back);
        }
        buffer[i] = character;
        i++;
    }
    sprint(eot);
    return buffer; 
}

void sprintWord(char* arrayPtr) {
    char array[5];
    array[0] = *arrayPtr;
    array[1] = *(arrayPtr + 1);
    array[2] = *(arrayPtr + 2);
    array[3] = *(arrayPtr + 3);
    array[4] = '\0';
    sprint(array);
}

//--------------------------------------------------------------
// Conversions

char adec2bin(char asciiChar) {
    unsigned int value = (unsigned int) asciiChar;
    value = value - 0x30;
    return (char) value;
}

char ahex2bin(char asciiChar) {
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
    if (value > 0x0F) {
        char error[] = "error";
        sprint(error);
        return 0;
    }
    return (char) value;
}

char * bin2ahex(int binaryValue) {
    binaryValue = binaryValue & 0x0000ffff;
    char array[4];
    array[0] = (binaryValue & 0xf000) >> 12;
    array[1] = (binaryValue & 0x0f00) >> 8;
    array[2] = (binaryValue & 0x00f0) >> 4;
    array[3] = (binaryValue & 0x000f);


    for(int i=0; i<4; i++) {
        if (array[i] <= 0x09 && array[i] >= 0x00) {
            array[i] = array[i] | 0x30;
        }
        else if (array[i] <= 0x0f && array[i] >= 0x0a) {
            array[i] = array[i] - 0x09;
            array[i] = array[i] | 0x40;
        }
        else {
            char error[] = "error";
            sprint(error);
            return 0;
        }
    }
    return array;
}
//--------------------------------------------------------------
// End of Conversions
