#include "main.h"
#include "stdio.h"

extern int __main() {

    char exit_prog = 0;

    while(exit_prog == 0) {
        getString();
        exit_prog = 1;
    }
    return 0;
}