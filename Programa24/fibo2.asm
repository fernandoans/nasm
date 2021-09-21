section .text

global Fibonacci

Fibonacci:
    mov eax, 1
    mov r8d, 1
Calcular:
    sub edi, 1 
    cmp edi, 0
    je  Terminar
    add eax, r8d
    jmp Calcular

Terminar:
    ret