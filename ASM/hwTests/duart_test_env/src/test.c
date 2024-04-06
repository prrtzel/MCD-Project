#include "test.h"

char test_char = '7';

//duart register addresses
char* DUART = (char*)0x00200000; 

char* MR1A  = (char*)0x00200000; //mode register
char* MR2A  = (char*)0x00200000; //mode register
char* SRA   = (char*)0x00200001; //status register
char* CSRA  = (char*)0x00200001; //clock select register
char* CRA   = (char*)0x00200002; //command register  
char* THRA  = (char*)0x00200003; //Tx Holding Register
char* RHRA  = (char*)0x00200003; //Rx holding register
char* ACR   = (char*)0x00200004; //Aux control register
char BAUD   = 0xCC; //baud rate 19.2k

extern void init_duart() {
    // software reset
    *CRA = 0x30;    //reset TxA
    *CRA = 0x20;    //reset RxA
    *CRA = 0x10;    //reset MRA pointer

    //initialization
    *ACR = 0x80;    //select baud rate 2
    *CSRA = BAUD;   //set 19.2k baud Rx/Tx
    *MR1A = 0x13;   //8-bits, no parity, 1 stop bit

    //07: normal mode, CTS and RTS disabled, stop bit length = 1
    //for testing load 0x47 to enable auto-echo
    *MR2A = 0x47;
    *CRA = 0x05;    //enable Tx and Rx
    return;
}

extern char get_char() {
    char value = 0;
    //check bit 0 in SRA
    while(*SRA == 0x00) {
        //in poll
    }
    value = *RHRA;
    put_char(*RHRA); //echo
    return value;
}

extern void put_char(char value) {
    //extract 2nd bit from SRA register
    //4 => 0b00000100
    char is_valid = ((*SRA) & 4) >> 2;

    //check bit 2 in SRA
    while(is_valid == 0x00) {
        //out poll
    }
    *THRA = value;
    return;
}


