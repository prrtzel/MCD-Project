#ifndef MORG_H
#define MORG_H

#define OUTPUT_BUFFER_SIZE 100
#define INPUT_BUFFER_SIZE 80
#define COMMAND_BUFFER_SIZE 80;
char output_buffer[OUTPUT_BUFFER_SIZE];
char input_buffer[INPUT_BUFFER_SIZE];
char command_buffer[80];
char srec_data[];

char srecord[80];

extern char newline[];

char exit_status;

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

void print_menu();

void init();

void get_input();

void read_memory(long address);

void mem_dump(long starting_address, long ending_address);

void write_memory(long address, char data);

void read_register(enum registers reg);

void write_register(enum registers reg, int data);

void load_srecord();

void parse_cmd();

void transfer_buffer();

void run_srec();

void parse_srecord();
#endif