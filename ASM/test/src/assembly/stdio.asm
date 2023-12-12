	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#60,a7
	movem.l	l6,-(a7)
	move.l	#0,(52+l8,a7)
	bra	l4
l3
	move.b	(0+l8,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(56+l8,a7)
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
	add.w	#60,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_aHex2Bin
	cnop	0,4
_aHex2Bin
	subq.w	#4,a7
	movem.l	l18,-(a7)
	move.b	(11+l20,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l20,a7)
	moveq	#97,d0
	cmp.l	(0+l20,a7),d0
	bhi	l12
l13
	moveq	#102,d0
	cmp.l	(0+l20,a7),d0
	bcs	l12
l11
	moveq	#87,d0
	sub.l	d0,(0+l20,a7)
	bra	l14
l12
	moveq	#57,d0
	cmp.l	(0+l20,a7),d0
	bcc	l16
l15
	moveq	#55,d0
	sub.l	d0,(0+l20,a7)
	bra	l17
l16
	moveq	#48,d0
	sub.l	d0,(0+l20,a7)
l17
l14
	move.b	(3+l20,a7),d0
l9
l18	reg
l20	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	public	_sgetChar
