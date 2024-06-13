#ifndef MORGIO_H
#define MORGIO_H

//-----------------------------------
// Get Char

/**
 * @brief Obtains a char from the serial monitor
 * @return char 
 */
extern char get_char();

/**
 * @brief Buffer needed for get_char(). 
    Assembly references need a non 
    local variable
 */
static char get_char_buffer;

//------------------------------------
// Serial Print

/**
 * @brief This prints a string to the serial monitor
 * @param str_ptr Constant pointer to first char in the string
 */
extern void serial_print(const char* str_ptr);

/**
 * @brief Buffer needed for serial_print(). 
    Assembly references need a non 
    local variable
 */
static char* str_ptr_buffer;
//------------------------------------
#endif