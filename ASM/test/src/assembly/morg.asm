	idnt	"src/C/morg.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_writeMemory
	cnop	0,4
_writeMemory
	sub.w	#20,a7
	movem.l	l3,-(a7)
	jsr	_sgetStr
	move.l	d0,(6+l5,a7)
	move.l	(6+l5,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l5,a7)
	jsr	_sgetStr
	move.l	d0,(14+l5,a7)
	move.l	(14+l5,a7),-(a7)
	jsr	_parseValue
	move.b	d0,(12+l5,a7)
	move.l	(8+l5,a7),(22+l5,a7)
	move.l	(22+l5,a7),a0
	move.b	(12+l5,a7),(a0)
	addq.w	#8,a7
l1
l3	reg
l5	equ	0
	add.w	#20,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readMemory
	cnop	0,4
_readMemory
	subq.w	#4,a7
	movem.l	l8,-(a7)
	move.l	(8+l10,a7),-(a7)
	jsr	_getValueAtAddress
	move.b	d0,(4+l10,a7)
	move.b	(4+l10,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_sprintValueAtAddress
	addq.w	#8,a7
l6
l8	reg
l10	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getValueAtAddress
	cnop	0,4
_getValueAtAddress
	subq.w	#8,a7
	movem.l	l13,-(a7)
	move.l	(12+l15,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l15,a7)
	move.l	(4+l15,a7),a0
	move.b	(a0),(8+l15,a7)
	move.b	(8+l15,a7),d0
	addq.w	#4,a7
l11
l13	reg
l15	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintValueAtAddress
	cnop	0,4
_sprintValueAtAddress
	subq.w	#4,a7
	movem.l	l18,-(a7)
	move.b	(11+l20,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_bin2ahexbyte
	move.l	d0,(4+l20,a7)
	move.l	(4+l20,a7),-(a7)
	jsr	_sprintByte
	addq.w	#8,a7
l16
l18	reg
l20	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getAddress
	cnop	0,4
_getAddress
	sub.w	#16,a7
	movem.l	l27,-(a7)
	move.l	#0,(8+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(a0),(0+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(1,a0),(1+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(2,a0),(2+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(3,a0),(3+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(4,a0),(4+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(5,a0),(5+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(6,a0),(6+l29,a7)
	move.l	(20+l29,a7),a0
	move.b	(7,a0),(7+l29,a7)
	move.b	#7,(12+l29,a7)
	move.b	#0,(13+l29,a7)
	bra	l24
l23
	lea	(0+l29,a7),a0
	move.b	(13+l29,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l29,a7),a0
	move.b	(17+l29,a7),d1
	ext.w	d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l29,a7),a0
	move.b	(17+l29,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(16+l29,a7),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	move.l	(12+l29,a7),a0
	add.l	d1,a0
	move.l	a0,(12+l29,a7)
	subq.b	#1,(16+l29,a7)
	addq.w	#4,a7
l26
	addq.b	#1,(13+l29,a7)
l24
	cmp.b	#8,(13+l29,a7)
	blt	l23
l25
	move.l	(8+l29,a7),d0
l21
l27	reg
l29	equ	0
	add.w	#16,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_parseValue
	cnop	0,4
_parseValue
	sub.w	#16,a7
	movem.l	l36,-(a7)
	move.l	#0,(2+l38,a7)
	move.l	(20+l38,a7),a0
	move.b	(a0),(0+l38,a7)
	move.l	(20+l38,a7),a0
	move.b	(1,a0),(1+l38,a7)
	moveq	#1,d0
	move.l	d0,(6+l38,a7)
	move.l	#0,(10+l38,a7)
	bra	l33
l32
	lea	(0+l38,a7),a0
	move.w	(12+l38,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l38,a7),a0
	move.w	(16+l38,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l38,a7),a0
	move.w	(16+l38,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.l	(10+l38,a7),d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	add.l	d1,(6+l38,a7)
	subq.l	#1,(10+l38,a7)
	addq.w	#4,a7
l35
	addq.l	#1,(10+l38,a7)
l33
	moveq	#2,d0
	cmp.l	(10+l38,a7),d0
	bgt	l32
l34
	move.b	(5+l38,a7),d0
l30
l36	reg
l38	equ	0
	add.w	#16,a7
	rts
	public	_sgetStr
	public	_sprintByte
	public	_ahex2bin
	public	_bin2ahexbyte
