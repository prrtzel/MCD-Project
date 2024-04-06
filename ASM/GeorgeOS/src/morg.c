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
char command_buffer[80] = {0};

char srec_data[] = "S00B0000535245432E533638D8
S11100004E5600007000600000024E5E4E7509
S9030000FC";


//---------
//srecord memory
char srecord[80] = {0};


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

int register_result = 0;
void read_register(enum registers reg){
    register_result = 0;
    switch (reg) {
    case d0:
        __asm__("move.l %d0, register_result");
        break;
    case d1:
        __asm__("move.l %d1, register_result");
        break;
    case d2: 
        __asm__("move.l %d2, register_result");
        break;
    case d3:
        __asm__("move.l %d3, register_result");
        break;
    case d4: 
        __asm__("move.l %d4, register_result");
        break;
    case d5:
        __asm__("move.l %d5, register_result");
        break;
    case d6: 
        __asm__("move.l %d6, register_result");
        break;
    case d7:
        __asm__("move.l %d7, register_result");
        break;
    case a0: 
        __asm__("move.l %a0, register_result");
        break;
    case a1: 
        __asm__("move.l %a1, register_result");
        break;
    case a2: 
        __asm__("move.l %a2, register_result");
        break;
    case a3: 
        __asm__("move.l %a3, register_result");
        break;
    case a4: 
        __asm__("move.l %a4, register_result");
        break;
    case a5: 
        __asm__("move.l %a5, register_result");
        break;
    case a6: 
        __asm__("move.l %a6, register_result");
        break;
    case a7: 
        __asm__("move.l %a7, register_result");
        break;
    default:
        break;
    }

    binary_to_ascii_hex(register_result, output_buffer, 8);
    serial_print(&output_buffer[0]);
    clear_buffer(output_buffer, OUTPUT_BUFFER_SIZE);
}

int reg_write_value = 0;
void write_register(enum registers reg, int data){
    reg_write_value = data;
    switch (reg) {
    case d0:
        __asm__("move.l reg_write_value, %d0");
        break;
    case d1:
        __asm__("move.l reg_write_value, %d1");
        break;
    case d2: 
        __asm__("move.l reg_write_value, %d2");
        break;
    case d3:
        __asm__("move.l reg_write_value, %d3");
        break;
    case d4: 
        __asm__("move.l reg_write_value, %d4");
        break;
    case d5:
        __asm__("move.l reg_write_value, %d5");
        break;
    case d6: 
        __asm__("move.l reg_write_value, %d6");
        break;
    case d7:
        __asm__("move.l reg_write_value, %d7");
        break;
    case a0: 
        __asm__("move.l reg_write_value, %a0");
        break;
    case a1: 
        __asm__("move.l reg_write_value, %a1");
        break;
    case a2: 
        __asm__("move.l reg_write_value, %a2");
        break;
    case a3: 
        __asm__("move.l reg_write_value, %a3");
        break;
    case a4: 
        __asm__("move.l reg_write_value, %a4");
        break;
    case a5: 
        __asm__("move.l reg_write_value, %a5");
        break;
    case a6: 
        __asm__("move.l reg_write_value, %a6");
        break;
    case a7: 
        __asm__("move.l reg_write_value, %a7");
        break;
    default:
        break;
    }
}

void load_srecord() {
    // int i = 2;
    // for (i = 2; i < 80; i++) {
    //     srecord[i] = input_buffer[i];
    // }
    parse_srecord();    
}

void transfer_buffer() {
    int i = 0;
    for (i = 0; i < 100; i++) {
        command_buffer[i] = input_buffer[i];
    }    
}

void run_srec() {
    //char* ptr = &srecord[0];

}

void parse_srecord() {
    switch (type) {
    char type = srecord[1];
    int count = ascii_hex_to_bin(&srecord[2], 2);
    int address = 0;
    int i = 0;
    case '0':
    //skip line with S0 by incrementing counter
        address = ascii_hex_to_bin(&srecord[4], 4);
        break;
    case '1':
        address = ascii_hex_to_bin(&srecord[4], 4);

        for(i = 0; i < count; i++) {
            data[i] = ascii_hex_to_bin(&srecord[8], 2);
        }

        break;
    case '2':
        address = ascii_hex_to_bin(&srecord[4], 6);
        break;
    case '3':
        address = ascii_hex_to_bin(&srecord[4], 8);
        break;
    case '5':
        address = ascii_hex_to_bin(&srecord[4], 4);
        break;
    case '6':
        address = ascii_hex_to_bin(&srecord[4], 6);
        break;
    case '7':
        address = ascii_hex_to_bin(&srecord[4], 8);
        break;
    case '8':
        address = ascii_hex_to_bin(&srecord[4], 6);
        break;
    case '9':
        address = ascii_hex_to_bin(&srecord[4], 4);
        break;
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
        if (command_buffer[2] == 'd') {
            switch (command_buffer[3]) {
                case '0':
                    read_register(d0);
                    break;
                case '1':
                    read_register(d1);
                    break;
                case '2':
                    read_register(d2);
                    break;
                case '3':
                    read_register(d3);
                    break;
                case '4':
                    read_register(d4);
                    break;
                case '5':
                    read_register(d5);
                    break;
                case '6':
                    read_register(d6);
                    break;
                case '7':
                    read_register(d7);
                    break;
                default:
                    break;
            }
        }
        else if (command_buffer[2] == 'a') {
            switch (command_buffer[3]) {
                case '0':
                    read_register(a0);
                    break;
                case '1':
                    read_register(a1);
                    break;
                case '2':
                    read_register(a2);
                    break;
                case '3':
                    read_register(a3);
                    break;
                case '4':
                    read_register(a4);
                    break;
                case '5':
                    read_register(a5);
                    break;
                case '6':
                    read_register(a6);
                    break;
                case '7':
                    read_register(a7);
                    break;
                default:
                    break;
            }
        }
        break;
    case '5':
    //write to register
        value_1 = ascii_hex_to_bin(&command_buffer[5], 8);

        if (command_buffer[2] == 'd') {
            switch (command_buffer[3]) {
                case '0':
                    write_register(d0, value_1);
                    break;
                case '1':
                    write_register(d1, value_1);
                    break;
                case '2':
                    write_register(d2, value_1);
                    break;
                case '3':
                    write_register(d3, value_1);
                    break;
                case '4':
                    write_register(d4, value_1);
                    break;
                case '5':
                    write_register(d5, value_1);
                    break;
                case '6':
                    write_register(d6, value_1);
                    break;
                case '7':
                    write_register(d7, value_1);
                    break;
                default:
                    break;
            }
        }
        else if (command_buffer[2] == 'a') {
            switch (command_buffer[3]) {
                case '0':
                    write_register(a0, value_1);
                    break;
                case '1':
                    write_register(a1, value_1);
                    break;
                case '2':
                    write_register(a2, value_1);
                    break;
                case '3':
                    write_register(a3, value_1);
                    break;
                case '4':
                    write_register(a4, value_1);
                    break;
                case '5':
                    write_register(a5, value_1);
                    break;
                case '6':
                    write_register(a6, value_1);
                    break;
                case '7':
                    write_register(a7, value_1);
                    break;
                default:
                    break;
            }
        }
        break;
    case '6':
    //load srec
        load_srecord();
        break;
    case '7':
    //run srec
        run_srec();
        break;
    default:
        break;
    }
}