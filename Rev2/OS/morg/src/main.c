#include "morg.h"
#include "morgio.h"
#include "strings.h"
#include "conversions.h"

int __main() {
    while (exit_code == false) {
        get_input();
        parse_cmd();
    }
    return 0;
}