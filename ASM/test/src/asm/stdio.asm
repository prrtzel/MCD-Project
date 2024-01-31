	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#72,a7
	movem.l	l13,-(a7)
	move.b	#62,(0+l15,a7)
	move.b	#62,(1+l15,a7)
	move.b	#0,(2+l15,a7)
	lea	(0+l15,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	move.b	#10,(7+l15,a7)
	move.b	#13,(8+l15,a7)
	move.b	#0,(9+l15,a7)
	move.b	#0,(10+l15,a7)
	move.b	#32,(11+l15,a7)
	move.b	#8,(12+l15,a7)
	move.b	#0,(13+l15,a7)
	move.b	#0,(14+l15,a7)
	move.b	#1,(15+l15,a7)
	move.l	#0,(66+l15,a7)
	move.l	#0,(70+l15,a7)
	addq.w	#4,a7
	bra	l4
l3
	lea	(12+l15,a7),a0
	move.w	(68+l15,a7),d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
l6
	addq.l	#1,(66+l15,a7)
l4
	moveq	#50,d0
	cmp.l	(66+l15,a7),d0
	bgt	l3
l5
	move.l	#0,(66+l15,a7)
	bra	l8
l7
	jsr	_sgetChar
	move.b	d0,(11+l15,a7)
	cmp.b	#8,(11+l15,a7)
	bne	l11
l10
	subq.l	#1,(66+l15,a7)
	lea	(12+l15,a7),a0
	move.w	(68+l15,a7),d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
	lea	(7+l15,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
	bra	l12
l11
	lea	(12+l15,a7),a0
	move.w	(68+l15,a7),d0
	and.l	#65535,d0
	move.b	(11+l15,a7),(0,a0,d0.l)
	addq.l	#1,(66+l15,a7)
l12
l8
	cmp.b	#13,(11+l15,a7)
	bne	l7
l9
	lea	(12+l15,a7),a0
	move.w	(68+l15,a7),d0
	addq.w	#1,d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
	lea	(3+l15,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	lea	(16+l15,a7),a0
	move.l	a0,d0
	addq.w	#4,a7
l1
l13	reg
l15	equ	0
	add.w	#72,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintLongWord
	cnop	0,4
_sprintLongWord
	sub.w	#12,a7
	movem.l	l18,-(a7)
	move.l	(16+l20,a7),a0
	move.b	(a0),(0+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(1,a0),(1+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(2,a0),(2+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(3,a0),(3+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(4,a0),(4+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(5,a0),(5+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(6,a0),(6+l20,a7)
	move.l	(16+l20,a7),a0
	move.b	(7,a0),(7+l20,a7)
	move.b	#13,(8+l20,a7)
	move.b	#10,(9+l20,a7)
	move.b	#0,(10+l20,a7)
	lea	(0+l20,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l16
l18	reg
l20	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintWord
	cnop	0,4
_sprintWord
	subq.w	#8,a7
	movem.l	l23,-(a7)
	move.l	(12+l25,a7),a0
	move.b	(a0),(0+l25,a7)
	move.l	(12+l25,a7),a0
	move.b	(1,a0),(1+l25,a7)
	move.l	(12+l25,a7),a0
	move.b	(2,a0),(2+l25,a7)
	move.l	(12+l25,a7),a0
	move.b	(3,a0),(3+l25,a7)
	move.b	#13,(4+l25,a7)
	move.b	#10,(5+l25,a7)
	move.b	#0,(6+l25,a7)
	lea	(0+l25,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l21
l23	reg
l25	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintByte
	cnop	0,4
_sprintByte
	subq.w	#8,a7
	movem.l	l28,-(a7)
	move.l	(12+l30,a7),a0
	move.b	(a0),(0+l30,a7)
	move.l	(12+l30,a7),a0
	move.b	(1,a0),(1+l30,a7)
	move.b	#13,(2+l30,a7)
	move.b	#10,(3+l30,a7)
	move.b	#0,(4+l30,a7)
	lea	(0+l30,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l26
l28	reg
l30	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l33,-(a7)
	move.b	(11+l35,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l35,a7)
	moveq	#48,d0
	sub.l	d0,(0+l35,a7)
	move.b	(3+l35,a7),d0
l31
l33	reg
l35	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l47,-(a7)
	move.b	(19+l49,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l49,a7)
	moveq	#97,d0
	cmp.l	(0+l49,a7),d0
	bhi	l39
l40
	moveq	#102,d0
	cmp.l	(0+l49,a7),d0
	bcs	l39
l38
	moveq	#87,d0
	sub.l	d0,(0+l49,a7)
	bra	l41
l39
	moveq	#57,d0
	cmp.l	(0+l49,a7),d0
	bcc	l43
l42
	moveq	#55,d0
	sub.l	d0,(0+l49,a7)
	bra	l44
l43
	moveq	#48,d0
	sub.l	d0,(0+l49,a7)
l44
l41
	moveq	#15,d0
	cmp.l	(0+l49,a7),d0
	bcc	l46
l45
	move.b	#101,(4+l49,a7)
	move.b	#114,(5+l49,a7)
	move.b	#114,(6+l49,a7)
	move.b	#111,(7+l49,a7)
	move.b	#114,(8+l49,a7)
	move.b	#0,(9+l49,a7)
	lea	(4+l49,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l36
l46
	move.b	(3+l49,a7),d0
l36
l47	reg
l49	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahexlongword
	cnop	0,4
_bin2ahexlongword
	sub.w	#20,a7
	movem.l	l64,-(a7)
	move.l	#4026531840,d0
	and.l	(24+l66,a7),d0
	moveq	#28,d1
	lsr.l	d1,d0
	move.b	d0,(0+l66,a7)
	move.l	#251658240,d0
	and.l	(24+l66,a7),d0
	moveq	#24,d1
	asr.l	d1,d0
	move.b	d0,(1+l66,a7)
	move.l	#15728640,d0
	and.l	(24+l66,a7),d0
	moveq	#20,d1
	asr.l	d1,d0
	move.b	d0,(2+l66,a7)
	move.l	#983040,d0
	and.l	(24+l66,a7),d0
	moveq	#16,d1
	asr.l	d1,d0
	move.b	d0,(3+l66,a7)
	move.l	#61440,d0
	and.l	(24+l66,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(4+l66,a7)
	move.l	#3840,d0
	and.l	(24+l66,a7),d0
	asr.l	#8,d0
	move.b	d0,(5+l66,a7)
	move.l	#240,d0
	and.l	(24+l66,a7),d0
	asr.l	#4,d0
	move.b	d0,(6+l66,a7)
	move.b	(27+l66,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(7+l66,a7)
	move.l	#0,(8+l66,a7)
	bra	l53
l52
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l57
l58
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l57
l56
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l59
l57
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l61
l62
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l61
l60
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l66,a7),a0
	move.w	(10+l66,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l63
l61
	move.b	#101,(12+l66,a7)
	move.b	#114,(13+l66,a7)
	move.b	#114,(14+l66,a7)
	move.b	#111,(15+l66,a7)
	move.b	#114,(16+l66,a7)
	move.b	#0,(17+l66,a7)
	lea	(12+l66,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l50
l63
l59
l55
	addq.l	#1,(8+l66,a7)
l53
	moveq	#8,d0
	cmp.l	(8+l66,a7),d0
	bgt	l52
l54
	lea	(0+l66,a7),a0
	move.l	a0,d0
l50
l64	reg
l66	equ	0
	add.w	#20,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahexword
	cnop	0,4
_bin2ahexword
	sub.w	#16,a7
	movem.l	l81,-(a7)
	and.l	#65535,(20+l83,a7)
	move.l	#61440,d0
	and.l	(20+l83,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l83,a7)
	move.l	#3840,d0
	and.l	(20+l83,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l83,a7)
	move.l	#240,d0
	and.l	(20+l83,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l83,a7)
	move.b	(23+l83,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l83,a7)
	move.l	#0,(4+l83,a7)
	bra	l70
l69
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l74
l75
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l74
l73
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l76
l74
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l78
l79
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l78
l77
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l83,a7),a0
	move.w	(6+l83,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l80
l78
	move.b	#101,(8+l83,a7)
	move.b	#114,(9+l83,a7)
	move.b	#114,(10+l83,a7)
	move.b	#111,(11+l83,a7)
	move.b	#114,(12+l83,a7)
	move.b	#0,(13+l83,a7)
	lea	(8+l83,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l67
l80
l76
l72
	addq.l	#1,(4+l83,a7)
l70
	moveq	#4,d0
	cmp.l	(4+l83,a7),d0
	bgt	l69
l71
	lea	(0+l83,a7),a0
	move.l	a0,d0
l67
l81	reg
l83	equ	0
	add.w	#16,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahexbyte
	cnop	0,4
_bin2ahexbyte
	sub.w	#16,a7
	movem.l	l98,-(a7)
	and.l	#255,(20+l100,a7)
	move.l	#240,d0
	and.l	(20+l100,a7),d0
	asr.l	#4,d0
	move.b	d0,(0+l100,a7)
	move.b	(23+l100,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(1+l100,a7)
	move.l	#0,(4+l100,a7)
	bra	l87
l86
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l91
l92
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l91
l90
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l93
l91
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l95
l96
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l95
l94
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l100,a7),a0
	move.w	(6+l100,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l97
l95
	move.b	#101,(8+l100,a7)
	move.b	#114,(9+l100,a7)
	move.b	#114,(10+l100,a7)
	move.b	#111,(11+l100,a7)
	move.b	#114,(12+l100,a7)
	move.b	#0,(13+l100,a7)
	lea	(8+l100,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l84
l97
l93
l89
	addq.l	#1,(4+l100,a7)
l87
	moveq	#2,d0
	cmp.l	(4+l100,a7),d0
	bgt	l86
l88
	lea	(0+l100,a7),a0
	move.l	a0,d0
l84
l98	reg
l100	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
