	idnt	"src/C/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	sub.w	#16,a7
	movem.l	l6,-(a7)
	lea	l3,a0
	lea	(0+l8,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	#102,(9+l8,a7)
	move.b	#97,(10+l8,a7)
	move.b	#105,(11+l8,a7)
	move.b	#108,(12+l8,a7)
	move.b	#0,(13+l8,a7)
	move.l	#102,-(a7)
	jsr	_aHex2Bin
	move.b	d0,(18+l8,a7)
	addq.w	#4,a7
	cmp.b	#15,(14+l8,a7)
	bne	l5
l4
	lea	(0+l8,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l5
	lea	(14+l8,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#9,d0
	addq.w	#4,a7
l1
l6	reg
l8	equ	0
	add.w	#16,a7
	rts
	cnop	0,4
l3
	dc.b	115
	dc.b	117
	dc.b	99
	dc.b	99
	dc.b	101
	dc.b	115
	dc.b	115
	dc.b	33
	dc.b	0
	public	_sprint
	public	_aHex2Bin
