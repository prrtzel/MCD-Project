#ifndef MORG_H
#define MORG_H

/*
This function passes in a hex ascii address (4 letters, 8 bytes)
the ascii address is converted to a 4 byte hex address 
this pointer is dereferenced to see what is in that memory
the value is converted to ascii and is returned
*/
void readMemory(char* address);

// takes ascii hex address and converts it to an addres in binary
int parseAddress(char* address);

#endif