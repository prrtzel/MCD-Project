	idnt	"src/assembly/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	sub.w	#72,a7
	movem.l	l5,-(a7)
	lea	l3,a0
	lea	(0+l7,a7),a1
	moveq.l	#2,d0
l8:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	dbra	d0,l8
	move.w	(a0)+,(a1)+
	lea	l4,a0
	lea	(50+l7,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	lea	(50+l7,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	lea	(4+l7,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#9,d0
	addq.w	#8,a7
l1
l5	reg
l7	equ	0
	add.w	#72,a7
	rts
	cnop	0,4
l3
	dc.b	116
	dc.b	104
	dc.b	105
	dc.b	115
	dc.b	32
	dc.b	105
	dc.b	115
	dc.b	32
	dc.b	97
	dc.b	32
	dc.b	100
	dc.b	105
	dc.b	102
	dc.b	102
	dc.b	101
	dc.b	114
	dc.b	101
	dc.b	110
	dc.b	116
	dc.b	32
	dc.b	115
	dc.b	116
	dc.b	114
	dc.b	105
	dc.b	110
	dc.b	103
	dc.b	0
	ds.b	23
	cnop	0,4
l4
	dc.b	89
	dc.b	73
	dc.b	80
	dc.b	80
	dc.b	69
	dc.b	69
	dc.b	10
	dc.b	13
	dc.b	87
	dc.b	79
	dc.b	87
	dc.b	0
	ds.b	8
	public	_sprint
