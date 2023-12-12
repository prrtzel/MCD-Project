	idnt	"src/C/main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	sub.w	#24,a7
	movem.l	l4,-(a7)
	lea	l3,a0
	lea	(0+l6,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.b	(a0)+,(a1)+
	move.b	#102,(9+l6,a7)
	move.b	#97,(10+l6,a7)
	move.b	#105,(11+l6,a7)
	move.b	#108,(12+l6,a7)
	move.b	#0,(13+l6,a7)
	move.l	#64203,-(a7)
	jsr	_bin2ahex
	move.l	d0,(18+l6,a7)
	move.l	(18+l6,a7),a0
	move.b	(a0),(22+l6,a7)
	move.l	(18+l6,a7),a0
	move.b	(1,a0),(23+l6,a7)
	move.l	(18+l6,a7),a0
	move.b	(2,a0),(24+l6,a7)
	move.l	(18+l6,a7),a0
	move.b	(3,a0),(25+l6,a7)
	move.b	#0,(26+l6,a7)
	lea	(22+l6,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#9,d0
	addq.w	#8,a7
l1
l4	reg
l6	equ	0
	add.w	#24,a7
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
	public	_bin2ahex
