#ifndef STDIO_H
#define STDIO_H

#define SIM
#define HARDWARE

/**
 * serial_print:
 * Prints a string to the serial monitor
 * set definitions to use simulator vs hardware
 * @param char* Pointer to string
*/
extern void serial_print(char* str_p);

#endif