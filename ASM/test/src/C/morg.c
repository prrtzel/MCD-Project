#include "headers/morg.h"
#include "headers/stdio.h"


void readMemory(char* address){
    int value = parseAddress(address);
    value = *(char*)value;

    char* string = bin2ahexbyte(value);
    sprintByte(string);
}


int parseAddress(char* address) {
    char buffer[8];
    int addrOut = 0;
    buffer[0] = *address;
    buffer[1] = *(address + 1); 
    buffer[2] = *(address + 2); 
    buffer[3] = *(address + 3);
    buffer[4] = *(address + 4);
    buffer[5] = *(address + 5); 
    buffer[6] = *(address + 6); 
    buffer[7] = *(address + 7);

    for (int i=0; i<8; i++) {
        buffer[i] = ahex2bin(buffer[i]);
    }

    addrOut = (buffer[0] << 28) + (buffer[1] << 24) + (buffer[2] << 20) + (buffer[3] << 16) + (buffer[4] << 12) + (buffer[5] << 8) + (buffer[6] << 4) + (buffer[7]);

    return addrOut;
}

