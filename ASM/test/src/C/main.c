#include "headers/stdio.h"
#include "headers/morg.h"

#define TEST
//#define MAIN

int main(){
// Morg the Monitor


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

    char rdmem[] = "Read Memory Selected\n\n\rSelect Address to Read From\n\r";
    char wrmem[] = "Write to Memory Selected\n\r";
    char rdreg[] = "Read from a Register Selected\n\r";
    char wrreg[] = "Write to a Register Selected\n\r";
    char ldsrec[] = "Load an S-Record Selected\n\r";
    char runsrec[] = "Run an S-Record Selected\n\r";

    char exitProgramString[] = "\n\rMorg has been Terminated\n\rYou are a monster!!!";

    char newline[] = "\n\r";

    char invalidOption[] = "Invalid Option. Morg thinks you cant read\n\r";
//-----------------------------------------------------------------------------
#ifdef MAIN
    sprint(menu);

//-----------------------------------------------------------------------------
// Main Loop
    char* address = 0;
    char MorgAlive = 1; //if 0 Morg is dead :(

    while (MorgAlive != 0) {
        
        //get number and go to new line
        char choice = sgetChar();
        choice = adec2bin(choice);
        sprint(newline);

        if (choice == 7){
            MorgAlive = 0; // YOU MONSTER!!
        }
        else {
            //main switch case statement parser
            switch (choice)
            {
            case 1:
                sprint(rdmem);
                address = sgetStr();
                readMemory(address);
                break;
            case 2:
                sprint(wrmem);
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
            default:
                sprint(invalidOption);
                break;
            }
        }
    }
#endif
#ifdef TEST
    char testMode[] = "Test Mode Console\n\r";
    sprint(testMode);
//----------------------

    char address[] = "abcd";
    readMemory(address);

//----------------------
#endif
    sprint(exitProgramString);
    return 9;
}