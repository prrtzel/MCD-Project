#include "morg.h"
#include "morgio.h"

int __main() {
    print_menu();
    while (exit_code == false) {
        get_input();
        parse_cmd();
    }
    return 0;
}