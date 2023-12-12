	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#60,a7
	movem.l	l6,-(a7)
	move.l	#0,(52+l8,a7)
	bra	l4
l3
	move.b	(0+l8,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(56+l8,a7)
	jsr	_sgetChar
	move.b	d0,(0+l8,a7)
	lea	(1+l8,a7),a0
	move.w	(54+l8,a7),d0
	and.l	#65535,d0
	move.b	(0+l8,a7),(0,a0,d0.l)
	addq.l	#1,(52+l8,a7)
l4
	tst.b	(0+l8,a7)
	bne	l3
l5
	lea	(1+l8,a7),a0
	move.l	a0,d0
l1
l6	reg
l8	equ	0
	add.w	#60,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintWord
	cnop	0,4
_sprintWord
	subq.w	#8,a7
	movem.l	l11,-(a7)
	move.l	(12+l13,a7),a0
	move.b	(a0),(0+l13,a7)
	move.l	(12+l13,a7),a0
	move.b	(1,a0),(1+l13,a7)
	move.l	(12+l13,a7),a0
	move.b	(2,a0),(2+l13,a7)
	move.l	(12+l13,a7),a0
	move.b	(3,a0),(3+l13,a7)
	move.b	#0,(4+l13,a7)
	lea	(0+l13,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l9
l11	reg
l13	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l16,-(a7)
	move.b	(11+l18,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l18,a7)
	moveq	#48,d0
	sub.l	d0,(0+l18,a7)
	move.b	(3+l18,a7),d0
l14
l16	reg
l18	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l31,-(a7)
	move.b	(19+l33,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l33,a7)
	moveq	#97,d0
	cmp.l	(0+l33,a7),d0
	bhi	l22
l23
	moveq	#102,d0
	cmp.l	(0+l33,a7),d0
	bcs	l22
l21
	moveq	#87,d0
	sub.l	d0,(0+l33,a7)
	bra	l24
l22
	moveq	#57,d0
	cmp.l	(0+l33,a7),d0
	bcc	l26
l25
	moveq	#55,d0
	sub.l	d0,(0+l33,a7)
	bra	l27
l26
	moveq	#48,d0
	sub.l	d0,(0+l33,a7)
l27
l24
	moveq	#15,d0
	cmp.l	(0+l33,a7),d0
	bcs	l28
l30
	tst.l	(0+l33,a7)
	bcc	l29
l28
	move.b	#101,(4+l33,a7)
	move.b	#114,(5+l33,a7)
	move.b	#114,(6+l33,a7)
	move.b	#111,(7+l33,a7)
	move.b	#114,(8+l33,a7)
	move.b	#0,(9+l33,a7)
	lea	(4+l33,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l19
l29
	move.b	(3+l33,a7),d0
l19
l31	reg
l33	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahex
	cnop	0,4
_bin2ahex
	sub.w	#16,a7
	movem.l	l48,-(a7)
	and.l	#65535,(20+l50,a7)
	move.l	#61440,d0
	and.l	(20+l50,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l50,a7)
	move.l	#3840,d0
	and.l	(20+l50,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l50,a7)
	move.l	#240,d0
	and.l	(20+l50,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l50,a7)
	move.b	(23+l50,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l50,a7)
	move.l	#0,(4+l50,a7)
	bra	l37
l36
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l41
l42
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l41
l40
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l43
l41
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l45
l46
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l45
l44
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l50,a7),a0
	move.w	(6+l50,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l47
l45
	move.b	#101,(8+l50,a7)
	move.b	#114,(9+l50,a7)
	move.b	#114,(10+l50,a7)
	move.b	#111,(11+l50,a7)
	move.b	#114,(12+l50,a7)
	move.b	#0,(13+l50,a7)
	lea	(8+l50,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l34
l47
l43
l39
	addq.l	#1,(4+l50,a7)
l37
	moveq	#4,d0
	cmp.l	(4+l50,a7),d0
	bgt	l36
l38
	lea	(0+l50,a7),a0
	move.l	a0,d0
l34
l48	reg
l50	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
