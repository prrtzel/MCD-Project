	idnt	"src/C/morg.c"
	opt o+,ol+,op+,oc+,ot+,oj+,ob+,om+
	section	"CODE",code
	public	_printMemory
	cnop	0,4
_printMemory
	movem.l	l3,-(a7)
	move.l	(4+l5,a7),-(a7)
	jsr	_sprint
	addq.w	#4,a7
l1
l3	reg
l5	equ	0
	rts
	public	_string
	section	"DATA",data
	cnop	0,4
_string
	dc.b	104
	dc.b	111
	dc.b	108
	dc.b	97
	dc.b	0
	public	_include
	section	"BSS",bss
	cnop	0,4
_include
	ds.b	4
	public	_sprint
