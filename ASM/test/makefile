# make command: mingw32-make


linker := etc/linker.ld
all: C mv asm link clean out
C:
# compile to assembly for readability
	vbccm68k src/C/main.c -amiga-softfloat
	vbccm68k src/C/stdio.c -amiga-softfloat -quiet
	vbccm68k src/C/morg.c -amiga-softfloat -quiet
	vbccm68k src/C/startup.c -amiga-softfloat -quiet
mv:
# move file into assembly folder because -o does not work
	move src\C\main.asm src\asm
	move src\C\stdio.asm src\asm
	move src\C\morg.asm src\asm
	move src\C\startup.asm src\asm
	
asm:
# compile assembly to executable
	vasmm68k_mot src/asm/main.asm -Faout -o main.out -quiet
	vasmm68k_mot src/asm/stdio.asm -Faout -o stdio.out -quiet
	vasmm68k_mot src/asm/morg.asm -Faout -o morg.out -quiet
	vasmm68k_mot src/asm/startup.asm -Faout -o startup.out -quiet

# assembly file
	vasmm68k_mot src/asm/header.asm -Faout -o header.out -quiet -spaces -ldots
link:
#linker
#	vlink main.out header.out -o test.S68 -fixunnamed -b srec37 -T $(linker)
	vlink startup.out main.out header.out stdio.out morg.out -o test.S68 -fixunnamed -b srec37 -T $(linker)	
clean:
	del /f startup.out
	del /f main.out
	del /f header.out
	del /f stdio.out
	del /f morg.out
out:
#launch easy68k
	etc/test.bat



