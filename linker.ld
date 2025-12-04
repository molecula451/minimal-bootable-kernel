/* Linker script for kernel */
ENTRY(_start)

SECTIONS {
    . = 0x100000;  /* Multiboot load address */

    .multiboot : {
        *(.multiboot)
    }

    .text : {
        *(.text)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
