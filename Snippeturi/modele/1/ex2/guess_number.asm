extern rand
extern time
extern srand
extern scanf
extern printf
extern puts


section .data
    uint_format    db "%zu", 0
    uint_format_newline    db "%zu", 10, 0
    msg    db "Insert number: ", 0
    is_smaller_string db "Numarul introdus este mai mic", 10, 0
    is_larger_string db "Numarul introdus este mai mare", 10, 0
    is_equal_string db "Corect", 10, 0


section .bss
    num resd 1


section .text

read_cmp:
    push ebp
    mov ebp, esp
    sub esp, 4

    push esp
    push uint_format
    call scanf

    mov eax, [ebp - 4]
    cmp eax, [num]
    ja greater
    jb lower

    push is_equal_string
    call printf
    xor eax, eax
    jmp return

greater:
    push is_larger_string
    call printf
    mov eax, 1
    jmp return

lower:
    push is_smaller_string
    call printf
    mov eax, 1

return:
    leave
    ret


global main
main:
    push ebp
    mov ebp, esp

    ; TODO a: Call srand(time(0)) and then rand() and store return value modulo 100 in num.
    push dword 0
    call time
    push eax
    call srand
    call rand

    mov ecx, 100
    div ecx
    mov [num], edx

    ; Debug only: Print value of num to check it was properly initialized.
    push dword [num]
    push uint_format_newline
    call printf
    add esp, 8

    ; Comment this out when doing TODO b. Uncomment it when doing TODO c and d.
    jmp make_call

    ; TODO b: Read numbers from keyboard in an infinite loop.
read_numbers:
    push num
    push uint_format
    call scanf

    push dword [num]
    push uint_format_newline
    call printf

    jmp read_numbers

make_call:
    call read_cmp
    test eax, eax
    jnz make_call

    ; Return 0.
    xor eax, eax
    leave
    ret
