all: C ass link out
C:
# C file
# compile to assembly
	vbccm68k src/C/test.c  -amiga-softfloat -quiet
# compiler assembly to executable
	vasmm68k_mot src/C/test.asm -Faout -o test.out -quiet
ass:
# assembly file
	vasmm68k_mot src/assembly/data.asm -Faout -o data.out -quiet -spaces -ldots
link:
#linker
	vlink data.out test.out -o test.S68 -fixunnamed -b srec37
out:
#launch easy68k
	test.bat


