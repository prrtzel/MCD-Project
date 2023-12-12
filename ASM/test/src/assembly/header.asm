	public _print

_print
    lea     message,a1
	move.b  #14,d0    
	trap    #15
    rts
message 
	dc.b    'hello',0   
