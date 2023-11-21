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
     
    JSR GCHAR
    JSR ASCIIDECTOBIN
 

    SIMHALT                 ; halt simulator
    
*------------------------------------------------------------- 
* VARIABLES
   
    
ERRTEXT     DC.B 'ERROR',$D,$A,0
SUCCESSTXT  DC.B 'SUCCESS',$D,$A,0    

*-------------------------------------------------------------

* SUBROUTINES

*-------------------------------------------------------------
* CONVERT ASCII DECIMAL DIGIT TO HEX VALUE 
* TAKES VALUE FROM D0 AND PUTS IT IN
* HEX FORM IN D2
* EX: '9' --> 9(16)

ASCIIDECTOBIN

    MOVE.B  D0, D2
     
    IF.B D0 <GE> #$30 AND.L D0 <LE> #$39 THEN.L
        IF.B	SIM <NE> #00 THEN.L
            OUTSTR  SUCCESSTXT  
        ENDI
        
        AND     #$0F, D2    ;MASK THE LSB TO EXTRACT THE DIGIT OF 0-9
        MOVE.B  #$01, D0    ;INDICATE SUCCESS
        
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

ASCIIDECTOBIN

    MOVE.B  D0, D2
     
    IF.B D0 <GE> #$30 AND.L D0 <LE> #$39 THEN.L
        IF.B	SIM <NE> #00 THEN.L
            OUTSTR  SUCCESSTXT  
        ENDI
        
        AND     #$0F, D2    ;MASK THE LSB TO EXTRACT THE DIGIT OF 0-9
        MOVE.B  #$01, D0    ;INDICATE SUCCESS
        
    ELSE
        IF.B	SIM <NE> #00 THEN.L
            OUTSTR  ERRTEXT
        ENDI
        
        MOVE.B  #$00, D0    ;INDICATE ERROR
        
    ENDI


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
