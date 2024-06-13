#include "morgio.c"
#include "strings.c"
/*
.rodata
const char str[] = "holy moly batman!!";

.bss
static int var;

.data
int var = definition;
*/


int __main() {
    serial_print(&str[0]);
    serial_print(&str2[0]);
    return 0;
}