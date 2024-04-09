SRC_DIR := src/

LINKER := etc/linker

FILES := main test

ASM_FILES := crt0 vector

OUTPUT_FILES := $(foreach file, $(FILES), $(file).o) $(foreach file, $(ASM_FILES), $(file).o)

CMD_SEPERATOR := &


all: gcc asm link clean
gcc:
	$(foreach file, $(FILES), m68k-coff-gcc -Wall -g src/$(file).c -c -m68000 -o $(file).o $(CMD_SEPERATOR))
asm:
	$(foreach file, $(ASM_FILES), m68k-coff-as -g src/$(file).s -m68000 -o $(file).o $(CMD_SEPERATOR))
link:
	m68k-coff-ld -o test.S68 -T $(LINKER).ld $(OUTPUT_FILES) -mm68kcoff
clean:
	$(foreach file, $(FILES), rm $(file).o $(CMD_SEPERATOR))
	$(foreach file, $(ASM_FILES), rm $(file).o $(CMD_SEPERATOR))
run: 
	test.bat
