/* crt0.S
 *
 * This is the startup code that runs out of reset.
 */

.global start
.global endloop

start:

	/* init stack pointer */
	move.l		#__stack, %a7  
	jsr			__main

	/* endless loop if exec() returns */
endloop:
	bra.b		endloop
