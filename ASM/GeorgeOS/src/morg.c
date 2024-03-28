#include "morg.h"
#include "stdio.h"
#include "conversions.h"

//menu strings
char menu_name[] = "GeorgeOS\n\r\0";
char menu_distribute[] = "Distribute at your own risk!\n\r\0";
char menu_version[] = "ver 1.0\n\rType 'help' for a list of commands\r\n\0";
char shell_pretty_thing[] = "\n\r>>\0";

char parse_error[] = "Error: parse error!";

char help_menu[] = "GeorgeOS\n\r
'help' -- gives a list of commands\n\r
'1'    -- read memory Ex: 1 00ff00ff\n\r
'2'    -- dump memory Ex: 2 00000000 00001000\n\r
'3'    -- write to memory Ex: 3 00ff0012 32\n\r

\n\r";

char space[] = " ";
char newline[] = "\n\r";
char output_buffer[OUTPUT_BUFFER_SIZE] = {0};
char input_buffer[INPUT_BUFFER_SIZE] = {0};
char command_buffer[100] = {0};

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
    for (i = starting_address; i <= ending_address; i++) {
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

void transfer_buffer() {
    int i = 0;
    for (i = 0; i < 100; i++) {
        command_buffer[i] = input_buffer[i];
    }    
}


char testBuffer[8] = {0};
void parse_cmd() {
    transfer_buffer();

    if (command_buffer[0] == 'h') {
        if (command_buffer[1] == 'e') {
            if (command_buffer[2] == 'l') {
                if (command_buffer[3] == 'p') {
                    serial_print(&help_menu[0]);
                }
            }
        }
    }
    if (command_buffer[0] == 'e') {
        if (command_buffer[1] == 'x') {
            if (command_buffer[2] == 'i') {
                if (command_buffer[3] == 't') {
                    exit_status = 1;
                }
            }
        }
    }
    switch (command_buffer[0]) {
    long value_1;
    long value_2;
    case '1':
    //read memory
        value_1 = ascii_hex_to_bin(&command_buffer[2], 8);
        read_memory(value_1);
        break;
    case '2':
    //mem dump
        value_1 = ascii_hex_to_bin(&command_buffer[2], 8);
        value_2 = ascii_hex_to_bin(&command_buffer[11], 8);
        mem_dump(value_1, value_2);
        break;
    case '3':
    //write to memory
        value_1 = ascii_hex_to_bin(&command_buffer[2], 8);
        value_2 = ascii_hex_to_bin(&command_buffer[11], 2);
        write_memory(value_1, value_2);
        break;
    case '4':
    //read register
        break;
    case '5':
    //write to register
        break;
    case '6':
    //load srec
        break;
    case '7':
    //run srec
        break;
    default:
        break;
    }
}