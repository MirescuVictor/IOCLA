%include "io.inc"
extern scanf

section .data
    v dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    input db "%d%d", 0

section .bss
    last resd 1
    first resd 1


section .text

sum:
    push ebp
    mov ebp, esp

    xor eax, eax
    mov ecx, [ebp + 12]
    mov edi, [ebp + 8]

calculate_sum:
    add eax, [edi + (ecx - 1) * 4]
    loop calculate_sum

    leave
    ret


sum_interval:
    push ebp
    mov ebp, esp

    mov ecx, [ebp + 16]
    sub ecx, [ebp + 12]
    inc ecx
    push ecx

    mov ecx, [ebp + 12]
    shl ecx, 2
    add ecx, [ebp + 8]
    push ecx
    call sum

    leave
    ret


global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    push last
    push first
    push input
    call scanf 

    push dword [last]
    push dword [first]
    push v
    call sum_interval
    
    PRINT_DEC 4, eax
    NEWLINE

    leave
    xor eax, eax
    ret