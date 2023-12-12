#define EOT '\0' //type ctl + shift + 2 for EOT

//Serial Print Functions for Simulator
extern void sprintTest(void);
extern void sprint(char* string); //add support for multiple lines

extern char sgetChar(void);
extern char* sgetStr(void);

//conversions
char aHex2Bin(char asciiChar);
