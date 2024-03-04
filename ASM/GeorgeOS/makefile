SRC_DIR := src/

LINKER := etc/linker

FILES := main stdio

CMD_SEPERATOR := &


all: gcc link
gcc:
	$(foreach file, $(FILES), m68k-coff-gcc -Wall -g src/$(file).c -c -m68000 -o $(file).o $(CMD_SEPERATOR))
link:
	m68k-coff-ld -o GeorgeOS.S68 -T $(LINKER) main.o stdio.o -mm68kcoff
clean:
	rm $(foreach file, $(FILES), rm $(file).o)
run: 
	GeorgeOS_Sim.bat
