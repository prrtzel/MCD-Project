#include "main.h"
#include "stdio.h"
#include "conversions.h"

extern int __main() {
    serial_print_error(&hello[0]);
    serial_print(&menu[0]);
    return 0;
}