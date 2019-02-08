%include "io.inc"

extern fgets
extern stdin
extern printf

section .data
    n            dd 7
    format_str   db "Number: %d", 13, 10, 0
    prime_format db "isPrime: %d", 13, 10, 0
    
section .bss
    number resb 9

section .text
global main

;TODO b: Implement stringToNumber
stringToNumber:
    push ebp
    mov ebp, esp
    push ebx
    
    mov ecx, 10
    mov edi, [ebp + 8]
    xor eax, eax
    xor edx, edx
    
make_number:
    mov bl, [edi]
    cmp bl, 10
    jbe return
    
    mul ecx
    sub ebx, 0x30
    add eax, ebx

    inc edi
    jmp make_number

return:
    pop ebx
    leave
    ret

;TODO c.: Add missing code bits
isPrime:
    push ebp
    mov ebp, esp
    
    mov ecx, 2
    mov eax, [ebp+8]
    xor edx, edx
    div ecx
    mov ebx, eax
    
    mov eax, [ebp+8]

loop:
    div ecx
    cmp edx, 0
    je not_prime
    inc ecx
    mov eax, [ebp+8]
    xor edx, edx
    cmp ecx, ebx
    jne loop

    mov eax, 1
    jmp done
    
not_prime:
    xor eax, eax

done:
    leave
    ret


CMAIN:
    push ebp
    mov ebp, esp

    ;TODO a.: allocate space on stack and call fgets
    push dword [stdin]
    push dword [n]
    push number
    call fgets

    ;TODO b.: call stringToNumber and print it using printf
    push number
    call stringToNumber
    
    push eax
    push format_str
    call printf

    ;TODO c.: call isPrime and print result
    add esp, 4
    call isPrime
    
    test eax, eax
    jz exit
    
    push prime_format
    call printf

exit:
    leave
    ret
