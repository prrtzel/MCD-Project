	idnt	"src/C/morg.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_readRegisters
	cnop	0,4
_readRegisters
	sub.w	#32,a7
	movem.l	l3,-(a7)
	jsr	_readRegD0
	move.l	d0,(0+l5,a7)
	jsr	_readRegD1
	move.l	d0,(4+l5,a7)
	jsr	_readRegD2
	move.l	d0,(8+l5,a7)
	jsr	_readRegD3
	move.l	d0,(12+l5,a7)
	jsr	_readRegD4
	move.l	d0,(16+l5,a7)
	jsr	_readRegD5
	move.l	d0,(20+l5,a7)
	jsr	_readRegD6
	move.l	d0,(24+l5,a7)
	jsr	_readRegD7
	move.l	d0,(28+l5,a7)
l1
l3	reg
l5	equ	0
	add.w	#32,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD0
	cnop	0,4
_readRegD0
	subq.w	#4,a7
	movem.l	l8,-(a7)
	move.l	d0,(0+l10,a7)
	move.l	(0+l10,a7),d0
l6
l8	reg
l10	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD1
	cnop	0,4
_readRegD1
	subq.w	#4,a7
	movem.l	l13,-(a7)
	move.l	d1,(0+l15,a7)
	move.l	(0+l15,a7),d0
l11
l13	reg
l15	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD2
	cnop	0,4
_readRegD2
	subq.w	#4,a7
	movem.l	l18,-(a7)
	move.l	d2,(0+l20,a7)
	move.l	(0+l20,a7),d0
l16
l18	reg	d2
	movem.l	(a7)+,d2
l20	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD3
	cnop	0,4
_readRegD3
	subq.w	#4,a7
	movem.l	l23,-(a7)
	move.l	d3,(0+l25,a7)
	move.l	(0+l25,a7),d0
l21
l23	reg	d3
	movem.l	(a7)+,d3
l25	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD4
	cnop	0,4
_readRegD4
	subq.w	#4,a7
	movem.l	l28,-(a7)
	move.l	d4,(0+l30,a7)
	move.l	(0+l30,a7),d0
l26
l28	reg	d4
	movem.l	(a7)+,d4
l30	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD5
	cnop	0,4
_readRegD5
	subq.w	#4,a7
	movem.l	l33,-(a7)
	move.l	d5,(0+l35,a7)
	move.l	(0+l35,a7),d0
l31
l33	reg	d5
	movem.l	(a7)+,d5
l35	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD6
	cnop	0,4
_readRegD6
	subq.w	#4,a7
	movem.l	l38,-(a7)
	move.l	d6,(0+l40,a7)
	move.l	(0+l40,a7),d0
l36
l38	reg	d6
	movem.l	(a7)+,d6
l40	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD7
	cnop	0,4
_readRegD7
	subq.w	#4,a7
	movem.l	l43,-(a7)
	move.l	d7,(0+l45,a7)
	move.l	(0+l45,a7),d0
l41
l43	reg	d7
	movem.l	(a7)+,d7
l45	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_morgWriteMemory
	cnop	0,4
