*-----------------------------------------------------------
* Title      : ASCII hex to binary
* Written by : George Yacoubian
* Date       : 11/20/23
* Description: converts ASCII hex to binary 
*-----------------------------------------------------------
* MACROS


OUTSTR   MACRO
            MOVE.L  #14,D0
            LEA     \1,A1
            TRAP    #15
            ENDM       

*-------------------------------------------------------------

    ORG    $1000
 
START:                  ; first instruction of program

SIM	EQU	1		;0 = hardware state, 1 = simulation state

	IF.B	SIM <NE> #00 THEN.L ;when simulating, turn off keyboard echo
	MOVE.B	#$00,D1
	MOVE.B	#12,D0
	TRAP	#15
	ENDI
	
*-------------------------------------------------------------
* MAIN
     
     
     MOVE.W #$ABCD, D0
     JSR HEX2ASCII
     

    SIMHALT                 ; halt simulator
    
*------------------------------------------------------------- 
* VARIABLES
   
    
ERRTEXT     DC.B 'ERROR',$D,$A,0
SUCCESSTXT  DC.B 'SUCCESS',$D,$A,0    

*-------------------------------------------------------------

* SUBROUTINES

*-------------------------------------------------------------
* TEST SUBROUTINE
    ;MOVE.B #$2F, D0
    
    



*-------------------------------------------------------------
* HEX 2 STRING
* MOVES IN CHAR FROM D0
* MASKS AND SHIFTS IT, THEN DEPENDING ON CHAR
* CONVERTS IT TO ASCII CODE IN HEX
* THEN MOVES IT INTO D3 AND SHIFTS

HEX2ASCII
    MOVE.L  D0, -(SP)
    MOVE.L  D2, -(SP)
    MOVE.L  D3, -(SP)
    

    MOVE.W  D0, D1      ; MOVE INTO BUFFER
    AND     #$F000, D1  ; MASK DESIRED CHAR
    MOVE.B  #$0C, D3    ; SHIFT TO LSB 
    LSR     D3, D1      ;
    JSR     CONVERT     ; CONVERT STRING TO ASCII HEX & STORE IN D2
    MOVE.B  #$08, D3    ; SHIFT D2
    LSL.L   D3, D2      ;
    
    MOVE.W  D0, D1
    AND     #$0F00, D1
    LSR     #8, D1
    JSR     CONVERT
    MOVE.B  #$08, D3
    LSL.L   D3, D2
    
    MOVE.W  D0, D1
    AND     #$00F0, D1
    LSR     #4, D1
    JSR     CONVERT
    MOVE.B  #$08, D3
    LSL.L   D3, D2
    
    MOVE.W  D0, D1
    AND     #$000F, D1
    JSR     CONVERT
    
    MOVE.L D2, D1
    
    MOVE.L  (SP)+, D3
    MOVE.L  (SP)+, D2
    MOVE.L  (SP)+, D0
    
    RTS
    
CONVERT
    IF.B D1 <GE> #$01 AND.L D1 <LE> #$09 THEN.L
        OR  #$30, D1
    ENDI
  
    IF.B D1 <GE> #$0A AND.L D1 <LE> #$0F THEN.L
        SUB #$09, D1 ; CONVERT LETTER TO DIGIT BY SUBTRACTING 9
        OR  #$40, D1 
    ENDI
    
    MOVE.B D1, D2
    
    RTS

*-------------------------------------------------------------
* CONVERT ASCII DECIMAL DIGIT TO HEX VALUE 
* TAKES VALUE FROM D0 AND PUTS IT IN
* HEX FORM IN D1
* EX: '9' --> 9(16)

ASCIIDEC2BIN

    MOVE.L  D0, -(SP)
    MOVE.B  D0, D1  
    IF.B D0 <GE> #$30 AND.L D0 <LE> #$39 THEN.L
        AND #$0F, D1    ;MASK THE LSB TO EXTRACT THE DIGIT         
    ENDI
    MOVE.L  (SP)+, D0  
    RTS
    
*-------------------------------------------------------------
* CONVERT ASCII HEX DIGIT TO HEX VALUE 
* TAKES VALUE FROM D0 AND PUTS IT IN
* HEX FORM IN D1
* EX: 'A' --> A(16)

ASCIIHEX2BIN

    MOVE.L  D0, -(SP)
    MOVE.B  D0, D1   
    IF.B D0 <GT> #$39 THEN.L
        SUBI #$7, D1        ;SUBTRACTING 7 TO CONCANTENATE ALL
                            ;ASCII VALUES FROM 30-3F
    ENDI    
    AND #$0F, D1    ;MASK THE LSB TO EXTRACT THE DIGIT  
    MOVE.L  (SP)+, D0
    RTS

*-------------------------------------------------------------
* GCHAR gets an input character and stores is in D0

GCHAR	IF.B	SIM <EQ> #00 THEN.L
	    
	*INSERT YOUR HARDWARE GETCHAR CODE

	ELSE
	
	MOVE.L	D1, -(SP)	;
	MOVE.L	#05, D0		;
	TRAP	#15		    ;
	MOVE.B	D1, D0		;
	MOVE.L	(SP)+, D1	;
	
	ENDI

*-------------------------------------------------------------

* PCHAR outputs the character on D0	
PCHAR	IF.B	SIM <EQ> #00 THEN.L
	
	*INSERT YOUR HARDWARE PUTCHAR CODE
	
	ELSE
	
	MOVE.L	D0, -(SP)	; Task
	MOVE.L	D1, -(SP)	; Char to display
	MOVE.B	D0, D1		;
	MOVE.L	#06, D0		;
	TRAP	#15		;
	MOVE.L	(SP)+, D1	;
	MOVE.L	(SP)+, D0	;
	
	ENDI
	
	RTS


    END    START        ; last line of source



*~Font name~Courier New~
*~Font size~16~
*~Tab type~1~
*~Tab size~4~
