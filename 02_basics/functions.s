.section .text
.global _start
.global add_numbers

_start:
    mov $5, %rdi              # First argument (64-bit)
    mov $10, %rsi             # Second argument (64-bit)
    call add_numbers          # Call the function

    # Exit system call
    mov $60, %rax             # System call number for exit
    mov $8, %rdi            # Return value from add_numbers (64-bit)
    syscall

add_numbers:
    mov %rdi, %rax            # Move first argument into %rax (return register)
    add %rsi, %rax            # Add second argument to %rax
    ret                       # Return to caller
