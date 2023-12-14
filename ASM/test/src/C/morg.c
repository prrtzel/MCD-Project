#include "headers/morg.h"
#include "headers/stdio.h"

void writeMemory() {
    char* addressPtr;
    char data;
    char* addressStr;
    char* byteToWriteStr;
    
    addressStr = sgetStr();
    addressPtr = getAddress(addressStr); //get address and store in buffer

    byteToWriteStr = sgetStr();
    data = parseValue(byteToWriteStr); //get data and store in buffer

    char* address = addressPtr; //parse string into address
    *address = data;  //dereference address and write to location
}

void readMemory(char* address){
    char value = getValueAtAddress(address);
    sprintValueAtAddress(value);
}

char getValueAtAddress (char* address) {
    char* binAddress = getAddress(address);
    char value = *binAddress;    //obtain value at address
    return value;
}

void sprintValueAtAddress(char value) {
    char* string = bin2ahexbyte(value);
    sprintByte(string);
}

char* getAddress(char* address) {
    char buffer[8];
    char* addrOut = 0;
    
    buffer[0] = *address;       //parse string into buffer
    buffer[1] = *(address + 1); 
    buffer[2] = *(address + 2); 
    buffer[3] = *(address + 3);
    buffer[4] = *(address + 4);
    buffer[5] = *(address + 5); 
    buffer[6] = *(address + 6); 
    buffer[7] = *(address + 7);

    char j = 7;
    for (char i=0; i<8; i++) {
        buffer[i] = ahex2bin(buffer[i]);        //convert ascii char to bin 
        addrOut = (buffer[i] << (j * 4)) + addrOut; //shift everything into one value
        j--;
    }
    return addrOut;
}

char parseValue(char* string) {
    char buffer[2];
    int valOut = 0;
    
    buffer[0] = *string;       //parse string into buffer
    buffer[1] = *(string + 1); 

    int j = 1;
    for (int i=0; i<2; i++) {
        buffer[i] = ahex2bin(buffer[i]);        //convert ascii char to bin 
        valOut = (buffer[i] << (j * 4)) + valOut; //shift everything into one value
        j--;
    }
    return valOut;
}

