# Bootloader code to set up the environment and jump to kernel_main
# Assumes QEMU boots this as a flat binary or ELF

.code32
.global _start

_start:
    # Set up stack
    movl $0x7C00, %esp  # Stack starts below bootloader area

    # Call kernel main
    call kernel_main

    # Halt if kernel returns
    hlt
    jmp .