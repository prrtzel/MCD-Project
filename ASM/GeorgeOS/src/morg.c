#include "morg.h"
#include "stdio.h"
#include "conversions.h"

//BE SURE TO ADD EXCEPTIONS!!!

char space[] = " ";
char newline[] = "\n\r";
char output_buffer[OUTPUT_BUFFER_LENGTH] = {0};

void read_memory(long address){
    char* address_pointer = (char*) address;
    char value = *address_pointer;
    binary_to_ascii_hex(value, output_buffer, HEX_BYTE_LENGTH);
    serial_print(&output_buffer[0]);
    clear_buffer(output_buffer, OUTPUT_BUFFER_LENGTH);
}

void mem_dump(long starting_address, long ending_address){
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

void write_memory(long address, char data){
    char* address_pointer = (char*) address;
    *address_pointer = data;
}

//NEEDS TO SAVE REGISTERS BEFORE EDITING/READING!!
long result = 0;
void read_register(enum registers reg){
    switch(reg) {
        case d0:
            __asm__("move.l %d0, result");
            break;
        case d1:
            __asm__("move.l %d1, result");
            break;
        case d2:
            __asm__("move.l %d2, result");
            break;
        case d3:
            __asm__("move.l %d3, result");
            break;
        case d4:
            __asm__("move.l %d4, result");
            break;
        case d5:
            __asm__("move.l %d5, result");
            break;
        case d6:
            __asm__("move.l %d6, result");
            break;
        case d7:
            __asm__("move.l %d7, result");
            break;
        case a0:
            __asm__("move.l %a0, result");
            break;
        case a1:
            __asm__("move.l %a1, result");
            break;
        case a2:
            __asm__("move.l %a2, result");
            break;
        case a3:
            __asm__("move.l %a3, result");
            break;
        case a4:
            __asm__("move.l %a4, result");
            break;
        case a5:
            __asm__("move.l %a5, result");
            break;
        case a6:
            __asm__("move.l %a6, result");
            break;
        case a7:
            __asm__("move.l %a7, result");
            break;
        default:
            break;
    }
    binary_to_ascii_hex(result, output_buffer, HEX_LONG_LENGTH);
    serial_print(&output_buffer[0]);
    clear_buffer(output_buffer, OUTPUT_BUFFER_LENGTH);
}

void write_register(enum registers reg, int data){

}

void parse_cmd(char* command_buffer, char length){
    int i = 0;
    for (i = 0; i < length; i++) {
        
    }
}