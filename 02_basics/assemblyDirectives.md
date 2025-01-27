![alt text](image.png)

# registers

special role          | caller-save reg | callee-save reg | params to called func | 64 bit        | 32 bit          | 16 bit   | 8 bit
--------------------- | --------------- | --------------- | --------------------- | ------------- | --------------- | -------- | ---------
_                     | _               | _               | _                     | **quad word** | **double word** | **word** | **byte**
_                     | _               | _               | _                     | 8 byte        | 4 byte          | 2 byte   | 1 byte
_                     | _               | _               | _                     | **q**         | **l**           | **w**    | **b**
function's return val | caller-save reg | _               | _                     | %rax          | %eax            | %ax      | %al
_                     | caller-save reg | _               | params to called func | %rcx          | %ecx            | %cx      | %cl
_                     | caller-save reg | _               | params to called func | %rdx          | %edx            | %dx      | %dl
_                     | _               | callee-save reg | _                     | %rbx          | %ebx            | %bx      | %bl
_                     | _               | callee-save reg | params to called func | %rsi          | %esi            | %si      | %sil
_                     | _               | callee-save reg | params to called func | %rdi          | %edi            | %di      | %dil
stack pointer         | _               | callee-save reg | _                     | %rsp          | %esp            | %sp      | %spl
base pointer          | _               | callee-save reg | _                     | %rbp          | %ebp            | %bp      | %bpl
_                     | caller-save reg | _               | params to called func | %r8           | %r8d            | %r8w     | %r8b
_                     | caller-save reg | _               | params to called func | %r9           | %r9d            | %r9w     | %r9b
_                     | caller-save reg | _               | _                     | %r10          | %r10d           | %r10w    | %r10b
_                     | caller-save reg | _               | _                     | %r11          | %r11d           | %r11w    | %r11b
_                     | _               | callee-save reg | _                     | %r12          | %r12d           | %r12w    | %r12b
_                     | _               | callee-save reg | _                     | %r13          | %r13d           | %r13w    | %r13b
_                     | _               | callee-save reg | _                     | %r14          | %r14d           | %r14w    | %r14b
_                     | _               | callee-save reg | _                     | %r15          | %r15d           | %r15w    | %r15b
</br>





# assembler directives
[https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_toc.html#TOC67](https://ftp.gnu.org/old-gnu/Manuals/gas-2.9.1/html_chapter/as_toc.html#TOC67)