	idnt	"src/C/stdio.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_sgetStr
	cnop	0,4
_sgetStr
	sub.w	#64,a7
	movem.l	l12,-(a7)
	move.b	#32,(0+l14,a7)
	move.b	#8,(1+l14,a7)
	move.b	#0,(2+l14,a7)
	move.b	#0,(3+l14,a7)
	move.b	#1,(4+l14,a7)
	move.l	#0,(56+l14,a7)
	move.l	#0,(60+l14,a7)
	bra	l4
l3
	lea	(5+l14,a7),a0
	move.w	(62+l14,a7),d0
	and.l	#65535,d0
	move.b	#0,(0,a0,d0.l)
l6
	addq.l	#1,(60+l14,a7)
l4
	moveq	#50,d0
	cmp.l	(60+l14,a7),d0
	bgt	l3
l5
	bra	l8
l7
	jsr	_sgetChar
	move.b	d0,(4+l14,a7)
	cmp.b	#8,(4+l14,a7)
	bne	l11
l10
	lea	(0+l14,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l11
	lea	(5+l14,a7),a0
	move.w	(58+l14,a7),d0
	and.l	#65535,d0
	move.b	(4+l14,a7),(0,a0,d0.l)
	addq.l	#1,(56+l14,a7)
l8
	tst.b	(4+l14,a7)
	bne	l7
l9
	lea	(5+l14,a7),a0
	move.l	a0,d0
l1
l12	reg
l14	equ	0
	add.w	#64,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_sprintWord
	cnop	0,4
_sprintWord
	subq.w	#8,a7
	movem.l	l17,-(a7)
	move.l	(12+l19,a7),a0
	move.b	(a0),(0+l19,a7)
	move.l	(12+l19,a7),a0
	move.b	(1,a0),(1+l19,a7)
	move.l	(12+l19,a7),a0
	move.b	(2,a0),(2+l19,a7)
	move.l	(12+l19,a7),a0
	move.b	(3,a0),(3+l19,a7)
	move.b	#0,(4+l19,a7)
	lea	(0+l19,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	addq.w	#4,a7
l15
l17	reg
l19	equ	0
	addq.w	#8,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_adec2bin
	cnop	0,4
_adec2bin
	subq.w	#4,a7
	movem.l	l22,-(a7)
	move.b	(11+l24,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l24,a7)
	moveq	#48,d0
	sub.l	d0,(0+l24,a7)
	move.b	(3+l24,a7),d0
l20
l22	reg
l24	equ	0
	addq.w	#4,a7
	rts
; stacksize=4
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_ahex2bin
	cnop	0,4
_ahex2bin
	sub.w	#12,a7
	movem.l	l36,-(a7)
	move.b	(19+l38,a7),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,(0+l38,a7)
	moveq	#97,d0
	cmp.l	(0+l38,a7),d0
	bhi	l28
l29
	moveq	#102,d0
	cmp.l	(0+l38,a7),d0
	bcs	l28
l27
	moveq	#87,d0
	sub.l	d0,(0+l38,a7)
	bra	l30
l28
	moveq	#57,d0
	cmp.l	(0+l38,a7),d0
	bcc	l32
l31
	moveq	#55,d0
	sub.l	d0,(0+l38,a7)
	bra	l33
l32
	moveq	#48,d0
	sub.l	d0,(0+l38,a7)
l33
l30
	moveq	#15,d0
	cmp.l	(0+l38,a7),d0
	bcc	l35
l34
	move.b	#101,(4+l38,a7)
	move.b	#114,(5+l38,a7)
	move.b	#114,(6+l38,a7)
	move.b	#111,(7+l38,a7)
	move.b	#114,(8+l38,a7)
	move.b	#0,(9+l38,a7)
	lea	(4+l38,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l25
l35
	move.b	(3+l38,a7),d0
l25
l36	reg
l38	equ	0
	add.w	#12,a7
	rts
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	public	_bin2ahex
	cnop	0,4
_bin2ahex
	sub.w	#16,a7
	movem.l	l53,-(a7)
	and.l	#65535,(20+l55,a7)
	move.l	#61440,d0
	and.l	(20+l55,a7),d0
	moveq	#12,d1
	asr.l	d1,d0
	move.b	d0,(0+l55,a7)
	move.l	#3840,d0
	and.l	(20+l55,a7),d0
	asr.l	#8,d0
	move.b	d0,(1+l55,a7)
	move.l	#240,d0
	and.l	(20+l55,a7),d0
	asr.l	#4,d0
	move.b	d0,(2+l55,a7)
	move.b	(23+l55,a7),d0
	moveq	#15,d1
	and.b	d0,d1
	move.b	d1,(3+l55,a7)
	move.l	#0,(4+l55,a7)
	bra	l42
l41
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	cmp.b	#9,(0,a0,d0.l)
	bgt	l46
l47
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	tst.b	(0,a0,d0.l)
	blt	l46
l45
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#48,d0
	or.b	(a0),d0
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l48
l46
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	cmp.b	#15,(0,a0,d0.l)
	bgt	l50
l51
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	cmp.b	#10,(0,a0,d0.l)
	blt	l50
l49
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	move.b	(a0),d0
	sub.b	#9,d0
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d0
	and.l	#65535,d0
	add.l	d0,a0
	moveq	#64,d0
	or.b	(a0),d0
	lea	(0+l55,a7),a0
	move.w	(6+l55,a7),d1
	and.l	#65535,d1
	move.b	d0,(0,a0,d1.l)
	bra	l52
l50
	move.b	#101,(8+l55,a7)
	move.b	#114,(9+l55,a7)
	move.b	#114,(10+l55,a7)
	move.b	#111,(11+l55,a7)
	move.b	#114,(12+l55,a7)
	move.b	#0,(13+l55,a7)
	lea	(8+l55,a7),a0
	move.l	a0,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
	bra	l39
l52
l48
l44
	addq.l	#1,(4+l55,a7)
l42
	moveq	#4,d0
	cmp.l	(4+l55,a7),d0
	bgt	l41
l43
	lea	(0+l55,a7),a0
	move.l	a0,d0
l39
l53	reg
l55	equ	0
	add.w	#16,a7
	rts
	public	_sprint
	public	_sgetChar
