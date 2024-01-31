#include "headers/main.h"
#include "headers/stdio.h"
#include "headers/morg.h"

//#define TEST
//#define MAIN
#define ASSTEST



char value = 0;

int main(){
// Morg the Monitor

#ifndef ASSTEST
//-----------------------------------------------------------------------------
// Strings
    char menu[] = "Morg Menu\n\n\rSelect a Number and Press Enter\n\n\r"
    "1. Read from Memory\n\r"
    "2. Write to Memory\n\r"
    "3. Read from a Register\n\r"
    "4. Write to a Register\n\r"
    "5. Load an S-Record\n\r"
    "6. Run an S-Record\n\r"
    "7. Kill Morg"
    "\n\r\0";

    char rdmem[] = "Select Address to Read From\n\r";
    char wrmem[] = "Select Memory Location to Write to\n\r";
    char rdreg[] = "Read from a Register Selected\n\r";
    char wrreg[] = "Write to a Register Selected\n\r";
    char ldsrec[] = "Load an S-Record Selected\n\r";
    char runsrec[] = "Run an S-Record Selected\n\r";
    char error[] = "error\n\r";

    char exitProgramString[] = "\n\rMorg has been Terminated\n\rYou are a monster!!!";

    char newline[] = "\n\r";
    char writeValue[] = "Enter a Hex Byte\n\r";
    char linuxThing[] = ">>";

    char invalidOption[] = "Invalid Option. Morg thinks you cant read\n\r";
//-----------------------------------------------------------------------------
#endif
#ifdef MAIN
    sprint(menu);

//-----------------------------------------------------------------------------
// Main Loop
    char* address = 0;
    char* value = 0;
    char MorgAlive = 1; //if 0 Morg is dead :(

    while (MorgAlive != 0) {
        sprint(linuxThing);

        char choice = sgetChar();
        choice = adec2bin(choice);
        sprint(newline);


        switch (choice)
        {
        case 1:
            sprint(rdmem);
            address = sgetStr();
            readMemory(address);
            break;
        case 2:
            sprint(wrmem);
            morgWriteMemory();
            break;
        case 3:
            sprint(rdreg);

            

            break;
        case 4:
            sprint(wrreg);
            break;
        case 5:
            sprint(ldsrec);
            break;
        case 6:
            sprint(runsrec);
            break;
        case 7:
            MorgAlive = 0; // YOU MONSTER!!
            break;
        default:
            sprint(invalidOption);
            break;
        }      
    }
#endif
#ifdef TEST
    char testMode[] = "Test Mode Console\n\r";
    sprint(testMode);
//----------------------


//----------------------
#endif

#ifdef ASSTEST 

    char* str[] = "reset";
    sprint(str);

#endif

#ifndef ASSTEST
    sprint(exitProgramString);
#endif
    return 9;
}