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
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l11,-(a7)
	move.b	(11+l13,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l13,a7)
	moveq	#48,d0
	sub.l	d0,(0+l13,a7)
	move.b	(3+l13,a7),d0
l9
l11	reg
l13	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l26,-(a7)
	move.b	(19+l28,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l28,a7)
	moveq	#97,d0
	cmp.l	(0+l28,a7),d0
	bhi	l17
l18
	moveq	#102,d0
	cmp.l	(0+l28,a7),d0
	bcs	l17
l16
	moveq	#87,d0
	sub.l	d0,(0+l28,a7)
	bra	l19
l17
	moveq	#57,d0
	cmp.l	(0+l28,a7),d0
	bcc	l21
l20
	moveq	#55,d0
	sub.l	d0,(0+l28,a7)
	bra	l22
l21
	moveq	#48,d0
	sub.l	d0,(0+l28,a7)
l22
l19
	moveq	#15,d0
	cmp.l	(0+l28,a7),d0
	bcs	l23
l25
	tst.l	(0+l28,a7)
	bcc	l24
l23
	move.b	#101,(4+l28,a7)
	move.b	#114,(5+l28,a7)
	move.b	#114,(6+l28,a7)
	move.b	#111,(7+l28,a7)
	move.b	#114,(8+l28,a7)
	move.b	#0,(9+l28,a7)
	lea	(4+l28,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l14
l24
	move.b	(3+l28,a7),d0
l14
l26	reg
l28	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahex
	cnop	0,4
_bin2ahex
	sub.w	#16,a7
	movem.l	l43,-(a7)
	and.l	#65535,(20+l45,a7)
	move.l	#61440,d0
	and.l	(20+l45,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l45,a7)
	move.l	#3840,d0
	and.l	(20+l45,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l45,a7)
	move.l	#240,d0
	and.l	(20+l45,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l45,a7)
	move.b	(23+l45,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l45,a7)
	move.l	#0,(4+l45,a7)
	bra	l32
l31
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l36
l37
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l36
l35
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l38
l36
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l40
l41
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l40
l39
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l45,a7),a0
	move.w	(6+l45,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l42
l40
	move.b	#101,(8+l45,a7)
	move.b	#114,(9+l45,a7)
	move.b	#114,(10+l45,a7)
	move.b	#111,(11+l45,a7)
	move.b	#114,(12+l45,a7)
	move.b	#0,(13+l45,a7)
	lea	(8+l45,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l29
l42
l38
l34
	addq.l	#1,(4+l45,a7)
l32
	moveq	#4,d0
	cmp.l	(4+l45,a7),d0
	bgt	l31
l33
	lea	(0+l45,a7),a0
	move.l	a0,d0
l29
l43	reg
l45	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
