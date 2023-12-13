#define EOT '\0' //type ctl + shift + 2 for EOT
#define ENTER 10


//Serial Print Functions for Simulator

//prints pointer to string array
extern void sprint(char* string);

//returns a character
extern char sgetChar(void);

//returns a pointer to a string
extern char* sgetStr(void);

//prints 2 ascii bytes from bin2ahex conversion
//pointer may need to be reset for multiple occurences of this function
void sprintWord(char * array); 

//--------------------------------------------------------------
// Conversions

//Converts Ascii Decimal to Hex Ex: '4' -> 0x04
char adec2bin(char asciiChar);

//Converts Ascii Hex to Hex Ex: 'F' -> 0x0F
char ahex2bin(char asciiChar);

//Converts binary value to Ascii Hex Ex: 0xFFFF -> 0x46464646
// \returns pointer to ascii word 
char * bin2ahex(int binaryValue);
