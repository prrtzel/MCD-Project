#include "morg.h"
#include "stdio.h"
#include "conversions.h"

char space[] = " ";
char newline[] = "\n\r";
char output_buffer[OUTPUT_BUFFER_LENGTH] = {0};

void read_memory(int address){
    char* address_pointer = (char*) address;
    char value = *address_pointer;
    binary_to_ascii_hex(value, output_buffer, HEX_BYTE_LENGTH);
    serial_print(&output_buffer[0]);
    clear_buffer(output_buffer, OUTPUT_BUFFER_LENGTH);
}

void mem_dump(int starting_address, int ending_address){
    int i = 0;
    int j = 1;
    for (i = starting_address; i < ending_address; i++) {
        read_memory(starting_address + i);
        serial_print(&space[0]);
        if (j == 16) {
            serial_print(&newline[0]);
            j = 0;
        }
        j++;
    }
}

void write_memory(int address, char data){

}

void read_register(enum registers reg){

}

void write_register(enum registers reg, int data){

}

void parse_cmd(char* command, char length){

    //read and display memory

    // char value = read_memory(0);
    // binary_to_ascii_hex(value, hex_ascii_buffer, HEX_BYTE_LENGTH);
    // serial_print(&hex_ascii_buffer[0]);



}

void clear_output_buffer() {

}