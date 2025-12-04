# Makefile for building the kernel

CC = gcc
AS = as
LD = ld
CFLAGS = -m32 -ffreestanding -nostdlib -nostartfiles
ASFLAGS = --32
LDFLAGS = -m elf_i386 -T linker.ld

OBJ = boot.o kernel.o

kernel.elf: $(OBJ)
	$(LD) $(LDFLAGS) -o $@ $^

boot.o: boot.s
	$(AS) $(ASFLAGS) -o $@ $<

kernel.o: kernel.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f *.o kernel.elf

run: kernel.elf
	qemu-system-i386 -kernel kernel.elf