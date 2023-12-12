#include "headers/stdio.h"

int main(){

    char success[] = "success!";
    char fail[] = "fail";

    char character = aHex2Bin('f');

    if (character == 0x0F){
        sprint(success);
    }

    sprint(&character);
    return 9;
}

