##PURPOSE:   Explore functions.
#
#VARIABLES:  
# Function's input: 
#   %rdi : First argument (64-bit)
#   %rsi : Second argument (64-bit)
#
# Function's output:
#   %rax : Resurned value (64-bit)
#
# Memory:
#   result : used to save result
#            of sum to avoid
#            erasement of %eax
#
#WATCH (debug)
# How to see the memory content:
#           `(int)result`
#
#CODE########################################################################## 
.section .data
result:
 .int 0

.section .text
.global _start
.global add_numbers

_start:
    movq $5, %rdi              # First argument (64-bit)
    movq $10, %rsi             # Second argument (64-bit)
    call add_numbers           # Call the function
    movq %rax, result          # save result.

    # Exit system call
    movq $60, %rax             # System call number for exit
    movq result, %rdi          # Return value from add_numbers (64-bit)
    syscall

add_numbers:
    movq %rdi, %rax            # Move first argument into %rax (return register)
    addq %rsi, %rax            # Add second argument to %rax
    ret                        # Return to caller
