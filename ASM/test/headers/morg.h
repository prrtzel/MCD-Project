#ifndef MORG_H
#define MORG_H






/*
reads an ascii longword and prints its contents 
*/
void readMemory(char* address);

// takes ascii hex address string and converts it to an address in binary
char* getAddress(char* address);

//gets value at address
char getValueAtAddress(char* address);

//prints value at address
void sprintValueAtAddress(char value);

//writes a byte to a memory location
//takes two string pointers
void morgWriteMemory();

void writeMemory(char* address, char data);

//parse a byte from
char parseValue(char* string);

void readRegisters(char choice);
int readRegD0(__reg("d0") int d0);
int readRegD1(__reg("d1") int d1);
int readRegD2(__reg("d2") int d2);
int readRegD3(__reg("d3") int d3);
int readRegD4(__reg("d4") int d4);
int readRegD5(__reg("d5") int d5);
int readRegD6(__reg("d6") int d6);
int readRegD7(__reg("d7") int d7);
char* register2ASCII(long int reg); 

#endif