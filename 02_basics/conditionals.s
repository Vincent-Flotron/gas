.section .text
.global _start

_start:
    mov $5, %eax              # Load first number into %eax
    mov $10, %ebx             # Load second number into %ebx

    cmp %ebx, %eax            # Compare %eax with %ebx
    jg greater                # Jump if greater (signed comparison)
    jl less                   # Jump if less
    je equal                  # Jump if equal

greater:
    mov $60, %rax             # Exit system call
    mov $1, %rdi              # Exit status = 1
    syscall

less:
    mov $60, %rax             # Exit system call
    mov $2, %rdi              # Exit status = 2
    syscall

equal:
    mov $60, %rax             # Exit system call
    mov $3, %rdi              # Exit status = 3
    syscall
