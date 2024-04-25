	idnt	"src/C/startup.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_Default_handler
	cnop	0,4
_Default_handler
	movem.l	l6,-(a7)
l3
	bra	l3
l5
l1
l6	reg
l8	equ	0
	rts
; stacksize=0
	public	_Reset_handler
	section	"BSS",bss
	cnop	0,4
_Reset_handler
	ds.b	4
	public	_vectors
	section	code
	cnop	0,4
_vectors
	ds.b	0
