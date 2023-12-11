all: C ass link out
C:
# C file
# compile to assembly
	vbccm68k src/C/test.c  -amiga-softfloat
# compiler assembly to executable
	vasmm68k_mot src/C/test.asm -Fsrec -o test.S68 -s19
ass:
# assembly file
	vasmm68k_mot src/assembly/data.asm -Fsrec -o data.S68 -s19 -spaces -ldots
link:
#linker
	vlink test.S68 data.S68 -o prog.S68 -fixunnamed
out:
#launch easy68k
	test.bat


