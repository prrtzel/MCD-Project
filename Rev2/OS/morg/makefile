# George Yacoubian
# MCD Rev 3

LINKER := etc/linker.ld
FILES := crt0 main morgio conversions morg
OUTPUT_FILES := $(foreach file, $(FILES), $(file).o)
CMD_SEPERATOR := &


all: gcc link clean done
gcc:
	$(foreach file, $(FILES), m68k-coff-gcc -Wall -g src/$(file).c -c -m68000 -o $(file).o $(CMD_SEPERATOR))
link:
	m68k-coff-ld -o morg.S68 -T $(LINKER) $(OUTPUT_FILES) -mm68kcoff
clean:
	$(foreach file, $(FILES), rm $(file).o $(CMD_SEPERATOR))
done:
	echo "ALL DONE :)"
run: 
	cd bat && cmd.exe /c morg.bat
morgbin:
	cd bat && cmd.exe /c master.bat
