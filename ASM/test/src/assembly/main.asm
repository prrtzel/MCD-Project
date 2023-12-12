	idnt	"src/assembly/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	sub.w	#56,a7
	movem.l	l8,-(a7)
	lea	l3,a0
	lea	(0+l10,a7),a1
	moveq.l	#2,d0
l11:
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	dbra	d0,l11
	move.w	(a0)+,(a1)+
	move.l	#0,(50+l10,a7)
	bra	l5
l4
	lea	(0+l10,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l7
	addq.l	#1,(50+l10,a7)
l5
	moveq	#100,d0
	cmp.l	(50+l10,a7),d0
	bgt	l4
l6
	moveq	#9,d0
l1
l8	reg
l10	equ	0
	add.w	#56,a7
	rts
	cnop	0,4
l3
	dc.b	112
	dc.b	111
	dc.b	111
	dc.b	112
	dc.b	32
	dc.b	97
	dc.b	110
	dc.b	100
	dc.b	32
	dc.b	111
	dc.b	114
	dc.b	32
	dc.b	115
	dc.b	104
	dc.b	105
	dc.b	116
	dc.b	0
	ds.b	33
	public	_sprint
