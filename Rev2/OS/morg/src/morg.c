#include "main.h"
#include "morg.h"
#include "morgio.h"
#include "conversions.h"

#define ADDRESS_16 4
#define ADDRESS_24 6
#define ADDRESS_32 8
#define CHECKSUM_SIZE_COUNTER 2
#define DATA_SIZE_COUNTER_16(X) (X - 3) * 2
#define DATA_SIZE_COUNTER_32(X) (X - 5) * 2

enum bool exit_code = false;

void print_menu() {
    serial_print("Morg Monitor System\r
Distribute at your own risk!\r
ver 3.0\r
Type 'help' for a list of commands\r\n");
}

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
unsigned long register_result = 0;
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

unsigned long reg_write_value = 0;
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

#pragma region srecord

//#define PREDEFINED_SREC
//#define DBUG

long load_srec(char* srec) {
    enum bool has_next_srec = true;
    int  counter         = 0;
    char srec_type      = 0;
    char byte_count     = 0;
    int  data_counter_size = 0;
    long address        = 0;
    long start_address  = 0;

    while (has_next_srec == true) {
        //skipping the S
        counter++;

        // read srec type
        srec_type = ascii_hex_to_bin(&srec[counter], 1);
        counter++;

#ifdef DBUG
        serial_print("srec type: ");
        binary_to_ascii_hex(srec_type, &output_buffer[0], 2);
        serial_print(&output_buffer[0]);
        clear_buffer(&output_buffer[0], OUTPUT_BUFFER_SIZE);
        serial_print("\n\r");
#endif

        // read srec byte count 
        byte_count = ascii_hex_to_bin(&srec[counter], 2);
        counter = counter + 2;

#ifdef DBUG
        serial_print("byte count: ");
        binary_to_ascii_hex(byte_count, &output_buffer[0], 2);
        serial_print(&output_buffer[0]);
        clear_buffer(&output_buffer[0], OUTPUT_BUFFER_SIZE);
        serial_print("\n\r");
#endif

        // get address based on type
        switch (srec_type)
        {
        // Header
        case 0:
#ifdef DBUG
            serial_print("0\n\r");
#endif
            data_counter_size = DATA_SIZE_COUNTER_16(byte_count);
            counter = counter + ADDRESS_16 + data_counter_size + CHECKSUM_SIZE_COUNTER;
            break;

        // 16-Bit Data
        case 1:
#ifdef DBUG
            serial_print("1\n\r");
#endif
            data_counter_size = DATA_SIZE_COUNTER_16(byte_count);
            address = ascii_hex_to_bin(&srec[counter], ADDRESS_16);
            counter = counter + ADDRESS_16;
            write_srec_data(&srec[counter], data_counter_size, (char*) address);
            counter = counter + data_counter_size + CHECKSUM_SIZE_COUNTER;
            break;

        // 32-Bit Data
        case 3:
#ifdef DBUG
            serial_print("3\n\r");
#endif
            data_counter_size = DATA_SIZE_COUNTER_32(byte_count);
            address = ascii_hex_to_bin(&srec[counter], ADDRESS_32);
            counter = counter + ADDRESS_32;
            write_srec_data(&srec[counter], data_counter_size, (char*)address);
            counter = counter + data_counter_size + CHECKSUM_SIZE_COUNTER;
            break;

        // 32-bit Termination
        case 7:
            start_address = ascii_hex_to_bin(&srec[counter], ADDRESS_32);
            serial_print("SREC Parsed Successfully.\n\r");
            has_next_srec = false;
            break;

        // 16-bit Termination
        case 9:
            start_address = ascii_hex_to_bin(&srec[counter], ADDRESS_16);
            has_next_srec = false;
            break;
            
        default:
            serial_print("Error: Invalid SREC type!\n\r");
            has_next_srec = false;
            break;
        }
        // Increments through the eol, may need to change for putty
#ifdef PREDEFINED_SREC
        counter++;
#endif
    }
    return start_address;
}

void write_srec_data(char* data, int length, char* address) {
    int i = 0;
    for (i = 0; i < length; i = i + 2) {
        *address = (char) ascii_hex_to_bin(&data[i], 2);
        address = address + 1;
    }
}

void run_srec(long address) {
    ((void (*)(void))address)();
    return;
}

#pragma endregion

void parse_cmd() {
    long value_1;
    long value_2;

    if (cmp_str("exit", &input_buffer[0], 4) == true)
        exit_code = true;

    else if (cmp_str("help", &input_buffer[0], 4) == true)
        serial_print("
 Morg Monitor System\r
 'help'   -- gives a list of inputs\r
 'rm'     -- read memory Ex: rm 00ff00ff\r
 'dmp'    -- dump memory Ex: dmp 00000000 00001000\r
 'wm'     -- write to memory Ex: wm 00ff0012 32\r
 'rr'     -- read a register Ex: rr d0\r
 'wr'     -- write to a register Ex: wr d4 0000ffff\r
 'ld'     -- load an srecord\r
 'run'    -- run the srecord\r
 'exit'   -- exit Morg Monitor System (you monster)\r\n");

    //read memory
    else if (cmp_str("rm", &input_buffer[0], 2) == true) {
        value_1 = ascii_hex_to_bin(&input_buffer[3], 8);
        read_memory(value_1);
        serial_print("\n\r");
    }
    //mem dump
    else if (cmp_str("dmp", &input_buffer[0], 3) == true){
        value_1 = ascii_hex_to_bin(&input_buffer[4], 8);
        value_2 = ascii_hex_to_bin(&input_buffer[13], 8);
        mem_dump(value_1, value_2);
    }
    //write to memory
    else if (cmp_str("wm", &input_buffer[0], 2) == true){
        value_1 = ascii_hex_to_bin(&input_buffer[3], 8);
        value_2 = ascii_hex_to_bin(&input_buffer[12], 2);
        write_memory(value_1, value_2);
    }
    //read register
    else if (cmp_str("rr", &input_buffer[0], 2) == true){
        if (input_buffer[3] == 'd') {
            switch (input_buffer[4]) {
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
        else if (input_buffer[3] == 'a') {
            switch (input_buffer[4]) {
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
    }
    //write to register
    else if (cmp_str("wr", &input_buffer[0], 2) == true){
        value_1 = ascii_hex_to_bin(&input_buffer[6], 8);
        if (input_buffer[3] == 'd') {
            switch (input_buffer[4]) {
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
        else if (input_buffer[3] == 'a') {
            switch (input_buffer[4]) {
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
    }
    //load srec
    else if (cmp_str("ld", &input_buffer[0], 2) == true){  
        serial_print("Enter the S-Record\n\r");
        get_string();

        /*
        Note: morg ABSOLUTELY HATES srec_address.
        Because morg literally threw a tantrum when srec_address 
        was put in the same file/header file, srec_address was
        relocated to main.h. 
        */
        srec_address = load_srec(&input_buffer[0]);
    }
    //run srec
    else if (cmp_str("run", &input_buffer[0], 3) == true){
        run_srec(srec_address);
        serial_print("\n\r");
    }

    clear_buffer(output_buffer, OUTPUT_BUFFER_SIZE);
}