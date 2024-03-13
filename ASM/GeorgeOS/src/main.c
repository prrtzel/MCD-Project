#include "main.h"
#include "stdio.h"
#include "conversions.h"
#include "morg.h"

extern int __main() {
    mem_dump(0, 0x00001000);
    return 0;
}