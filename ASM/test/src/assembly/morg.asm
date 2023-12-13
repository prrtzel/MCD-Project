	idnt	"src/C/morg.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_readMemory
	cnop	0,4
_readMemory
	subq.w	#8,a7
	movem.l	l3,-(a7)
	move.l	(12+l5,a7),-(a7)
	jsr	_parseAddress
	move.l	d0,(4+l5,a7)
	move.l	(4+l5,a7),a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(4+l5,a7)
	move.l	(4+l5,a7),-(a7)
	jsr	_bin2ahex
	move.l	d0,(12+l5,a7)
	move.l	(12+l5,a7),-(a7)
	jsr	_sprintWord
	add.w	#12,a7
l1
l3	reg
l5	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_parseAddress
	cnop	0,4
_parseAddress
	sub.w	#16,a7
	movem.l	l12,-(a7)
	move.l	#0,(6+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(a0),(0+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(1,a0),(1+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(2,a0),(2+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(3,a0),(3+l14,a7)
	move.l	#0,(10+l14,a7)
	bra	l9
l8
	lea	(0+l14,a7),a0
	move.w	(12+l14,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l14,a7),a0
	move.w	(16+l14,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	addq.w	#4,a7
l11
	addq.l	#1,(10+l14,a7)
l9
	moveq	#4,d0
	cmp.l	(10+l14,a7),d0
	bgt	l8
l10
	move.b	(0+l14,a7),d0
	ext.w	d0
	ext.l	d0
	moveq	#12,d1
	lsl.l	d1,d0
	move.b	(1+l14,a7),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#8,d1
	add.l	d1,d0
	move.b	(2+l14,a7),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#4,d1
	add.l	d1,d0
	move.b	(3+l14,a7),d1
	ext.w	d1
	ext.l	d1
	add.l	d1,d0
	move.l	d0,(6+l14,a7)
	move.l	(6+l14,a7),d0
l6
l12	reg
l14	equ	0
	add.w	#16,a7
	rts
	public	_sprintWord
	public	_ahex2bin
	public	_bin2ahex
