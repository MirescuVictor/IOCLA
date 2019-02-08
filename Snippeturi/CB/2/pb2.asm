%include "io.inc"

section .data
    v dd 1, 2, 3, 4, 5, 6, 7, 8, 9, 10


section .bss
    sq resd 10


section .text

strrev:
    push ebp
    mov ebp, esp
    push ebx

    mov edi, [ebp + 8]
    mov ecx, [ebp + 12]
    mov esi, ecx
    shr esi, 1
    xor eax, eax

reverse:
    mov dl, [edi + ecx - 1]
    mov bl, [edi + eax]

    mov [edi + eax], dl
    mov [edi + ecx - 1], bl

    inc eax
    dec ecx
    cmp ecx, esi
    jne reverse

    pop ebx
    leave
    ret


squares:
    push ebp
    mov ebp, esp

    mov edi, [ebp + 8]
    mov esi, [ebp + 12]
    mov ecx, [ebp + 16]

comute_squares:
    mov eax, [edi + (ecx - 1) * 4]
    mul eax
    mov [esi + (ecx - 1) * 4], eax
    loop comute_squares

    leave
    ret


global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    sub esp, 20
    mov edi, esp
    mov al, 'A'

fill_chars:
    mov [edi], al
    inc al
    inc edi
    cmp edi, ebp
    jne fill_chars

    mov byte [ebp - 1], 0

    PRINT_STRING [esp]
    NEWLINE

    mov eax, esp
    push 19
    push eax
    call strrev
    add esp, 8

    PRINT_STRING [esp]
    NEWLINE
    NEWLINE
    
    push 10
    push sq
    push v
    call squares

    xor ecx, ecx

print_squares:
    PRINT_DEC 4, [sq + ecx * 4]
    NEWLINE
    
    inc ecx
    cmp ecx, 10
    jne print_squares

    xor eax, eax
    leave
    ret