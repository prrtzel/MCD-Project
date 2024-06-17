#include "morg.h"
#include "morgio.h"

enum bool exit_code = false;

char key[NUM_OF_COMMANDS][5] = {"help\0", "exit\0", "rm\0", "wm\0", "rr\0", "wr\0", "ld\0", "run\0"};

void get_input() {
    serial_print(">> ");
    get_string();
}

void parse_cmd() {
    // if (cmp_str("exit", &input_buffer[0], 4) == true)
    //     exit_code = true;
    // if (cmp_str("help", &input_buffer[0], 4) == true)
    //     serial_print("
    //     Morg Monitor System\n\r
    //     'help' -- gives a list of commands\n\r
    //     '1'    -- read memory Ex: 1 00ff00ff\n\r
    //     '2'    -- dump memory Ex: 2 00000000 00001000\n\r
    //     '3'    -- write to memory Ex: 3 00ff0012 32\n\r
    //     '4'    -- read a register Ex: 4 d0\n\r
    //     '5'    -- write to a register Ex: 5 d4 0000ffff\n\r
    //     'exit' -- exit Morg Monitor System (you monster)\n\r
    //     ");
    
    int i = 0;
    for (i = 0; i < NUM_OF_COMMANDS; i++) {
        if (cmp_str(&input_buffer[0], &key[i][0]) == true) {
            serial_print("true\n\r");
        }
        else {
            serial_print("false\n\r");
            serial_print("input: ");
            serial_print(&input_buffer[0]);
            serial_print("\n\rkey: ");
            serial_print(&key[i][0]);
            serial_print("\n\r");
        }
    }   
}