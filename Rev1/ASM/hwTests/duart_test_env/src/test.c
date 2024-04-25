#include "test.h"
char* MR1A;
char* MR2A;
char* SRA;
char* CSRA;
char* CRA;
char* THRA;    
char* RHRA;
char* ACR;   
char BAUD;
char is_valid;
char value;

extern void init() {
    MR1A  = (char*)0x00100001; //mode register
    MR2A  = (char*)0x00100001; //mode register
    SRA   = (char*)0x00100003; //status register
    CSRA  = (char*)0x00100003; //clock select register
    CRA   = (char*)0x00100005; //command register  
    THRA  = (char*)0x00100007; //Tx Holding Register
    RHRA  = (char*)0x00100007; //Rx holding register
    ACR   = (char*)0x00100009; //Aux control register
    BAUD   = 0xCC; //baud rate 19.2k
    is_valid = 0;
    value = 0;
    return;
}


char* serial_print_pointer = 0;
extern void serial_print(char* str_p) {
    serial_print_pointer = str_p;
    __asm__(" 
        move.l  serial_print_pointer, %a1
        move.b  #14, %d0   
        trap    #15
        ");
}

extern void init_duart() {
    // software reset
    *CRA = 0x30;    //reset TxA
    *CRA = 0x20;    //reset RxA
    *CRA = 0x10;    //reset MRA pointer

    //initialization
    *ACR = 0x80;    //select baud rate 2
    *CRA = 0x09;    //select extend bit X = 0 to select 19.2k baud rate
    *CSRA = BAUD;   //set 19.2k baud Rx/Tx
    *MR1A = 0x13;   //8-bits, no parity, 1 stop bit

    //07: normal mode, CTS and RTS disabled, stop bit length = 1
    //for testing load 0x47 to enable auto-echo
    *MR2A = 0x07;
    *CRA = 0x05;    //enable Tx and Rx
    return;
}

extern char get_char() {
    char value = 0;
    char is_valid = 0;

    //extract 0th bit from SRA register for RxRDY
    //4 => 0b00000001
    while(is_valid == 0x00) {
        //in poll
        is_valid = ((*SRA) & 1);
    }
    value = *RHRA;
    put_char(*RHRA); //echo
    return value;
}

// extern void put_char(char value) {
//     //extract 2nd bit from SRA register for TxRDY
//     //4 => 0b00000100
    
//     //check bit 2 in SRA
//     while(is_valid != 4) {
//         //out poll
//         is_valid = ((*SRA) & 4);
//     }
//     *THRA = value;
//     return;
// }



extern void put_char(char value) {
__asm__("
        move.b SRA,is_valid
        btst #2,is_valid    
        beq put_char
        move.b value, THRA
        rts
    ");
}






extern void test_loop() {
    int counter = 0;
    while(counter != 1000) {
        counter++;
    }
}