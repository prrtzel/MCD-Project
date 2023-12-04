*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $1000
START:                  ; first instruction of program

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source



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
