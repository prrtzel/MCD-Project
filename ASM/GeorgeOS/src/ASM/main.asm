	idnt	"src\C\main.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_main
	cnop	0,4
_main
	movem.l	l4,-(a7)
	move.l	_h,-(a7)
	jsr	_sprint
	moveq	#0,d0
	addq.w	#4,a7
l2
l4	reg
l6	equ	0
	rts
	public	_h
	section	"DATA",data
	cnop	0,4
_h
	dc.l	l1
	public	_sprint
	section	"CODE",code
	cnop	0,4
l1
	dc.b	104
	dc.b	101
	dc.b	108
	dc.b	108
	dc.b	111
	dc.b	33
	dc.b	0
