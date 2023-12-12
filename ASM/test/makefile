all: C ass link out
C:
# C file
# compile to assembly
	vbccm68k src/assembly/main.c  -amiga-softfloat -quiet
# compile assembly to executable
	vasmm68k_mot src/assembly/main.asm -Faout -o main.out -quiet
ass:
# assembly file
	vasmm68k_mot src/assembly/header.asm -Faout -o header.out -quiet -spaces -ldots
link:
#linker
	vlink header.out main.out -o test.S68 -fixunnamed -b srec37 -T linker.ld
out:
#launch easy68k
	test.bat


