	idnt	"src/C/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	subq.w	#4,a7
	movem.l	l3,-(a7)
	jsr	_sgetStr
	move.l	d0,(0+l5,a7)
	move.l	(0+l5,a7),-(a7)
	jsr	_sprint
	moveq	#9,d0
	addq.w	#4,a7
l1
l3	reg
l5	equ	0
	addq.w	#4,a7
	rts
	public	_sprint
	public	_sgetStr
