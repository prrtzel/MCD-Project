/*Code that runs on reset*/

.global start
.global endloop

start:

	/* set stack pointer */
	move.l		#__stack, %a7  

	/* jump to main function */
	jsr			__main

	/* endless loop for unused vectors */
endloop:
	bra.b		endloop
