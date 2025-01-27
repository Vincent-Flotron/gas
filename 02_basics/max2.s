#PURPOSE:  This program finds the maximum number of a
#          set of data items.
#          This program use memory. Just for fun.
#
#VARIABLES: The registers have the following uses:
#
# %edi - Holds the index of the data item being examined
# %ebx - Largest data item found
# %eax - Current data item
#
# The following memory locations are used:
#
# data_items - contains the item data. A 0 is used
#              to terminate the data
#RETURRNED CODE
# The biggest number is returned. Can be see running
# this program the using echo like below:
#       ./maximum
#       echo $?
#               -> 222
#CODE#################################################
 .section .data
data_items:                         # These are the data items. 0 is the end.
 .long    3,67,34,222,45,75,54,34,44,33,22,11,66,0
biggest:
 .int     0

 .section .text
 
 .globl _start
_start:
 movl $0, %edi                      # move 0 to the index register
 movl data_items(, %edi, 4), %eax   # load the first byte of data
 movl %eax, biggest                 # since this is the first item, %eax is
                                    # the biggest

start_loop:                         # start loop
 cmp $0, %eax                       # do we hit the end ?
 je loop_exit
 # Load next value
 incl %edi                          # %edi++ . Increment the index register 
 movl data_items(,%edi, 4), %eax
 cmpl biggest, %eax                 # compare values
 jle start_loop                     # loop if previous comparaison is less or equal
 movl %eax, biggest                 # move the value as the largest
 jmp start_loop                     # loop

loop_exit:
                                    # %ebx is the status code for the exit system call
                                    # and it already as the maximum number
 movl $1, %eax                      # 1 is the exit() syscall
 movl biggest, %ebx                 # give max val as returned value
 int $0x80