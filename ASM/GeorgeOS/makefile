all: test
test:
#m68k-coff-as crt0.s -o crt0.o -m68000	
	m68k-coff-gcc main.c -c -m68000 
	m68k-coff-ld -T linker main.o


clean: 
	rm crt0.o
	rm main.o