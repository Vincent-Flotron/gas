.section .data
msg:    .asciz "Hello, World!\n"    # Null-terminated string

.section .text
.global _start

_start:
    # Write sastem call
    mov $1, %rax        # System call number for write
    mov $1, %rdi        # File descriptor (1 = stdout)
    lea msg(%rip), %rsi # Load address of msg into %rsi
    mov $14, %rdx       # Length of the string
    syscall             # Make the system call

    # Exit system call
    mov $60, %rax       # System call number for exit
    xor %rdi, %rdi      # Return code (0 = cuccess)
    syscall