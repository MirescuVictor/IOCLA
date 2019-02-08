%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 0xfd110000
    mov ecx, 0x00ff0000
    
    and eax, ecx
    shr eax, 22
    mov ecx, 2

    push eax
    and eax, ecx
    shr eax, 1
    PRINT_DEC 4, eax

    pop eax
    shr ecx, 1
    and eax, ecx
    PRINT_DEC 4, eax
    NEWLINE


    mov edx, 213
    xor eax, eax

count_bits:
    test edx, 1
    jz next_pos

    inc eax

next_pos:
    shr edx, 2
    test edx, edx
    jnz count_bits

    PRINT_DEC 4, eax
    NEWLINE


    mov ebx, 0xfe
    mov edx, 0b111
    mov ecx, 29
    xor eax, eax

test_group:
    push ebx
    and ebx, edx
    cmp ebx, edx
    jne next_group

    inc eax

next_group:
    shl edx, 1
    pop ebx
    loop test_group

    PRINT_DEC 4, eax
    NEWLINE

    xor eax, eax
    leave
    ret