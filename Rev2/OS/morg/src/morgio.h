#ifndef MORGIO_H
#define MORGIO_H

#define BACKSPACE 0x08
#define INPUT_BUFFER_SIZE 1000
#define OUTPUT_BUFFER_SIZE 100

char input_buffer[INPUT_BUFFER_SIZE];
char output_buffer[OUTPUT_BUFFER_SIZE];

/*
 "we have a bool at home"
*/
enum bool {
    true = 1,
    false = 0
};

/**
 * @brief Obtains a char from the serial monitor
 * @return char 
 */
extern char get_char();

/**
 * @brief This prints a string to the serial monitor
 * @param str_ptr Constant pointer to first char in the string
 */
extern void serial_print(const char* str_ptr);

/**
 * @brief Obtains a string from the serial monitor and places it into 
 * the input_buffer variable
 * 
 */
extern void get_string();

/**
 * @brief clears a given array/buffer to 0
 * 
 * @param buffer pointer to buffer thy wish to clear
 * @param size size of thy buffer (it does matter in this case)
 */
extern void clear_buffer(char* buffer, int size);

/**
 * @brief compares 2 strings
 * 
 * @param str1 
 * @param str2 
 * @return enum Bool false if they are not equal, true otherwise
 */
extern enum bool cmp_str(const char* str1, const char* str2, int length);

#endif