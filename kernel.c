// Minimal kernel with VGA text output and Multiboot header for QEMU compatibility

#define VGA_ADDRESS 0xB8000
#define VGA_WIDTH 80
#define VGA_HEIGHT 25

// Multiboot header (required for QEMU to boot uncompressed ELF)
__attribute__((section(".multiboot")))
const unsigned long multiboot_header[] = {
    0x1BADB002,  // Multiboot magic number
    0x00000000,  // Flags (no additional requirements)
    0xE4524FFE   // Checksum
};

void print(const char* str, int row, int col) {
    volatile unsigned short* video = (unsigned short*)VGA_ADDRESS;
    video += row * VGA_WIDTH + col;
    while (*str) {
        *video++ = (*str++ | (0x0F << 8));  // White text on black background
    }
}

void kernel_main() {
    print("Minimal Kernel Initialized! v0.0.1", 12, 27);
    // Infinite loop to keep the kernel running
    while (1) {
	}
}
