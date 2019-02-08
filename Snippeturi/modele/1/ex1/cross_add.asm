%include "io.inc"

section .data
    ; TODO a: Define arr1, arr2 and res arrays.
    arr1: dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
    arr2: dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

section .bss
    res resd 10

section .text
global main

main:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp


    ; TODO b: Compute res[0] and res[n-1].
    mov eax, [arr1]
    add eax, [arr2 + 36]
    mov [res], eax

    mov eax, [arr1 + 36]
    add eax, [arr2]
    mov [res + 36], eax

    ; List first and last item in each array.
    PRINT_UDEC 4, [arr1]
    NEWLINE
    PRINT_UDEC 4, [arr2]
    NEWLINE
    PRINT_UDEC 4, [res]
    NEWLINE

    PRINT_UDEC 4, [arr1+36]
    NEWLINE
    PRINT_UDEC 4, [arr2+36]
    NEWLINE
    PRINT_UDEC 4, [res+36]
    NEWLINE
    NEWLINE


    ; TODO d: Compute cross sums in res[i].
    mov ecx, 9
    mov eax, 1

add_vectors:
    mov edx, [arr1 + eax * 4]
    add edx, [arr2 + (ecx - 1) * 4]
    mov [res + eax * 4], edx

    inc eax
    dec ecx
    jnz add_vectors  

    ; TODO c: List arrays.

    mov ecx, 10
    xor eax, eax

print_vectors:
    PRINT_UDEC 4, [arr1 + eax * 4]
    NEWLINE
    PRINT_UDEC 4, [arr2 + eax * 4]
    NEWLINE
    PRINT_UDEC 4, [res + eax * 4]
    NEWLINE
    NEWLINE

    inc eax
    dec ecx
    jnz print_vectors

    ; Return 0.    
    xor eax, eax
    leave
    ret