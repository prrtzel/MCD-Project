	idnt	"src/C/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	subq.w	#4,a7
	movem.l	l4,-(a7)
	move.l	#l3,(0+l6,a7)
	lea	(0+l6,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#9,d0
	addq.w	#4,a7
l1
l4	reg
l6	equ	0
	addq.w	#4,a7
	rts
	cnop	0,4
l3
	dc.b	114
	dc.b	101
	dc.b	115
	dc.b	101
	dc.b	116
	dc.b	0
	public	_value
	section	"DATA",data
	cnop	0,4
_value
	dc.b	0
	public	_sprint
