	
;------------------------------------
; Serial Print Functions for Simulator	
	public _sprintTest
	public _sprint
	public _sgetChar
	public _sgetString

_sprintTest
	move.l	a1, -(sp)
	move.l	d0, -(sp)
    lea     testMessage,a1
	move.b  #14,d0    
	trap    #15
	move.l 	d0, (sp)+
	move.l	a1, (sp)+
    rts

_sprint	
	move.l	a0, -(sp)
	move.l	a1, -(sp)
	move.l	d0, -(sp)

    move.l  8(sp),a1
	move.b  #13,d0    
	trap    #15

	move.l 	d0, (sp)+
	move.l	a1, (sp)+
	move.l	a0, (sp)+
    rts

_sgetString
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
cr 	equ		$0D
lf	equ		$0A 

testMessage
	dc.b    'Test Message :)',cr,lf,0   
