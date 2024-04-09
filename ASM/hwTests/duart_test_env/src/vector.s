/* vector.S - initial vector table
 *
 * use start as reset PC value, __stack as reset SP value
 * all other vecs (2 - 63) go to endloop
 */

__vectors:
	dc.l __stack, start, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
	dc.l endloop, endloop, endloop, endloop, endloop, endloop, endloop, endloop
