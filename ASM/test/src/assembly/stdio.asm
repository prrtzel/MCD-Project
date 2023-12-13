	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#60,a7
	movem.l	l10,-(a7)
	move.b	#1,(0+l12,a7)
	move.l	#0,(52+l12,a7)
	move.l	#0,(56+l12,a7)
	bra	l4
l3
	lea	(1+l12,a7),a0
	move.w	(58+l12,a7),d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
l6
	addq.l	#1,(56+l12,a7)
l4
	moveq	#50,d0
	cmp.l	(56+l12,a7),d0
	bgt	l3
l5
	bra	l8
l7
	jsr	_sgetChar
	move.b	d0,(0+l12,a7)
	move.b	(0+l12,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(56+l12,a7)
	lea	(1+l12,a7),a0
	move.w	(54+l12,a7),d0
	and.l	#65535,d0
	move.b	(0+l12,a7),(0,a0,d0.l)
	addq.l	#1,(52+l12,a7)
l8
	tst.b	(0+l12,a7)
	bne	l7
l9
	lea	(1+l12,a7),a0
	move.l	a0,d0
l1
l10	reg
l12	equ	0
	add.w	#60,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintWord
	cnop	0,4
_sprintWord
	subq.w	#8,a7
	movem.l	l15,-(a7)
	move.l	(12+l17,a7),a0
	move.b	(a0),(0+l17,a7)
	move.l	(12+l17,a7),a0
	move.b	(1,a0),(1+l17,a7)
	move.l	(12+l17,a7),a0
	move.b	(2,a0),(2+l17,a7)
	move.l	(12+l17,a7),a0
	move.b	(3,a0),(3+l17,a7)
	move.b	#0,(4+l17,a7)
	lea	(0+l17,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l13
l15	reg
l17	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l20,-(a7)
	move.b	(11+l22,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l22,a7)
	moveq	#48,d0
	sub.l	d0,(0+l22,a7)
	move.b	(3+l22,a7),d0
l18
l20	reg
l22	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l35,-(a7)
	move.b	(19+l37,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l37,a7)
	moveq	#97,d0
	cmp.l	(0+l37,a7),d0
	bhi	l26
l27
	moveq	#102,d0
	cmp.l	(0+l37,a7),d0
	bcs	l26
l25
	moveq	#87,d0
	sub.l	d0,(0+l37,a7)
	bra	l28
l26
	moveq	#57,d0
	cmp.l	(0+l37,a7),d0
	bcc	l30
l29
	moveq	#55,d0
	sub.l	d0,(0+l37,a7)
	bra	l31
l30
	moveq	#48,d0
	sub.l	d0,(0+l37,a7)
l31
l28
	moveq	#15,d0
	cmp.l	(0+l37,a7),d0
	bcs	l32
l34
	tst.l	(0+l37,a7)
	bcc	l33
l32
	move.b	#101,(4+l37,a7)
	move.b	#114,(5+l37,a7)
	move.b	#114,(6+l37,a7)
	move.b	#111,(7+l37,a7)
	move.b	#114,(8+l37,a7)
	move.b	#0,(9+l37,a7)
	lea	(4+l37,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l23
l33
	move.b	(3+l37,a7),d0
l23
l35	reg
l37	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahex
	cnop	0,4
_bin2ahex
	sub.w	#16,a7
	movem.l	l52,-(a7)
	and.l	#65535,(20+l54,a7)
	move.l	#61440,d0
	and.l	(20+l54,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l54,a7)
	move.l	#3840,d0
	and.l	(20+l54,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l54,a7)
	move.l	#240,d0
	and.l	(20+l54,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l54,a7)
	move.b	(23+l54,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l54,a7)
	move.l	#0,(4+l54,a7)
	bra	l41
l40
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l45
l46
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l45
l44
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l47
l45
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l49
l50
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l49
l48
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l54,a7),a0
	move.w	(6+l54,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l51
l49
	move.b	#101,(8+l54,a7)
	move.b	#114,(9+l54,a7)
	move.b	#114,(10+l54,a7)
	move.b	#111,(11+l54,a7)
	move.b	#114,(12+l54,a7)
	move.b	#0,(13+l54,a7)
	lea	(8+l54,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l38
l51
l47
l43
	addq.l	#1,(4+l54,a7)
l41
	moveq	#4,d0
	cmp.l	(4+l54,a7),d0
	bgt	l40
l42
	lea	(0+l54,a7),a0
	move.l	a0,d0
l38
l52	reg
l54	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
