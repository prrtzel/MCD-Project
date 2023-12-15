	idnt	"src/C/morg.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_readRegisters
	cnop	0,4
_readRegisters
	sub.w	#20,a7
	movem.l	l13,-(a7)
	move.l	#$00123456,d0

	move.b	(27+l15,a7),d0
	move.b	d0,d1
	ext.w	d1
	cmp.w	#7,d1
	bhi	l12
	lsl.w	#2,d1
	move.l	l16(pc,d1.w),a0
	jmp	(a0)
	cnop	0,4
l16
	dc.l	l4
	dc.l	l5
	dc.l	l6
	dc.l	l7
	dc.l	l8
	dc.l	l9
	dc.l	l10
	dc.l	l11
l4
	jsr	_readRegD0
	move.l	d0,(0+l15,a7)
	bra	l3
l5
	jsr	_readRegD1
	move.l	d0,(0+l15,a7)
	bra	l3
l6
	jsr	_readRegD2
	move.l	d0,(0+l15,a7)
	bra	l3
l7
	jsr	_readRegD3
	move.l	d0,(0+l15,a7)
	bra	l3
l8
	jsr	_readRegD4
	move.l	d0,(0+l15,a7)
	bra	l3
l9
	jsr	_readRegD5
	move.l	d0,(0+l15,a7)
	bra	l3
l10
	jsr	_readRegD6
	move.l	d0,(0+l15,a7)
	bra	l3
l11
	jsr	_readRegD7
	move.l	d0,(0+l15,a7)
	bra	l3
l12
l3
	moveq	#16,d1
	move.l	(0+l15,a7),d0
	asr.l	d1,d0
	move.l	#65535,d1
	and.l	d0,d1
	move.l	d1,(4+l15,a7)
	move.l	#65535,d0
	and.l	(0+l15,a7),d0
	move.l	d0,(8+l15,a7)
	move.l	(4+l15,a7),-(a7)
	jsr	_bin2ahexword
	move.l	d0,(16+l15,a7)
	move.l	(16+l15,a7),-(a7)
	jsr	_sprintWord
	move.l	(16+l15,a7),-(a7)
	jsr	_bin2ahexword
	move.l	d0,(28+l15,a7)
	move.l	(28+l15,a7),-(a7)
	jsr	_sprintWord
	add.w	#16,a7
l1
l13	reg
l15	equ	0
	add.w	#20,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD0
	cnop	0,4
_readRegD0
	subq.w	#4,a7
	movem.l	l19,-(a7)
	move.l	d0,(0+l21,a7)
	move.l	(0+l21,a7),d0
l17
l19	reg
l21	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD1
	cnop	0,4
_readRegD1
	subq.w	#4,a7
	movem.l	l24,-(a7)
	move.l	d1,(0+l26,a7)
	move.l	(0+l26,a7),d0
l22
l24	reg
l26	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD2
	cnop	0,4
_readRegD2
	subq.w	#4,a7
	movem.l	l29,-(a7)
	move.l	d2,(0+l31,a7)
	move.l	(0+l31,a7),d0
l27
l29	reg	d2
	movem.l	(a7)+,d2
l31	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD3
	cnop	0,4
_readRegD3
	subq.w	#4,a7
	movem.l	l34,-(a7)
	move.l	d3,(0+l36,a7)
	move.l	(0+l36,a7),d0
l32
l34	reg	d3
	movem.l	(a7)+,d3
l36	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD4
	cnop	0,4
_readRegD4
	subq.w	#4,a7
	movem.l	l39,-(a7)
	move.l	d4,(0+l41,a7)
	move.l	(0+l41,a7),d0
l37
l39	reg	d4
	movem.l	(a7)+,d4
l41	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD5
	cnop	0,4
_readRegD5
	subq.w	#4,a7
	movem.l	l44,-(a7)
	move.l	d5,(0+l46,a7)
	move.l	(0+l46,a7),d0
l42
l44	reg	d5
	movem.l	(a7)+,d5
l46	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD6
	cnop	0,4
_readRegD6
	subq.w	#4,a7
	movem.l	l49,-(a7)
	move.l	d6,(0+l51,a7)
	move.l	(0+l51,a7),d0
l47
l49	reg	d6
	movem.l	(a7)+,d6
l51	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readRegD7
	cnop	0,4
_readRegD7
	subq.w	#4,a7
	movem.l	l54,-(a7)
	move.l	d7,(0+l56,a7)
	move.l	(0+l56,a7),d0
l52
l54	reg	d7
	movem.l	(a7)+,d7
l56	equ	4
	addq.w	#4,a7
	rts
; stacksize=8
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_morgWriteMemory
	cnop	0,4
