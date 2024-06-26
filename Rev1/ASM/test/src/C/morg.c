#include "headers/morg.h"
#include "headers/stdio.h"



void readRegisters(char choice) {
    int reg;
    modReg();
    switch (choice) {
        case 0:
            reg = readRegD0(0);
            break;
        case 1:
            reg = readRegD1(0);
            break;
        case 2:
            reg = readRegD2(0);
            break;
        case 3:
            reg = readRegD3(0);
            break;
        case 4:
            reg = readRegD4(0);
            break;
        case 5:
            reg = readRegD5(0);
            break;
        case 6:
            reg = readRegD6(0);
            break;
        case 7:
            reg = readRegD7(0);
            break;
        default:
            break;
    }


    char* str = bin2ahexlongword(reg); 
    sprintLongWord(str);

    //print reg by combining two words
    // int firstWord = (reg >> 16) & 0x0000ffff;

    // char* string0 = bin2ahexword(reg);

    // int secondWord = reg & 0x0000ffff; 

    // char* string1 = bin2ahexword(firstWord);
    // sprintWord(string1);
    // char* string2 = bin2ahexword(secondWord);
    // sprintWord(string2);

}

int readRegD0 (__reg("d0") int d0) {
    return d0;
}   
int readRegD1 (__reg("d1") int d1) {
    return d1;
}   
int readRegD2 (__reg("d2") int d2) {
    return d2;
}
int readRegD3 (__reg("d3") int d3) {
    return d3;
}
int readRegD4 (__reg("d4") int d4) {
    return d4;
}
int readRegD5 (__reg("d5") int d5) {
    return d5;
}
int readRegD6 (__reg("d6") int d6) {
    return d6;
}
int readRegD7 (__reg("d7") int d7) {
    return d7;
}

void morgWriteMemory() {
    char* addressPtr;
    char data;
    char* addressStr;
    char* byteToWriteStr;
    char selectData[] = "Select Byte to Write in Hex\n\r";

    addressStr = sgetStr();
    addressPtr = getAddress(addressStr); //get address and store in buffer
    sprint(selectData);
    byteToWriteStr = sgetStr();
    data = parseValue(byteToWriteStr); //get data and store in buffer
    char* address = addressPtr; //parse string into address
    writeMemory(address, data);
}

void writeMemory(char* address, char data) {
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

char* register2ASCII(long int reg) {
    char* string;
    string = bin2ahexlongword(reg);
    return string;
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

