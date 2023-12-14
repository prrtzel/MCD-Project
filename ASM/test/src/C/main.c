#include "headers/stdio.h"
#include "headers/morg.h"

//#define TEST
#define MAIN

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
#ifdef MAIN
    sprint(menu);

//-----------------------------------------------------------------------------
// Main Loop
    char* address = 0;
    char* value = 0;
    char MorgAlive = 1; //if 0 Morg is dead :(
    char writeToByteValue = 0;

    while (MorgAlive != 0) {
        sprint(linuxThing);
        //get number and go to new line
        char choice = sgetChar();
        choice = adec2bin(choice);
        sprint(newline);

        if (choice == 7){ //put this in the switch u dummy
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
    char* address;
    char* data;
    char* addressPtr;
    char dataBuffer;
    
    address = sgetStr();
    addressPtr = getAddress(address);

    data = sgetStr();
    dataBuffer = parseValue(data); 

    char* value = addressPtr; //parse string into address
    *value = dataBuffer;  //dereference address and write to location

//----------------------
#endif
    sprint(exitProgramString);
    return 9;
}