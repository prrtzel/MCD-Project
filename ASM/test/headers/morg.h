#ifndef MORG_H
#define MORG_H

/*
reads an ascii longword and prints its contents 
*/
void readMemory(char* address);

// takes ascii hex address and converts it to an addres in binary
int parseAddress(char* address);

#endif