	idnt	"src/C/test.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	sub.w	#12,a7
	movem.l	l3,-(a7)
	move.l	#0,(0+l5,a7)
	moveq	#1,d0
	move.l	d0,(4+l5,a7)
	moveq	#1,d0
	move.l	d0,(8+l5,a7)
	move.l	(4+l5,a7),d0
	add.l	(8+l5,a7),d0
	move.l	d0,(0+l5,a7)
	move.l	(0+l5,a7),d0
l1
l3	reg
l5	equ	0
	add.w	#12,a7
	rts
; stacksize=12
