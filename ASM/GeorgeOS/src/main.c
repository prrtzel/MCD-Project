#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

extern int __main() {
    init();
    while (exit_status == 0) {
        get_input();
        parse_cmd(input_buffer, INPUT_BUFFER_SIZE);
    }
    return 0;
}