#include "morg.h"

char read_memory(int address){
    char* address_pointer = (char*) address;
    char value = *address_pointer;
    return value;
}

void mem_dump(int starting_address, int ending_address){

}

void write_memory(int address, char data){

}

void read_register(enum registers reg){

}

void write_register(enum registers reg, int data){

}

void parse_cmd(char* command, char length){

}