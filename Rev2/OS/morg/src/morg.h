#ifndef MORG_H
#define MORG_H
    
#define NUM_OF_COMMANDS 8

extern enum bool exit_code;

extern void print_menu(void);

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

void read_memory(long address);

void mem_dump(long starting_address, long ending_address);

void write_memory(long address, char data);

void read_register(enum registers reg);

void write_register(enum registers reg, int data);

/**
 * @brief parses an srec string and writes it to memory
 * 
 * @param srec pointer to srec string
 * @return long - address of srec start
 */
long load_srec(char* srec);

void write_srec_data(char* data, int length, char* address);

void run_srec(long address);

extern void parse_cmd();

extern void get_input();

#endif