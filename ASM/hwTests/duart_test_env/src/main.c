#include "test.h"

char test_char = '7';
char hello[] = "hola";

int __main() {
    init_duart();
    put_char(test_char);
    return 0;
}