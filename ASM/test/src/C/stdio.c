#include "headers/stdio.h"

#define EOT '\0' //type ctl + shift + 2 for EOT

char * sgetStr(void) {
    char character;
    char buffer[50];
    unsigned int i = 0;

    while(character != EOT) {
        character = sgetChar();
        buffer[i] = character;
        i++;
    }
    return buffer;
}