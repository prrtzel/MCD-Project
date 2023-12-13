#include "headers/morg.h"
#include "headers/stdio.h"


void readMemory(char* address){
    int value = parseAddress(address);
    char* string = bin2ahex(value);
    sprintWord(string);
}

//EX: FFFF OR 46464646
int parseAddress(char* address) {
    char buffer[5];
    int addrOut = 0;
    buffer[0] = *address;
    buffer[1] = *(address + 1); 
    buffer[2] = *(address + 2); 
    buffer[3] = *(address + 3);

    for (int i=0; i<4; i++) {
        buffer[i] = ahex2bin(buffer[i]);
    }

    addrOut = (buffer[0] << 12) + (buffer[1] << 8) + (buffer[2] << 4) + (buffer[3]);

    return addrOut;
}