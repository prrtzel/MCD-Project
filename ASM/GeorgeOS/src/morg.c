#include "morg.h"
#include "stdio.h"
#include "conversions.h"

//menu strings
char menu_name[] = "GeorgeOS\n\r\0";
char menu_distribute[] = "Distribute at your own risk!\n\r\0";
char menu_version[] = "ver 1.0\n\rType 'help' for a list of commands";

char shell_pretty_thing[] = ">>\0";

char space[] = " ";
char newline[] = "\n\r";
char output_buffer[OUTPUT_BUFFER_SIZE] = {0};
char input_buffer[INPUT_BUFFER_SIZE] = {0};

//if exit status == 1, stop the program
char exit_status = 0;

void print_menu() {
    set_font(WHITE, BOLD);
    serial_print(&menu_name[0]);
    set_font(RED, ITALLIC);
    serial_print(&menu_distribute[0]);
    reset_font();
    serial_print(&menu_version[0]);
}

void init() {
    print_menu();
}

void get_input() {
    serial_print(&shell_pretty_thing[0]);
    getString(input_buffer, INPUT_BUFFER_SIZE);
}


void read_memory(long address){
    char* address_pointer = (char*) address;
    char value = *address_pointer;
    binary_to_ascii_hex(value, output_buffer, HEX_BYTE_LENGTH);
    serial_print(&output_buffer[0]);
    clear_buffer(output_buffer, OUTPUT_BUFFER_SIZE);
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

void read_register(enum registers reg){

}

void write_register(enum registers reg, int data){

}

void parse_cmd(){
    if (input_buffer[0] == 'e') {
        if (input_buffer[0] == 'x') {
            if (input_buffer[0] == 'i') {
                if (input_buffer[0] == 't') {
                    exit_status = 1;
                }
            }
        }
    }
}