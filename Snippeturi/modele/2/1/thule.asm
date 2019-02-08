%include "io.inc"

section .data
   word_num1 dd 0xff543210
   word_num2 dd 0x00111111
   result_word resd 1
   big_num1 dd 0x11111111, 0x22222222, 0x33333333
   big_num2 dd 0xffffffff, 0x22222222, 0x33333333
   result_4word resd 4
   num_array1 dd 0x11111111, 0x22222222, 0x33333333, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   num_array2 dd 0xffffffff, 0x22922252, 0x33033338, 0x12111211, 0x22232242, 0xff333333, 0xff123456, 0xff123456, 0xff123456
   result_array resd 12
   length dd 3

section .text
global main
main:
    push ebp
    mov ebp, esp

    mov eax, [word_num1]
    add eax, [word_num2]
    mov [result_word], eax
    PRINT_HEX 4, [result_word]
    NEWLINE
    NEWLINE

    xor ecx, ecx
    pushfd

add_12_num:
    popfd
    mov eax, [big_num1 + ecx * 4]
    adc eax, [big_num2 + ecx * 4]
    mov [result_4word + ecx * 4], eax

    pushfd
    inc ecx
    cmp ecx, 3
    jne add_12_num


    mov ecx, 3

print_12_num:
    PRINT_HEX 4, [result_4word + (ecx - 1) * 4]
    loop print_12_num
    NEWLINE
    NEWLINE
    
    
    xor edx, edx
    xor ebx, ebx

add_vect:
    xor ecx, ecx

add_3:
    mov eax, [num_array1 + ecx * 4 + edx]
    add eax, [num_array2 + ecx * 4 + edx]
    jnc put_result

    add dword [result_array + ecx * 4 + ebx + 4], 1

put_result:
    add [result_array + ecx * 4 + ebx], eax

    inc ecx
    cmp ecx, 3
    jne add_3

    add edx, 12
    add ebx, 16
    cmp edx, 36
    jl add_vect


    xor edx, edx

print_vect:
    mov ecx, 3
    
    cmp dword [result_array + edx + 12], 0
    je print_3

    PRINT_HEX 4, [result_array + edx + 12]

print_3:
    PRINT_HEX 4, [result_array + (ecx - 1) * 4 + edx]
    loop print_3
    NEWLINE

    add edx, 16
    cmp edx, 48
    jne print_vect

    leave
    ret
