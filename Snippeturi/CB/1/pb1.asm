%include "io.inc"

section .data
    arr db "Lorem ipsum dolor sit amet.", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp
    
    ; a) sa se determine daca un numar are bitul de semn activat
    mov eax, 3147483646
    cmp eax, 0x7fffffff
    ja signed

    PRINT_STRING "unsigned"
    jmp next

signed:
    PRINT_STRING "signed"


next:
    NEWLINE
    ; b) sa se afiseze nr de biti de 1 dintr-un numar
    mov edx, 213
    xor eax, eax

count_bits:
    test edx, 1
    jz next_bit

    inc eax

next_bit:
    shr edx, 1
    test edx, edx
    jnz count_bits

    PRINT_DEC 4, eax
    NEWLINE


    ; c) sa se afle nr de biti dintr-un sir
    mov edi, arr
    xor eax, eax

count_bits_arr:
    mov dl, [edi]
    test dl, dl
    jz return
    
count_bits_char:
    test dl, 1
    jz next_bit_char
    
    inc eax
    
next_bit_char:
    shr dl, 1
    test dl, dl
    jnz count_bits_char

    inc edi
    jmp count_bits_arr

return:
    PRINT_DEC 4, eax
    NEWLINE

    xor eax, eax
    leave
    ret