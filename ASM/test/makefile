linker := etc\linker.ld
all: C mv ass link clean out
C:
# compile to assembly for readability
	vbccm68k src/C/main.c -amiga-softfloat -quiet
	vbccm68k src/C/stdio.c -amiga-softfloat -quiet
	vbccm68k src/C/morg.c -amiga-softfloat -quiet
mv:
# move file into assembly folder because -o does not work
	move src\C\main.asm src\assembly
	move src\C\stdio.asm src\assembly
	move src\C\morg.asm src\assembly
	
ass:
# compile assembly to executable
	vasmm68k_mot src/assembly/main.asm -Faout -o main.out -quiet
	vasmm68k_mot src/assembly/stdio.asm -Faout -o stdio.out -quiet
	vasmm68k_mot src/assembly/morg.asm -Faout -o morg.out -quiet

# assembly file
	vasmm68k_mot src/assembly/header.asm -Faout -o header.out -quiet -spaces -ldots
link:
#linker
#	vlink main.out header.out -o test.S68 -fixunnamed -b srec37 -T $(linker)
	vlink main.out header.out stdio.out morg.out -o test.S68 -fixunnamed -b srec37 -T $(linker)	
clean:
	del /f main.out
	del /f header.out
	del /f stdio.out
	del /f morg.out
out:
#launch easy68k
	etc/test.bat



