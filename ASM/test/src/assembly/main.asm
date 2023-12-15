	idnt	"src/C/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	movem.l	l3,-(a7)
	move.l	#0,-(a7)
	jsr	_readRegisters
	moveq	#9,d0
	addq.w	#4,a7
l1
l3	reg
l5	equ	0
	rts
	public	_value
	section	"DATA",data
	cnop	0,4
_value
	dc.b	0
	public	_readRegisters
