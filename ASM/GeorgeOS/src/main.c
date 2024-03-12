#include "main.h"
#include "stdio.h"

extern int __main() {
    getString();
    serial_print(&input_buffer[0]);
    return 0;
}