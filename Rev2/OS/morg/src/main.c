#include "morgio.c"

/*
Where to put crap

.rodata
const char str[] = "holy moly batman!!";

.bss
static int var;

.data
int var = definition;

*/

int var = 0x430;

extern int __main(void);

int __main() {
    
    return 0;
}