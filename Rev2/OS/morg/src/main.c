#include "morgio.c"
#include "strings.c"


int __main() {
    char c = get_char();
    serial_print(&c);
    return 0;
}