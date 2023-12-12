#define EOT '\0' //type ctl + shift + 2 for EOT



//Serial Print Functions for Simulator
extern void sprintTest(void);
extern void sprint(char* string); //add support for multiple lines

extern char sgetChar(void);

/*
until the EOT char is recieved
a character is put into a string buffer
the buffer index is incremented and it repeats
*/
extern char* sgetStr(void);

//--------------------------------------------------------------
// Conversions

//Converts Ascii Decimal to Hex Ex: '4' -> 0x04
char adec2bin(char asciiChar);

//Converts Ascii Hex to Hex Ex: 'F' -> 0x0F
char ahex2bin(char asciiChar);

//Converts binary value to Ascii Hex Ex: 0xFFFF -> 0x46464646
// \returns pointer to ascii word 
char * bin2ahex(int binaryValue);
