;------------------------------------
; keyboard variables
bs	equ	$08 ;backspace	
ht	equ	$09	;tab
lf	equ	$0a ;line feed
cr	equ	$0d ;caaraiegeef return IDK how to spell :)

;------------------------------------
; Serial Print Functions for Simulator	
	public _sprint
	public _sgetChar
	public _clrscreen
	public _writetomem

_writetomem



_clrscreen

	move.l	d1, -(sp)
	move.l	d0, -(sp)

	move.l  #$ff00, d1
	move.l	#11, d0   
	trap    #15

	move.l 	d0, (sp)+
	move.l	d1, (sp)+

    rts

_sprint	
	move.l	a0, -(sp)
	move.l	a1, -(sp)
	move.l	d0, -(sp)

    move.l  8(sp),a1
	move.b  #14,d0    
	trap    #15

	move.l 	d0, (sp)+
	move.l	a1, (sp)+
	move.l	a0, (sp)+
    rts

_sgetChar
; stores reference in a1
; stores length of str in d1
	move.l	a1, -(sp)
	move.l	d0, -(sp)
	move.l 	d1, -(sp) 

	move.l	16(sp), a1
	move.l	#5, d0
	trap	#15
	move.l	d1, d0

	move.l	d1, (sp)+
	move.l 	d0, (sp)+
	move.l	a1, (sp)+

	rts
; ------------------------------------------
