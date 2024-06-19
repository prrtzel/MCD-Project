#include "morg.h"
#include "morgio.h"

    char srec[] = "S00B00006D6F72672E53363850
S31A0011000068656C6C6F004E5600004879001100004EB900110032
S3120011001524588F7000600000024E5E4E757B
S307001100220000C5
S319001100244E56000023EE000800110038600000024E5E4E75DA
S70500110006E3
";

#define TEST
//#define MAIN

int __main() {
#ifdef MAIN
    print_menu();
    while (exit_code == false) {
        get_input();
        parse_cmd();
    }
#endif
#ifdef TEST


    load_srec(&srec[0]);

#endif
    return 0;
}