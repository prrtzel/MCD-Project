
all:
	m68k-coff-gcc -Wall -g srec.c -c -m68000 -o srec.o
	m68k-coff-ld -o SREC.S68 -T linker.ld srec.o -mm68kcoff