_morgWriteMemory
	sub.w	#48,a7
	movem.l	l49,-(a7)
	lea	l48,a0
	lea	(14+l51,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	jsr	_sgetStr
	move.l	d0,(6+l51,a7)
	move.l	(6+l51,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l51,a7)
	lea	(18+l51,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	jsr	_sgetStr
	move.l	d0,(18+l51,a7)
	move.l	(18+l51,a7),-(a7)
	jsr	_parseValue
	move.b	d0,(16+l51,a7)
	move.l	(12+l51,a7),(56+l51,a7)
	move.b	(16+l51,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	(60+l51,a7),-(a7)
	jsr	_writeMemory
	add.w	#20,a7
l46
l49	reg
l51	equ	0
	add.w	#48,a7
	rts
	cnop	0,4
l48
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
	movem.l	l54,-(a7)
	move.l	(4+l56,a7),a0
	move.b	(11+l56,a7),(a0)
l52
l54	reg
l56	equ	0
	rts
; stacksize=0
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readMemory
	cnop	0,4
_readMemory
	subq.w	#4,a7
	movem.l	l59,-(a7)
	move.l	(8+l61,a7),-(a7)
	jsr	_getValueAtAddress
	move.b	d0,(4+l61,a7)
	move.b	(4+l61,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_sprintValueAtAddress
	addq.w	#8,a7
l57
l59	reg
l61	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getValueAtAddress
	cnop	0,4
_getValueAtAddress
	subq.w	#8,a7
	movem.l	l64,-(a7)
	move.l	(12+l66,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l66,a7)
	move.l	(4+l66,a7),a0
	move.b	(a0),(8+l66,a7)
	move.b	(8+l66,a7),d0
	addq.w	#4,a7
l62
l64	reg
l66	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintValueAtAddress
	cnop	0,4
_sprintValueAtAddress
	subq.w	#4,a7
	movem.l	l69,-(a7)
	move.b	(11+l71,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_bin2ahexbyte
	move.l	d0,(4+l71,a7)
	move.l	(4+l71,a7),-(a7)
	jsr	_sprintByte
	addq.w	#8,a7
l67
l69	reg
l71	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getAddress
	cnop	0,4
_getAddress
	sub.w	#16,a7
	movem.l	l78,-(a7)
	move.l	#0,(8+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(a0),(0+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(1,a0),(1+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(2,a0),(2+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(3,a0),(3+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(4,a0),(4+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(5,a0),(5+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(6,a0),(6+l80,a7)
	move.l	(20+l80,a7),a0
	move.b	(7,a0),(7+l80,a7)
	move.b	#7,(12+l80,a7)
	move.b	#0,(13+l80,a7)
	bra	l75
l74
	lea	(0+l80,a7),a0
	move.b	(13+l80,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l80,a7),a0
	move.b	(17+l80,a7),d1
	ext.w	d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l80,a7),a0
	move.b	(17+l80,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(16+l80,a7),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	move.l	(12+l80,a7),a0
	add.l	d1,a0
	move.l	a0,(12+l80,a7)
	subq.b	#1,(16+l80,a7)
	addq.w	#4,a7
l77
	addq.b	#1,(13+l80,a7)
l75
	cmp.b	#8,(13+l80,a7)
	blt	l74
l76
	move.l	(8+l80,a7),d0
l72
l78	reg
l80	equ	0
	add.w	#16,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_register2ASCII
	cnop	0,4
_register2ASCII
	subq.w	#4,a7
	movem.l	l83,-(a7)
	move.l	(8+l85,a7),-(a7)
	jsr	_bin2ahexlongword
	move.l	d0,(4+l85,a7)
	move.l	(4+l85,a7),d0
	addq.w	#4,a7
l81
l83	reg
l85	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_parseValue
	cnop	0,4
_parseValue
	sub.w	#16,a7
	movem.l	l92,-(a7)
	move.l	#0,(2+l94,a7)
	move.l	(20+l94,a7),a0
	move.b	(a0),(0+l94,a7)
	move.l	(20+l94,a7),a0
	move.b	(1,a0),(1+l94,a7)
	moveq	#1,d0
	move.l	d0,(6+l94,a7)
	move.l	#0,(10+l94,a7)
	bra	l89
l88
	lea	(0+l94,a7),a0
	move.w	(12+l94,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l94,a7),a0
	move.w	(16+l94,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l94,a7),a0
	move.w	(16+l94,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.l	(10+l94,a7),d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	add.l	d1,(6+l94,a7)
	subq.l	#1,(10+l94,a7)
	addq.w	#4,a7
l91
	addq.l	#1,(10+l94,a7)
l89
	moveq	#2,d0
	cmp.l	(10+l94,a7),d0
	bgt	l88
l90
	move.b	(5+l94,a7),d0
l86
l92	reg
l94	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetStr
	public	_sprintByte
	public	_ahex2bin
	public	_bin2ahexlongword
	public	_bin2ahexbyte
