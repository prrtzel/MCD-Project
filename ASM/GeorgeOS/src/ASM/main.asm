	idnt	"src\C\main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_thing
	cnop	0,4
_thing
	movem.l	l3,-(a7)
	moveq	#1,d0
l1
l3	reg
l5	equ	0
	rts
; stacksize=0
