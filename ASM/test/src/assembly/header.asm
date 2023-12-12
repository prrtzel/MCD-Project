	public _sprintTest
	public _sprint

_sprintTest
    lea     testMessage,a1
	move.b  #14,d0    
	trap    #15
    rts

_sprint
    move.l  a0,a1
	move.b  #13,d0    
	trap    #15
    rts

cr 	equ		$0D
lf	equ		$0A 

testMessage
	dc.b    'Test Message :)',cr,lf,0   
