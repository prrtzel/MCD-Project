/*vector table, unused vectors go to endloop in crt0*/
__vectors:
	dc.l __stack, start, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	