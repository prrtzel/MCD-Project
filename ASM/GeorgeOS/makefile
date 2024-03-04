all: gcc link clean
gcc:
	m68k-coff-gcc -Wall -g main.c -c -m68000 -o main.o
link:
	m68k-coff-ld -o main.S68 -T linker main.o -mm68kcoff
run: 
	GeorgeOS_Sim.bat
clean:
	rm main.o
