global Teste1
global Teste2

segment .text

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
    mov     eax, $0
    ret

volta5:
    mov     eax, $5
    ret    

volta6:
    mov     eax, $6
    ret    

volta4:
    mov     eax, $4
    ret