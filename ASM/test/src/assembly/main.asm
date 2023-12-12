	idnt	"src/assembly/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	sub.w	#20,a7
	movem.l	l4,-(a7)
	lea	l3,a0
	lea	(0+l6,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	lea	(0+l6,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#9,d0
	addq.w	#4,a7
l1
l4	reg
l6	equ	0
	add.w	#20,a7
	rts
	cnop	0,4
l3
	dc.b	104
	dc.b	101
	dc.b	108
	dc.b	108
	dc.b	111
	dc.b	32
	dc.b	119
	dc.b	111
	dc.b	114
	dc.b	108
	dc.b	100
	dc.b	0
	ds.b	8
	public	_sprint
