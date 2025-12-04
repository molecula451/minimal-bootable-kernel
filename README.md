# Minimal C Kernel

This is a minimal kernel written in C that can be compiled and run on QEMU. It demonstrates basic kernel initialization and VGA text output.

## Prerequisites

- GCC (with 32-bit support)
- GNU Binutils (ld, as)
- QEMU (qemu-system-i386)

On Ubuntu/Debian, install with:
```
sudo apt-get update
sudo apt-get install gcc binutils qemu-system-x86
```

## Compilation

1. Clone or download the files: `kernel.c`, `boot.s`, `linker.ld`, and `Makefile`.
2. Run `make` to build the kernel ELF binary (`kernel.elf`).

The Makefile handles compiling the assembly and C code, then linking them into an ELF executable.

## Running with QEMU

To run the kernel in QEMU:
```
make run
```
Or manually:
```
qemu-system-i386 -kernel kernel.elf
```

You should see the message "Hello, Kernel Initialized!" displayed on the screen, indicating the kernel has booted successfully.

## What It Does

- The `boot.s` assembly code sets up the stack and jumps to `kernel_main` in C.
- `kernel_main` prints a message to the VGA text buffer at address 0xB8000.
- The kernel then enters an infinite loop.

This is a very basic example. For more advanced features, consider adding interrupts, memory management, etc.