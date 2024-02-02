	idnt	"src\C\startup.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	movem.l	l3,-(a7)
	moveq	#0,d0
l1
l3	reg
l5	equ	0
	rts
; stacksize=0
