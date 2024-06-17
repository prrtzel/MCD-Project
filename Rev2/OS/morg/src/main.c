#include "morg.h"
#include "morgio.h"
#include "strings.h"
#include "conversions.h"


#define ARRAY_LENGTH(arr) ((sizeof(arr) / sizeof((arr)[0])))


int __main() {
    // while (exit_code == false) {
    //     get_input();
    //     parse_cmd();
    // }

    get_string();
    if (cmp_str(&input_buffer[0], "run") == true)
        serial_print("true");
    else
        serial_print("false");

    return 0;
}