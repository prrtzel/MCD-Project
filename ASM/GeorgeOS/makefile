SRC_DIR := src/

LINKER := etc/linker

FILES := main stdio conversions morg

OUTPUT_FILES := $(foreach file, $(FILES), $(file).o)

CMD_SEPERATOR := &


all: gcc link clean
gcc:
	$(foreach file, $(FILES), m68k-coff-gcc -Wall -g src/$(file).c -c -m68000 -o $(file).o $(CMD_SEPERATOR))
link:
	m68k-coff-ld -o GeorgeOS.S68 -T $(LINKER) $(OUTPUT_FILES) -mm68kcoff
clean:
	$(foreach file, $(FILES), rm $(file).o $(CMD_SEPERATOR))
run: 
	GeorgeOS_Sim.bat
