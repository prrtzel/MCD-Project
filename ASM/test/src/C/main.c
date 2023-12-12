#include "headers/stdio.h"

int main(){

    char success[] = "success!";
    char fail[] = "fail";

    char * ptr = bin2ahex(0xfacb);

    char array[5];
    array[0] = *ptr;
    array[1] = *(ptr + 1);
    array[2] = *(ptr + 2);
    array[3] = *(ptr + 3);
    array[4] = '\0';
    sprint(array);

    return 9;
}

