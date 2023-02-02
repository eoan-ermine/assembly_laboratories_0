global _start

%define OUT 0
%define IN 1

section .data
        BUFSIZE:  equ $1
        state: db 0
        previous_state: db 0
        space: db ' '

section .bss
        buffer: resb 1

section .text
_start:
        jmp loop_condition
loop:
        mov r10b, [buffer]
        cmp r10b, 32
        sete r8b
        mov [state], r8b
first_condition:
        cmp r8b, OUT
        jne second_condition

        mov r9b, [previous_state]
        cmp r9b, IN
        jne second_condition

        mov eax, 1
        mov edi, 1
        lea rsi, [rel space]
        mov edx, 1
        syscall
second_condition:
        mov r8b, [state]
        cmp r8b, OUT
        jne variable_assign

        mov eax, 1
        mov edi, 1
        lea rsi, [rel buffer]
        mov edx, BUFSIZE
        syscall
variable_assign:
        mov r12b, [state]
        mov [previous_state], r12b
loop_condition:
        xor eax, eax
        xor edi, edi
        lea rsi, [rel buffer]
        mov edx, BUFSIZE
        syscall

        cmp eax, 0
        jne loop
        leave
        ret