build:
	mkdir build
	nasm -f elf64 -o build/main.o src/main.asm
	ld -o build/main build/main.o

clean:
	rm -rf ./build/