#ifndef MORG_H
#define MORG_H

/**
 * @brief Exits morg if set to true
 */
extern enum bool exit_code;

/**
 * @brief Prints out the starting menu
 */
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

/**
 * @brief Prints out the value at the specified address
 * @param address 
 */
void read_memory(long address);

/**
 * @brief Prints out a range of memory values (wrapper for read_memory)
 * @param starting_address 
 * @param ending_address 
 */
void mem_dump(long starting_address, long ending_address);

/**
 * @brief Writes a value to a specified address
 * @param address 
 * @param data 
 */
void write_memory(long address, char data);

/**
 * @brief Prints out the contents of the specified register. Options: 
 * a0-a7, d0-d7
 * @param reg 
 */
void read_register(enum registers reg);

/**
 * @brief Writes a value to the specified register
 * @param reg 
 * @param data 
 */
void write_register(enum registers reg, int data);

/**
 * @brief parses an srec string and writes it to memory
 * @param srec pointer to srec string
 * @return address of srec start
 */
long load_srec(char* srec);

/**
 * @brief Writes the data section (string of hex chars) 
 * in an srec to the specified memory location
 * @param data 
 * @param length 
 * @param address 
 */
void write_srec_data(char* data, int length, char* address);

/**
 * @brief Runs the srecord at the specified address
 * @param address 
 */
void run_srec(long address);

/**
 * @brief Parses the user input
 */
extern void parse_cmd();

/**
 * @brief Fills the input buffer
 */
extern void get_input();

#endif