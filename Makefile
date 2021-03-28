all: hello.efi

%.o: %.c
	clang -target x86_64-pc-win32-coff -mno-red-zone -fno-stack-protector -fshort-wchar -Wall -o $@ -c $<

%.efi: %.o
	lld-link /subsystem:efi_application /entry:EfiMain /out:$@ $<

.PHONY: run
run: 
	$(HOME)/osbook/devenv/run_qemu.sh $(HOME)/edk2/Build/MikanLoaderX64/DEBUG_CLANG38/X64/Loader.efi

clean:
	rm -f hello.efi
	rm -f hello.o
	rm -f disk.img
	rm -rf mnt