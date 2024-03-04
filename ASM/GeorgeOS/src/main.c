#include "stdio.h"

char hello[] = "hello\0";

extern int __main(){
    serial_print(&hello[0]);
    return 0;
}