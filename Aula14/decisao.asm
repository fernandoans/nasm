segment .text

global Teste1
global Teste2

Teste1:
    cmp     edi, esi
    jg      voltaEDI
    jmp     voltaESI

voltaEDI:
    mov     eax, edi
    ret

voltaESI:
    mov     eax, esi
    ret

Teste2:
    cmp     edi, 1
    je      volta5
    cmp     edi, 2
    je      volta6
    cmp     edi, 3
    je      volta4
    cmp     edi, 4
    je      volta5
    mov     eax, $0x0
    ret

volta5:
    mov     eax, $0x5
    ret    

volta6:
    mov     eax, $0x6
    ret    

volta4:
    mov     eax, $0x4
    ret