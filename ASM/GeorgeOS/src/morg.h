#ifndef MORG_H
#define MORG_H

enum registers {
    d0,
    d1,
    d2,
    d3,
    d4,
    d5,
    d6,
    d7,
    a0,
    a1,
    a2,
    a3,
    a4,
    a5,
    a6,
    a7
};

void read_memory(int address);

void mem_dump(int starting_address, int ending_address);

void write_memory(int address, char data);

void read_register(enum registers reg);

void write_register(enum registers reg, int data);

void parse_cmd(char* command, char length);
#endif