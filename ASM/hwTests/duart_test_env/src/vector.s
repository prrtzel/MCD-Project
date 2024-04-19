/*vector table, unused vectors go to endloop in crt0*/
__vectors:
	dc.l __stack
	dc.l start
	