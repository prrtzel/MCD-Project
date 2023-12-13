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
	jsr	_bin2ahexmem
	move.l	d0,(12+l5,a7)
	move.l	(12+l5,a7),-(a7)
	jsr	_sprintByte
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
	move.l	#0,(8+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(a0),(0+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(1,a0),(1+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(2,a0),(2+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(3,a0),(3+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(4,a0),(4+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(5,a0),(5+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(6,a0),(6+l14,a7)
	move.l	(20+l14,a7),a0
	move.b	(7,a0),(7+l14,a7)
	move.l	#0,(12+l14,a7)
	bra	l9
l8
	lea	(0+l14,a7),a0
	move.w	(14+l14,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l14,a7),a0
	move.w	(18+l14,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	addq.w	#4,a7
l11
	addq.l	#1,(12+l14,a7)
l9
	moveq	#8,d0
	cmp.l	(12+l14,a7),d0
	bgt	l8
l10
	move.b	(0+l14,a7),d0
	ext.w	d0
	ext.l	d0
	moveq	#28,d1
	lsl.l	d1,d0
	move.b	(1+l14,a7),d1
	ext.w	d1
	ext.l	d1
	moveq	#24,d2
	lsl.l	d2,d1
	add.l	d1,d0
	move.b	(2+l14,a7),d1
	ext.w	d1
	ext.l	d1
	moveq	#20,d2
	lsl.l	d2,d1
	add.l	d1,d0
	move.b	(3+l14,a7),d1
	ext.w	d1
	ext.l	d1
	moveq	#16,d2
	lsl.l	d2,d1
	add.l	d1,d0
	move.b	(4+l14,a7),d1
	ext.w	d1
	ext.l	d1
	moveq	#12,d2
	lsl.l	d2,d1
	add.l	d1,d0
	move.b	(5+l14,a7),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#8,d1
	add.l	d1,d0
	move.b	(6+l14,a7),d1
	ext.w	d1
	ext.l	d1
	lsl.l	#4,d1
	add.l	d1,d0
	move.b	(7+l14,a7),d1
	ext.w	d1
	ext.l	d1
	add.l	d1,d0
	move.l	d0,(8+l14,a7)
	move.l	(8+l14,a7),d0
l6
l12	reg	d2
	movem.l	(a7)+,d2
l14	equ	4
	add.w	#16,a7
	rts
	public	_sprintByte
	public	_ahex2bin
	public	_bin2ahexmem
