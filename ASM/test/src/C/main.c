#include "headers/stdio.h"
#include "headers/morg.h"

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
    "\0";

    char rdmem[] = "Read Memory Selected\n\r";

    char exitProgramString[] = "\n\rMorg has been Terminated\n\rYou are a monster!!!";

    char newline[] = "\n\r";

    char invalidOption[] = "Invalid Option. Morg thinks you cant read\n\r";
//-----------------------------------------------------------------------------

    sprint(menu);

//-----------------------------------------------------------------------------
// Main Loop

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
                break;
            
            default:
                sprint(invalidOption);
                break;
            }
        }
    }
    sprint(exitProgramString);
    return 9;
}

