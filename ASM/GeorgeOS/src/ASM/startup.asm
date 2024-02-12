	idnt	"src\C\startup.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_startup
	cnop	0,4
_startup
	movem.l	l3,-(a7)
	jsr	_main
l1
l3	reg
l5	equ	0
	rts
	public	_main
