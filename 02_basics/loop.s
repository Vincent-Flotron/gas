.section .bss
counter: .long 0              # Reserve space for a counter variable

.section .text
.global _start

_start:
    mov $10, %eax             # Initialize counter with 10
    mov %eax, counter(%rip)   # Store it in memory

loop_start:
    mov counter(%rip), %eax   # Load counter value into %eax
    cmp $0, %eax              # Compare counter with 0
    je loop_end               # Jump to loop_end if counter == 0

    # Print the counter (simplified for explanation)
    # Normally, you'd convert %eax to a string for printing (advanced topic).

    dec %eax                  # Decrement counter
    mov %eax, counter(%rip)   # Store the updated counter back to memory
    mov $32,  %eax            # To disturb
    jmp loop_start            # Jump back to the start of the loop

loop_end:
    mov $60, %rax             # Exit system call
    xor %rdi, %rdi            # Exit status = 0
    syscall
