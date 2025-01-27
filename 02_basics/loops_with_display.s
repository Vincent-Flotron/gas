.section .bss
counter: .long 0              # Reserve space for a counter variable
buffer: .space 20             # Buffer for string conversion

.section .text
.global _start

_start:
    mov $10, %eax             # Initialize counter with 10
    mov %eax, counter(%rip)   # Store it in memory

loop_start:
    call load_cpt             # Load counter value into %eax
    cmp $0, %eax              # Compare counter with 0
    je loop_end               # Jump to loop_end if counter == 0

    # Convert integer to string
    mov $buffer, %rdi         # Set destination for string
    call int_to_string        # Call conversion function

    # Print the counter
    mov $1, %rax              # syscall: write
    mov $1, %rdi              # file descriptor: stdout
    mov $buffer, %rsi         # string to write
before_print:
    mov $20, %rdx             # length to write
    syscall

    call load_cpt             # Load counter value into %eax
    dec %eax                  # Decrement counter
    mov %eax, counter(%rip)   # Store the updated counter back to memory
    jmp loop_start            # Jump back to the start of the loop

loop_end:
    mov $60, %rax             # Exit system call
    xor %rdi, %rdi            # Exit status = 0
    syscall


# Function Load counter
load_cpt:
    mov counter(%rip), %eax   # Load counter value into %eax
    ret

# Function to convert integer to string
int_to_string:
    push %rbx
    mov $0, %ecx              # Initialize digit count
    mov $10, %ebx             # Divisor for base 10

convert_loop:
    xor %edx, %edx            # Clear upper bits of dividend
    div %ebx                  # Divide by 10
    add $'0', %dl             # Convert remainder to ASCII
    dec %rdi                  # Move string pointer back
    mov %dl, (%rdi)           # Store the digit
    inc %ecx                  # Increment digit count
    test %eax, %eax           # Check if quotient is zero
    jnz convert_loop          # If not, continue loop

    mov %rdi, %rax            # Return pointer to start of string
    pop %rbx
    ret
