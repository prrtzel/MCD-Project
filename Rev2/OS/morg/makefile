# George Yacoubian
# Test project for MCD Rev 2

LINKER := etc/linker.ld
FILES := startup
OUTPUT_FILES := $(foreach file, $(FILES), $(file).o)
CMD_SEPERATOR := &


all: gcc link clean
gcc:
	$(foreach file, $(FILES), m68k-coff-gcc -Wall -g src/$(file).c -c -m68000 -o $(file).o $(CMD_SEPERATOR))
link:
	m68k-coff-ld -o morg.S68 -T $(LINKER) $(OUTPUT_FILES) -mm68kcoff
clean:
	$(foreach file, $(FILES), rm $(file).o $(CMD_SEPERATOR))
run: 
	morg.bat
