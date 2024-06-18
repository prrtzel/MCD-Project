#include "morg.h"
#include "morgio.h"
#include "conversions.h"

enum bool exit_code = false;

void get_input() {
    serial_print(">> ");
    get_string();
}

#pragma region memory

void read_memory(long address){
    char* address_pointer = (char*) address;
    char value = *address_pointer;
    binary_to_ascii_hex(value, output_buffer, HEX_BYTE_LENGTH);
    serial_print(&output_buffer[0]);
}

void mem_dump(long starting_address, long ending_address){
    int i = 0;
    int j = 1;
    for (i = starting_address; i <= ending_address; i++) {
        read_memory(starting_address + i);
        serial_print(" ");
        if (j == 16) {
            serial_print("\n\r");
            j = 0;
        }
        j++;
    }
    serial_print("\n\r");
}

void write_memory(long address, char data){
    char* address_pointer = (char*) address;
    *address_pointer = data;
}

#pragma endregion

#pragma region registers
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
    serial_print("\n\r");
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
#pragma endregion

void parse_cmd() {
    if (cmp_str("exit", &input_buffer[0], 4) == true)
        exit_code = true;

    else if (cmp_str("help", &input_buffer[0], 4) == true)
        serial_print("
 Morg Monitor System\n\r
 'help' -- gives a list of inputs\n\r
 '1'    -- read memory Ex: 1 00ff00ff\n\r
 '2'    -- dump memory Ex: 2 00000000 00001000\n\r
 '3'    -- write to memory Ex: 3 00ff0012 32\n\r
 '4'    -- read a register Ex: 4 d0\n\r
 '5'    -- write to a register Ex: 5 d4 0000ffff\n\r
 'exit' -- exit Morg Monitor System (you monster)\n\r");

    else {
        switch (input_buffer[0]) {
        long value_1;
        long value_2;
        case '1':
        //read memory
            value_1 = ascii_hex_to_bin(&input_buffer[2], 8);
            read_memory(value_1);
            serial_print("\n\r");
            break;
        case '2':
        //mem dump
            value_1 = ascii_hex_to_bin(&input_buffer[2], 8);
            value_2 = ascii_hex_to_bin(&input_buffer[11], 8);
            mem_dump(value_1, value_2);
            break;
        case '3':
        //write to memory
            value_1 = ascii_hex_to_bin(&input_buffer[2], 8);
            value_2 = ascii_hex_to_bin(&input_buffer[11], 2);
            write_memory(value_1, value_2);
            break;
        case '4':
        //read register
            if (input_buffer[2] == 'd') {
                switch (input_buffer[3]) {
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
            else if (input_buffer[2] == 'a') {
                switch (input_buffer[3]) {
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
            value_1 = ascii_hex_to_bin(&input_buffer[5], 8);

            if (input_buffer[2] == 'd') {
                switch (input_buffer[3]) {
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
            else if (input_buffer[2] == 'a') {
                switch (input_buffer[3]) {
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
            break;
        case '7':
        //run srec
            break;
        default:
            break;
        }
    }
    clear_buffer(output_buffer, OUTPUT_BUFFER_SIZE);
}