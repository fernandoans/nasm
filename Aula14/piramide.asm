%include 'bibliotecaE.inc'

SECTION .bss
    altura  resb 0x4
    linha   resb 0x4
    qtdespacos  resb 0x4
    qtdestrelas resb 0x4
    qtdlinhas   resb 0x4

SECTION .text

global _start

_start:
    mov byte[altura], 0x4
    mov byte[qtdlinhas], 0x4
    mov byte[linha], 0x1
    mov byte[qtdestrelas], 0x1

inicio:
    mov edi, dword[altura]
    sub edi, dword[linha]
    call impEspacos
    mov edi, dword[qtdestrelas]
    call impEstrelas
    sub byte[qtdlinhas], 0x1
    cmp byte[qtdlinhas], 0x0
    je saida
    add byte[qtdestrelas], 0x2
    add byte[linha], 0x1
    jmp inicio

impEspacos:
    cmp edi, 0x1
    jl finalImpEspaco
    mov edx, 0x1
    call impEspaco
    sub edi, 0x1
    jmp impEspacos

finalImpEspaco:
    ret

impEstrelas:
    cmp edi, 0x1
    je finalImpEstrela
    mov edx, 0x1
    call impEstrela
    sub edi, 0x1
    jmp impEstrelas

finalImpEstrela:
    mov edx, 0x2
    call impEstrela
    ret

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

