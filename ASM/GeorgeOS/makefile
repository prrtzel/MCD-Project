C_DIR := src\C
ASM_DIR := src\ASM

LINKER := etc\linker.ld

FILES := main startup

CMD_SEPERATOR := &

all: C_ASM MOVE ASM_SREC LINK CLEAN

C_ASM:
	$(foreach c_file, $(FILES), vbccm68k src\C\$(c_file).c -amiga-softfloat -quiet $(CMD_SEPERATOR))

MOVE:
# move file into assembly folder because -o does not work
	$(foreach asm_C_file, $(FILES), move src\C\$(asm_C_file).asm src\ASM $(CMD_SEPERATOR))

ASM_SREC:
# compile assembly to executable
	$(foreach asm_file, $(ASM_FILES), )

# vasmm68k_mot $(MAIN_ASM) -Faout -o main.out -quiet
# vasmm68k_mot $(STARTUP_ASM) -Faout -o startup.out -quiet

LINK:
	vlink $(OUTPUT_FILES) -o GeorgeOS.S68 -fixunnamed -b srec37 -T $(LINKER)	

CLEAN:
	del /f $(OUTPUT_FILES)