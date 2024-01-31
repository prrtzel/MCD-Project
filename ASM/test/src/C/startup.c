#include "headers/startup.h"
#include "headers/main.h"
#include "headers/stdio.h"


#define SRAM_START  0x00080000U
#define SRAM_SIZE   (500 * 1024)
#define SRAM_END    ((SRAM_START) + (SRAM_SIZE)) 
#define STACK_START SRAM_END


void Default_handler(void);
void Reset_handler(void);


//define vector table
__section(code) long int vectors[]
{
    STACK_START,
    &Reset_handler
};


void Default_handler(void)
{
    while(1);
}