_morgWriteMemory
	sub.w	#48,a7
	movem.l	l60,-(a7)
	lea	l59,a0
	lea	(14+l62,a7),a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.w	(a0)+,(a1)+
	jsr	_sgetStr
	move.l	d0,(6+l62,a7)
	move.l	(6+l62,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l62,a7)
	lea	(18+l62,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	jsr	_sgetStr
	move.l	d0,(18+l62,a7)
	move.l	(18+l62,a7),-(a7)
	jsr	_parseValue
	move.b	d0,(16+l62,a7)
	move.l	(12+l62,a7),(56+l62,a7)
	move.b	(16+l62,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	(60+l62,a7),-(a7)
	jsr	_writeMemory
	add.w	#20,a7
l57
l60	reg
l62	equ	0
	add.w	#48,a7
	rts
	cnop	0,4
l59
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
	movem.l	l65,-(a7)
	move.l	(4+l67,a7),a0
	move.b	(11+l67,a7),(a0)
l63
l65	reg
l67	equ	0
	rts
; stacksize=0
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_readMemory
	cnop	0,4
_readMemory
	subq.w	#4,a7
	movem.l	l70,-(a7)
	move.l	(8+l72,a7),-(a7)
	jsr	_getValueAtAddress
	move.b	d0,(4+l72,a7)
	move.b	(4+l72,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_sprintValueAtAddress
	addq.w	#8,a7
l68
l70	reg
l72	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getValueAtAddress
	cnop	0,4
_getValueAtAddress
	subq.w	#8,a7
	movem.l	l75,-(a7)
	move.l	(12+l77,a7),-(a7)
	jsr	_getAddress
	move.l	d0,(4+l77,a7)
	move.l	(4+l77,a7),a0
	move.b	(a0),(8+l77,a7)
	move.b	(8+l77,a7),d0
	addq.w	#4,a7
l73
l75	reg
l77	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintValueAtAddress
	cnop	0,4
_sprintValueAtAddress
	subq.w	#4,a7
	movem.l	l80,-(a7)
	move.b	(11+l82,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_bin2ahexbyte
	move.l	d0,(4+l82,a7)
	move.l	(4+l82,a7),-(a7)
	jsr	_sprintByte
	addq.w	#8,a7
l78
l80	reg
l82	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_getAddress
	cnop	0,4
_getAddress
	sub.w	#16,a7
	movem.l	l89,-(a7)
	move.l	#0,(8+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(a0),(0+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(1,a0),(1+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(2,a0),(2+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(3,a0),(3+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(4,a0),(4+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(5,a0),(5+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(6,a0),(6+l91,a7)
	move.l	(20+l91,a7),a0
	move.b	(7,a0),(7+l91,a7)
	move.b	#7,(12+l91,a7)
	move.b	#0,(13+l91,a7)
	bra	l86
l85
	lea	(0+l91,a7),a0
	move.b	(13+l91,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l91,a7),a0
	move.b	(17+l91,a7),d1
	ext.w	d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l91,a7),a0
	move.b	(17+l91,a7),d0
	ext.w	d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(16+l91,a7),d0
	ext.w	d0
	ext.l	d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	move.l	(12+l91,a7),a0
	add.l	d1,a0
	move.l	a0,(12+l91,a7)
	subq.b	#1,(16+l91,a7)
	addq.w	#4,a7
l88
	addq.b	#1,(13+l91,a7)
l86
	cmp.b	#8,(13+l91,a7)
	blt	l85
l87
	move.l	(8+l91,a7),d0
l83
l89	reg
l91	equ	0
	add.w	#16,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_register2ASCII
	cnop	0,4
_register2ASCII
	subq.w	#4,a7
	movem.l	l94,-(a7)
	move.l	(8+l96,a7),-(a7)
	jsr	_bin2ahexlongword
	move.l	d0,(4+l96,a7)
	move.l	(4+l96,a7),d0
	addq.w	#4,a7
l92
l94	reg
l96	equ	0
	addq.w	#4,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_parseValue
	cnop	0,4
_parseValue
	sub.w	#16,a7
	movem.l	l103,-(a7)
	move.l	#0,(2+l105,a7)
	move.l	(20+l105,a7),a0
	move.b	(a0),(0+l105,a7)
	move.l	(20+l105,a7),a0
	move.b	(1,a0),(1+l105,a7)
	moveq	#1,d0
	move.l	d0,(6+l105,a7)
	move.l	#0,(10+l105,a7)
	bra	l100
l99
	lea	(0+l105,a7),a0
	move.w	(12+l105,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	_ahex2bin
	lea	(4+l105,a7),a0
	move.w	(16+l105,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(4+l105,a7),a0
	move.w	(16+l105,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.l	(10+l105,a7),d0
	lsl.l	#2,d0
	move.b	(a0),d1
	ext.w	d1
	ext.l	d1
	lsl.l	d0,d1
	add.l	d1,(6+l105,a7)
	subq.l	#1,(10+l105,a7)
	addq.w	#4,a7
l102
	addq.l	#1,(10+l105,a7)
l100
	moveq	#2,d0
	cmp.l	(10+l105,a7),d0
	bgt	l99
l101
	move.b	(5+l105,a7),d0
l97
l103	reg
l105	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetStr
	public	_sprintWord
	public	_sprintByte
	public	_ahex2bin
	public	_bin2ahexword
	public	_bin2ahexlongword
	public	_bin2ahexbyte
