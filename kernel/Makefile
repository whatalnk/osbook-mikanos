all: kernel.elf

main.o: main.cpp
	clang++ -O2 -Wall -g --target=x86_64-elf -ffreestanding -mno-red-zone -fno-exceptions -fno-rtti -std=c++17 -c $<

kernel.elf: main.o
	ld.lld --entry KernelMain -z norelro --image-base 0x100000 --static -o $@ $<

clean: 
	rm -f main.o
	rm -f kernel.elf
