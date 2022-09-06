%include 'bibliotecaE.inc'

SECTION .text

global _start

_start:
    mov edi, 0x0

montaTabuleiro:
    add edi, 0x1
    cmp edi, 0x9
    je saida
    mov esi, 0x0
    mov edx, 0x0
    mov eax, edi
    mov ebx, 0x2
    div ebx
    cmp edx, 0x0
    jg linhaIniciaEstrela
    jmp linhaIniciaEspaco

linhaIniciaEstrela:
    add esi, 0x1
    mov edx, 0x1
    call impEstrela
    call impEspaco
    cmp esi, 0x7
    jl linhaIniciaEstrela
    mov edx, 0x2
    call impEstrela
    jmp montaTabuleiro

linhaIniciaEspaco:
    add esi, 0x1
    mov edx, 0x1
    call impEspaco
    call impEstrela
    cmp esi, 0x8
    jl linhaIniciaEspaco
    mov edx, 0x2
    call impEspaco
    jmp montaTabuleiro

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL