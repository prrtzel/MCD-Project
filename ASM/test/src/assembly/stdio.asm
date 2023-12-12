	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#56,a7
	movem.l	l6,-(a7)
	move.l	#0,(52+l8,a7)
	bra	l4
l3
	jsr	_sgetChar
	move.b	d0,(0+l8,a7)
	lea	(1+l8,a7),a0
	move.w	(54+l8,a7),d0
	and.l	#65535,d0
	move.b	(0+l8,a7),(0,a0,d0.l)
	addq.l	#1,(52+l8,a7)
l4
	tst.b	(0+l8,a7)
	bne	l3
l5
	lea	(1+l8,a7),a0
	move.l	a0,d0
l1
l6	reg
l8	equ	0
	add.w	#56,a7
	rts
	public	_sgetChar
