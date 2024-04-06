#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

#define MAIN
//#define TEST

extern int __main() {
#ifdef MAIN
    init();
    while (exit_status == 0) {
        get_input();
        parse_cmd();
    }

#endif
#ifdef TEST
#endif
    return 0;
}

