.section .data
msg:    .ascii "Hello, World!\n"

.section .text
.globl _start

_start:
    # Write system call
    mov $1, %rax         # write
    mov $1, %rdi         # stdout
    lea msg(%rip), %rsi  # Load address of msg into %rsi
    mov $14, %rdx        # Length of the string
    syscall              # Make the system call

    # Exit system call
    mov $60, %rax        # System call number for exit
    xor %rdi, %rdi       # Return code (0 = success)
    syscall