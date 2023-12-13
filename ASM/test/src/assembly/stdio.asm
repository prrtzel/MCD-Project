	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#72,a7
	movem.l	l13,-(a7)
	move.b	#10,(0+l15,a7)
	move.b	#13,(1+l15,a7)
	move.b	#0,(2+l15,a7)
	move.b	#0,(3+l15,a7)
	move.b	#32,(4+l15,a7)
	move.b	#8,(5+l15,a7)
	move.b	#0,(6+l15,a7)
	move.b	#0,(7+l15,a7)
	move.b	#1,(8+l15,a7)
	move.l	#0,(60+l15,a7)
	move.l	#0,(64+l15,a7)
	bra	l4
l3
	lea	(9+l15,a7),a0
	move.w	(66+l15,a7),d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
l6
	addq.l	#1,(64+l15,a7)
l4
	moveq	#50,d0
	cmp.l	(64+l15,a7),d0
	bgt	l3
l5
	move.l	#0,(64+l15,a7)
	move.l	#0,(68+l15,a7)
	bra	l8
l7
	jsr	_sgetChar
	move.b	d0,(8+l15,a7)
	cmp.b	#8,(8+l15,a7)
	bne	l11
l10
	subq.l	#1,(64+l15,a7)
	lea	(9+l15,a7),a0
	move.w	(66+l15,a7),d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
	lea	(4+l15,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
	bra	l12
l11
	lea	(9+l15,a7),a0
	move.w	(66+l15,a7),d0
	and.l	#65535,d0
	move.b	(8+l15,a7),(0,a0,d0.l)
	addq.l	#1,(64+l15,a7)
l12
l8
	cmp.b	#13,(8+l15,a7)
	bne	l7
l9
	lea	(0+l15,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	lea	(13+l15,a7),a0
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
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l23,-(a7)
	move.b	(11+l25,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l25,a7)
	moveq	#48,d0
	sub.l	d0,(0+l25,a7)
	move.b	(3+l25,a7),d0
l21
l23	reg
l25	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l37,-(a7)
	move.b	(19+l39,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l39,a7)
	moveq	#97,d0
	cmp.l	(0+l39,a7),d0
	bhi	l29
l30
	moveq	#102,d0
	cmp.l	(0+l39,a7),d0
	bcs	l29
l28
	moveq	#87,d0
	sub.l	d0,(0+l39,a7)
	bra	l31
l29
	moveq	#57,d0
	cmp.l	(0+l39,a7),d0
	bcc	l33
l32
	moveq	#55,d0
	sub.l	d0,(0+l39,a7)
	bra	l34
l33
	moveq	#48,d0
	sub.l	d0,(0+l39,a7)
l34
l31
	moveq	#15,d0
	cmp.l	(0+l39,a7),d0
	bcc	l36
l35
	move.b	#101,(4+l39,a7)
	move.b	#114,(5+l39,a7)
	move.b	#114,(6+l39,a7)
	move.b	#111,(7+l39,a7)
	move.b	#114,(8+l39,a7)
	move.b	#0,(9+l39,a7)
	lea	(4+l39,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l26
l36
	move.b	(3+l39,a7),d0
l26
l37	reg
l39	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahex
	cnop	0,4
_bin2ahex
	sub.w	#16,a7
	movem.l	l54,-(a7)
	and.l	#65535,(20+l56,a7)
	move.l	#61440,d0
	and.l	(20+l56,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l56,a7)
	move.l	#3840,d0
	and.l	(20+l56,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l56,a7)
	move.l	#240,d0
	and.l	(20+l56,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l56,a7)
	move.b	(23+l56,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l56,a7)
	move.l	#0,(4+l56,a7)
	bra	l43
l42
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l47
l48
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l47
l46
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l49
l47
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l51
l52
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l51
l50
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l56,a7),a0
	move.w	(6+l56,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l53
l51
	move.b	#101,(8+l56,a7)
	move.b	#114,(9+l56,a7)
	move.b	#114,(10+l56,a7)
	move.b	#111,(11+l56,a7)
	move.b	#114,(12+l56,a7)
	move.b	#0,(13+l56,a7)
	lea	(8+l56,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l40
l53
l49
l45
	addq.l	#1,(4+l56,a7)
l43
	moveq	#4,d0
	cmp.l	(4+l56,a7),d0
	bgt	l42
l44
	lea	(0+l56,a7),a0
	move.l	a0,d0
l40
l54	reg
l56	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
