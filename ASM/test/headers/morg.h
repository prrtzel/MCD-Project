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
void writeMemory();

//parse a byte from
char parseValue(char* string);
#endif