.section .data           # Data section
msg:
    .string "Hello, Worldy !\n"

.section .text           # Code section
.globl _start            # Declare start as program's entry point
_start:
    # Write the message to stdout
    addl $2, %eax
    movl $4, %eax        # Syscall number for sys_write
    movl $1, %ebx        # File descriptor 1 is stdout
    movl $msg, %ecx      # Pointer to the message
    movl $16, %edx       # Length of the message
write_label:
    int $0x80            # Call kernel

    # Exit the program
exit_label:
    movl $1, %eax        # Syscall number for sys_exit
    xorl %ebx, %ebx      # Exit code 0
    int $0x80            # Call kernel
