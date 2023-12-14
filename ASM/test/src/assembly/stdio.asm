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
	public	_sprintWord
	cnop	0,4
_sprintWord
	subq.w	#8,a7
	movem.l	l18,-(a7)
	move.l	(12+l20,a7),a0
	move.b	(a0),(0+l20,a7)
	move.l	(12+l20,a7),a0
	move.b	(1,a0),(1+l20,a7)
	move.l	(12+l20,a7),a0
	move.b	(2,a0),(2+l20,a7)
	move.l	(12+l20,a7),a0
	move.b	(3,a0),(3+l20,a7)
	move.b	#13,(4+l20,a7)
	move.b	#10,(5+l20,a7)
	move.b	#0,(6+l20,a7)
	lea	(0+l20,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l16
l18	reg
l20	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintByte
	cnop	0,4
_sprintByte
	subq.w	#8,a7
	movem.l	l23,-(a7)
	move.l	(12+l25,a7),a0
	move.b	(a0),(0+l25,a7)
	move.l	(12+l25,a7),a0
	move.b	(1,a0),(1+l25,a7)
	move.b	#13,(2+l25,a7)
	move.b	#10,(3+l25,a7)
	move.b	#0,(4+l25,a7)
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
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l28,-(a7)
	move.b	(11+l30,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l30,a7)
	moveq	#48,d0
	sub.l	d0,(0+l30,a7)
	move.b	(3+l30,a7),d0
l26
l28	reg
l30	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l42,-(a7)
	move.b	(19+l44,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l44,a7)
	moveq	#97,d0
	cmp.l	(0+l44,a7),d0
	bhi	l34
l35
	moveq	#102,d0
	cmp.l	(0+l44,a7),d0
	bcs	l34
l33
	moveq	#87,d0
	sub.l	d0,(0+l44,a7)
	bra	l36
l34
	moveq	#57,d0
	cmp.l	(0+l44,a7),d0
	bcc	l38
l37
	moveq	#55,d0
	sub.l	d0,(0+l44,a7)
	bra	l39
l38
	moveq	#48,d0
	sub.l	d0,(0+l44,a7)
l39
l36
	moveq	#15,d0
	cmp.l	(0+l44,a7),d0
	bcc	l41
l40
	move.b	#101,(4+l44,a7)
	move.b	#114,(5+l44,a7)
	move.b	#114,(6+l44,a7)
	move.b	#111,(7+l44,a7)
	move.b	#114,(8+l44,a7)
	move.b	#0,(9+l44,a7)
	lea	(4+l44,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l31
l41
	move.b	(3+l44,a7),d0
l31
l42	reg
l44	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahexword
	cnop	0,4
_bin2ahexword
	sub.w	#16,a7
	movem.l	l59,-(a7)
	and.l	#65535,(20+l61,a7)
	move.l	#61440,d0
	and.l	(20+l61,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l61,a7)
	move.l	#3840,d0
	and.l	(20+l61,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l61,a7)
	move.l	#240,d0
	and.l	(20+l61,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l61,a7)
	move.b	(23+l61,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l61,a7)
	move.l	#0,(4+l61,a7)
	bra	l48
l47
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l52
l53
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l52
l51
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l54
l52
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l56
l57
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l56
l55
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l61,a7),a0
	move.w	(6+l61,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l58
l56
	move.b	#101,(8+l61,a7)
	move.b	#114,(9+l61,a7)
	move.b	#114,(10+l61,a7)
	move.b	#111,(11+l61,a7)
	move.b	#114,(12+l61,a7)
	move.b	#0,(13+l61,a7)
	lea	(8+l61,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l45
l58
l54
l50
	addq.l	#1,(4+l61,a7)
l48
	moveq	#4,d0
	cmp.l	(4+l61,a7),d0
	bgt	l47
l49
	lea	(0+l61,a7),a0
	move.l	a0,d0
l45
l59	reg
l61	equ	0
	add.w	#16,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahexbyte
	cnop	0,4
_bin2ahexbyte
	sub.w	#16,a7
	movem.l	l76,-(a7)
	and.l	#255,(20+l78,a7)
	move.l	#240,d0
	and.l	(20+l78,a7),d0
	asr.l	#4,d0
	move.b	d0,(0+l78,a7)
	move.b	(23+l78,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(1+l78,a7)
	move.l	#0,(4+l78,a7)
	bra	l65
l64
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l69
l70
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l69
l68
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l71
l69
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l73
l74
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l73
l72
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l78,a7),a0
	move.w	(6+l78,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l75
l73
	move.b	#101,(8+l78,a7)
	move.b	#114,(9+l78,a7)
	move.b	#114,(10+l78,a7)
	move.b	#111,(11+l78,a7)
	move.b	#114,(12+l78,a7)
	move.b	#0,(13+l78,a7)
	lea	(8+l78,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l62
l75
l71
l67
	addq.l	#1,(4+l78,a7)
l65
	moveq	#2,d0
	cmp.l	(4+l78,a7),d0
	bgt	l64
l66
	lea	(0+l78,a7),a0
	move.l	a0,d0
l62
l76	reg
l78	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
