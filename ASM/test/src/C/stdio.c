#include "headers/stdio.h"

void modReg(void);

//NEEDS MALLOC FOR SAFE OPERATION
char* sgetStr(void) {
    char inputStrSymbol[] = ">>";
    sprint(inputStrSymbol);
    char eot[] = "\n\r\0";
    char back[] = " \b\0";
    char character = 1; //DO NOT CHANGE TO 0!!!
    char buffer[50];
    unsigned int i = 0;

    //clear buffer
    for(int i=0; i<50; i++){
        buffer[i] = 0;
    }  

    int j=0;
    while(character != '\r') {
        character = sgetChar();
        if(character == BACKSPACE) {
            j--;
            buffer[j] = '\0';
            sprint(back);
        }
        else {
            buffer[j] = character;
            j++;
        }  
    }
    buffer[j+1] = '\0';
    sprint(eot);
    return buffer; 
}


void sprintLongWord(char* arrayPtr) {
    char array[11];
    array[0] = *arrayPtr;
    array[1] = *(arrayPtr + 1);
    array[2] = *(arrayPtr + 2);
    array[3] = *(arrayPtr + 3);
    array[4] = *(arrayPtr + 4);
    array[5] = *(arrayPtr + 5);
    array[6] = *(arrayPtr + 6);
    array[7] = *(arrayPtr + 7);
    array[8] = '\r';
    array[9] = '\n';
    array[10] = '\0';
    sprint(array);
}


void sprintWord(char* arrayPtr) {
    char array[7];
    array[0] = *arrayPtr;
    array[1] = *(arrayPtr + 1);
    array[2] = *(arrayPtr + 2);
    array[3] = *(arrayPtr + 3);
    array[4] = '\r';
    array[5] = '\n';
    array[6] = '\0';
    sprint(array);
}

void sprintByte(char* arrayPtr) {
    char array[5];
    array[0] = *(arrayPtr);
    array[1] = *(arrayPtr + 1);
    array[2] = '\r';
    array[3] = '\n';
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

char* bin2ahexlongword(int binaryValue) {
    char array[8];
    array[0] = (binaryValue & 0xf0000000) >> 28;
    array[1] = (binaryValue & 0x0f000000) >> 24;
    array[2] = (binaryValue & 0x00f00000) >> 20;
    array[3] = (binaryValue & 0x000f0000) >> 16;
    array[4] = (binaryValue & 0x0000f000) >> 12;
    array[5] = (binaryValue & 0x00000f00) >> 8;
    array[6] = (binaryValue & 0x000000f0) >> 4;
    array[7] = (binaryValue & 0x0000000f);


    for(int i=0; i<8; i++) {
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


char* bin2ahexword(int binaryValue) {
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

char* bin2ahexbyte(int binaryValue) {
    binaryValue = binaryValue & 0x000000ff;
    char array[4];
    array[0] = (binaryValue & 0x00f0) >> 4;
    array[1] = (binaryValue & 0x000f);


    for(int i=0; i<2; i++) {
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

