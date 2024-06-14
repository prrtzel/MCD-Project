#include "morgio.h"
#include "strings.h"

const char tr[] = "true";
const char fl[] = "false";
const char str[] = "fale";

int __main() {
    enum bool result;
    result = cmp_str(&str[0], &fl[0], 5);
    if (result == TRUE)
        serial_print(&tr[0]);
    else
        serial_print(&fl[0]);
    return 0;
}