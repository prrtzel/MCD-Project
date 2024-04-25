DUART   EQU	    $00100000  loaded in A0 when needed, regs are offsets 
MR1A   	EQU   	1	Mode Register1 
MR2A  	EQU   	1	points here after MR1A is set 
SRA    	EQU   	3   Status Register (read) 
CSRA   	EQU   	3   Clock Select Register 
CRA   	EQU   	5	Command Register 
TBA		EQU   	7   Transfer Holding Register 
RBA		EQU   	7	Receive Holding Register 
ACR		EQU	  	9	Auxiliary control register 
RxRDY	EQU		0	Recieve ready bit position 
TxRDY	EQU		2	Transmit ready bit position 
BAUD	EQU	  	$CC baud rate value = 19,200 baud 


MR1B    EQU     17
MR2B    EQU     17
SRB     EQU     19
CSRB    EQU     19
CRB     EQU     21
TBB     EQU     23
RBB     EQU     23



SUPER_STACK EQU $8FFF0


    ORG $00000000
    DC.L SUPER_STACK
    DC.L START
    
    ORG $200
START:
    JSR INIT_DUART
    JMP START    




INIT_DUART:  
    LEA	  	DUART,A0		A0 points to base DUART address 

; Software reset: 
    MOVE.B	#$30,CRB(A0)	Reset TxB
    MOVE.B	#$20,CRB(A0)	Reset RxB 
    MOVE.B	#$10,CRB(A0)	Reset MRB pointer 

; Initialization: 
    MOVE.B  	#$80,ACR(A0)	    selects baud rate set 2 
    MOVE.B  	#BAUD,CSRB(A0)  	set 19.2k baud Rx/Tx 
    MOVE.B  	#$13,MR1B(A0)   	8-bits, no parity, 1 stop bit 

 
; This is the most important register to set in the 68681 DUART. 
; 07 sets: Normal mode, CTS and RTS disabled, stop bit length = 1 
; For testing load $#47 to enable auto-echo 

    MOVE.B	#$47,MR2B(A0)	 
    MOVE.B	#$05,CRB(A0)	enable Tx and Rx 
    RTS     

GET_CHAR:
IN_POLL:
    MOVE.B  SRB(A0),D1 
    BTST    #0,D1 
    BEQ     IN_POLL 
    MOVE.B  RBB(A0),D0 
    JSR     PUT_CHAR
    RTS 


PUT_CHAR:
OUT_POLL:
    MOVE.B  SRB(A0),D1
    BTST    #2,D1
    BEQ     OUT_POLL 
    MOVE.B  D0,TBB(A0)
    RTS

    
    END START



*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
