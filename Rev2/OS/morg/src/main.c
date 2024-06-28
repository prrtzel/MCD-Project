#include "morg.h"
#include "morgio.h"


#include "conversions.h"

int __main() {
    print_menu();
    while (exit_code == false) {
        get_input();
        parse_cmd();
    }
    return 0;
}