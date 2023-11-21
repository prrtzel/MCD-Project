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
     
     
     MOVE.W #$6969, D0
     JSR HEX2ASCII
     

    SIMHALT                 ; halt simulator
    
*------------------------------------------------------------- 
* VARIABLES
   
    
ERRTEXT     DC.B 'ERROR',$D,$A,0
SUCCESSTXT  DC.B 'SUCCESS',$D,$A,0    

*-------------------------------------------------------------

* SUBROUTINES

*-------------------------------------------------------------
* HEX 2 STRING
* MOVES IN CHAR FROM D0
* MASKS AND SHIFTS IT, THEN DEPENDING ON CHAR
* CONVERTS IT TO ASCII CODE IN HEX
* THEN MOVES IT INTO D3 AND SHIFTS

HEX2ASCII

    MOVE.W  D0, D2
    AND     #$F000, D2
    LSR     #8, D2
    LSR     #4, D2
    JSR     CONVERT
    MOVE.B  #$08, D4
    LSL.L     D4, D3
    
    MOVE.W  D0, D2
    AND     #$0F00, D2
    LSR     #8, D2
    JSR     CONVERT
    MOVE.B  #$08, D4
    LSL.L     D4, D3
    
    MOVE.W  D0, D2
    AND     #$00F0, D2
    LSR     #4, D2
    JSR     CONVERT
    MOVE.B  #$08, D4
    LSL.L     D4, D3
    
    MOVE.W  D0, D2
    AND     #$000F, D2
    JSR     CONVERT
    
    RTS
    
CONVERT
    IF.B D2 <GE> #$01 AND.L D2 <LE> #$09 THEN.L
        OR #$30, D2
    ENDI
    
    IF.B D2 <GE> #$0A AND.L D2 <LE> #$0F THEN.L
        SUB #$09, D2 ; CONVERT LETTER TO DIGIT BY SUBTRACTING 9
        OR #$40, D2
    ENDI
    
    MOVE.B D2, D3
    RTS

*-------------------------------------------------------------
* CONVERT ASCII DECIMAL DIGIT TO HEX VALUE 
* TAKES VALUE FROM D0 AND PUTS IT IN
* HEX FORM IN D2
* EX: '9' --> 9(16)

ASCIIDEC2BIN

    MOVE.B  D0, D2
     
    IF.B D0 <GE> #$30 AND.L D0 <LE> #$39 THEN.L
        JMP EXTRACTDIGIT
        RTS
        
    ELSE
        IF.B	SIM <NE> #00 THEN.L
            OUTSTR  ERRTEXT
        ENDI
        
        MOVE.B  #$00, D0    ;INDICATE ERROR
        
    ENDI
    
*-------------------------------------------------------------
* CONVERT ASCII HEX DIGIT TO HEX VALUE 
* TAKES VALUE FROM D0 AND PUTS IT IN
* HEX FORM IN D2
* EX: 'A' --> A(16)

ASCIIHEX2BIN

    MOVE.B  D0, D2
    
    IF.B D0 <GT> #$39 THEN.L
        SUBI #$7, D2        ;SUBTRACTING 7 TO CONCANTENATE ALL
                            ;ASCII VALUES FROM 30-3F
    ENDI 
    
    IF.B D2 <GE> #$30 AND.L D2 <LE> #$3F THEN.L
        JMP EXTRACTDIGIT
        RTS
    ENDI
    
    IF.B D2 <GE> #$5A AND.L D2 <LE> #$5F THEN.L   
        JMP EXTRACTDIGIT
        RTS
        
    ELSE    
        IF.B	SIM <NE> #00 THEN.L
            OUTSTR  ERRTEXT
        ENDI
        
        MOVE.B  #$00, D0    ;INDICATE ERROR
        RTS 
        
    ENDI
    
EXTRACTDIGIT
        IF.B	SIM <NE> #00 THEN.L
            OUTSTR  SUCCESSTXT  
        ENDI
        
        AND     #$0F, D2    ;MASK THE LSB TO EXTRACT THE DIGIT
        MOVE.B  #$01, D0    ;INDICATE SUCCESS
        
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
