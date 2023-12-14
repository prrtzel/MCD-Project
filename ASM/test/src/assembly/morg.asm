	idnt	"src/C/morg.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_morgWriteMemory
	cnop	0,4
_morgWriteMemory
	sub.w	#48,a7
	movem.l	l4,-(a7)
	lea	l3,a0
	lea	(14+l6,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	jsr	_sgetStr
	move.l	d0,(6+l6,a7)
	move.l	(6+l6,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l6,a7)
	lea	(18+l6,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	jsr	_sgetStr
	move.l	d0,(18+l6,a7)
	move.l	(18+l6,a7),-(a7)
	jsr	_parseValue
	move.b	d0,(16+l6,a7)
	move.l	(12+l6,a7),(56+l6,a7)
	move.b	(16+l6,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	(60+l6,a7),-(a7)
	jsr	_writeMemory
	add.w	#20,a7
l1
l4	reg
l6	equ	0
	add.w	#48,a7
	rts
	cnop	0,4
l3
	dc.b	83
	dc.b	101
	dc.b	108
	dc.b	101
	dc.b	99
	dc.b	116
	dc.b	32
	dc.b	66
	dc.b	121
	dc.b	116
	dc.b	101
	dc.b	32
	dc.b	116
	dc.b	111
	dc.b	32
	dc.b	87
	dc.b	114
	dc.b	105
	dc.b	116
	dc.b	101
	dc.b	32
	dc.b	105
	dc.b	110
	dc.b	32
	dc.b	72
	dc.b	101
	dc.b	120
	dc.b	10
	dc.b	13
	dc.b	0
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_writeMemory
	cnop	0,4
_writeMemory
	movem.l	l9,-(a7)
	move.l	(4+l11,a7),a0
	move.b	(11+l11,a7),(a0)
l7
l9	reg
l11	equ	0
	rts
; stacksize=0
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readMemory
	cnop	0,4
_readMemory
	subq.w	#4,a7
	movem.l	l14,-(a7)
	move.l	(8+l16,a7),-(a7)
	jsr	_getValueAtAddress
	move.b	d0,(4+l16,a7)
	move.b	(4+l16,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_sprintValueAtAddress
	addq.w	#8,a7
l12
l14	reg
l16	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getValueAtAddress
	cnop	0,4
_getValueAtAddress
	subq.w	#8,a7
	movem.l	l19,-(a7)
	move.l	(12+l21,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l21,a7)
	move.l	(4+l21,a7),a0
	move.b	(a0),(8+l21,a7)
	move.b	(8+l21,a7),d0
	addq.w	#4,a7
l17
l19	reg
l21	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintValueAtAddress
	cnop	0,4
_sprintValueAtAddress
	subq.w	#4,a7
	movem.l	l24,-(a7)
	move.b	(11+l26,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_bin2ahexbyte
	move.l	d0,(4+l26,a7)
	move.l	(4+l26,a7),-(a7)
	jsr	_sprintByte
	addq.w	#8,a7
l22
l24	reg
l26	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getAddress
	cnop	0,4
_getAddress
	sub.w	#16,a7
	movem.l	l33,-(a7)
	move.l	#0,(8+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(a0),(0+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(1,a0),(1+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(2,a0),(2+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(3,a0),(3+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(4,a0),(4+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(5,a0),(5+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(6,a0),(6+l35,a7)
	move.l	(20+l35,a7),a0
	move.b	(7,a0),(7+l35,a7)
	move.b	#7,(12+l35,a7)
	move.b	#0,(13+l35,a7)
	bra	l30
l29
	lea	(0+l35,a7),a0
	move.b	(13+l35,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l35,a7),a0
	move.b	(17+l35,a7),d1
	ext.w	d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l35,a7),a0
	move.b	(17+l35,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(16+l35,a7),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	move.l	(12+l35,a7),a0
	add.l	d1,a0
	move.l	a0,(12+l35,a7)
	subq.b	#1,(16+l35,a7)
	addq.w	#4,a7
l32
	addq.b	#1,(13+l35,a7)
l30
	cmp.b	#8,(13+l35,a7)
	blt	l29
l31
	move.l	(8+l35,a7),d0
l27
l33	reg
l35	equ	0
	add.w	#16,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_parseValue
	cnop	0,4
_parseValue
	sub.w	#16,a7
	movem.l	l42,-(a7)
	move.l	#0,(2+l44,a7)
	move.l	(20+l44,a7),a0
	move.b	(a0),(0+l44,a7)
	move.l	(20+l44,a7),a0
	move.b	(1,a0),(1+l44,a7)
	moveq	#1,d0
	move.l	d0,(6+l44,a7)
	move.l	#0,(10+l44,a7)
	bra	l39
l38
	lea	(0+l44,a7),a0
	move.w	(12+l44,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l44,a7),a0
	move.w	(16+l44,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l44,a7),a0
	move.w	(16+l44,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.l	(10+l44,a7),d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	add.l	d1,(6+l44,a7)
	subq.l	#1,(10+l44,a7)
	addq.w	#4,a7
l41
	addq.l	#1,(10+l44,a7)
l39
	moveq	#2,d0
	cmp.l	(10+l44,a7),d0
	bgt	l38
l40
	move.b	(5+l44,a7),d0
l36
l42	reg
l44	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetStr
	public	_sprintByte
	public	_ahex2bin
	public	_bin2ahexbyte
