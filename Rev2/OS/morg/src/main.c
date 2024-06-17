#include "morg.h"
#include "morgio.h"
#include "strings.h"
#include "conversions.h"

//#define MAIN
#define TEST

int __main() {

    if (cmp_str("hello", "hell0") == true)
        serial_print("true");
    else
        serial_print("false");

#if MAIN
    while (exit_code == false) {
        get_input();
    }
#endif

    return 0;
}