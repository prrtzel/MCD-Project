LINKER := etc\linker.ld

C_FILES := main startup stdio
ASM_FILES := main startup stdio asmFunctions
OUTPUT_FILES := main.out startup.out stdio.out asmFunctions.out

CMD_SEPERATOR := &

all: C_ASM MOVE ASM_SREC LINK CLEAN EASY68K

C_ASM:
	$(foreach c_file, $(C_FILES), vbccm68k src\C\$(c_file).c -amiga-softfloat -quiet -no-fp-return -cpu=68000 -no-inline-peephole$(CMD_SEPERATOR))

MOVE:
# move file into assembly folder because -o does not work
	$(foreach asm_C_file, $(C_FILES), move src\C\$(asm_C_file).asm src\ASM $(CMD_SEPERATOR))

ASM_SREC:
# compile assembly to executable
	$(foreach asm_file, $(ASM_FILES), vasmm68k_mot src\ASM\$(asm_file).asm -Faout -o $(asm_file).out -quiet -spaces -ldots $(CMD_SEPERATOR))


LINK:
#srec37
#elf32m68k
	vlink $(OUTPUT_FILES) -o GeorgeOS.S68 -fixunnamed -b srec28 -T $(LINKER)
	vlink $(OUTPUT_FILES) -o GeorgeOS.elf -fixunnamed -b elf32m68k -T $(LINKER)	

CLEAN:
	$(foreach outFile, $(ASM_FILES), del /f $(outFile).out $(CMD_SEPERATOR))

EASY68K:
	etc\GeorgeOS_Sim.bat