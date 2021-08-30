;--------------------------------------
; Quadrados
;--------------------------------------
%include 'bibliotecaE.inc'

SECTION .data
   estrela: DB  '*', LF, NULL
   altura:  EQU 4

SECTION .text

global _start

_start:
    mov     edi, altura

inicio:
    mov     esi, altura
    call    impLinha
    sub     edi, 0x1
    cmp     edi, 0x0
    je      saida
    jmp     inicio

impLinha:
    call    impEstrela
    sub     esi, 0x1
    cmp     esi, 0x1
    jg      impLinha
    je      impEstrelaFinal
    ret

saida:
    mov     eax, SYS_EXIT
    mov     ebx, EXIT_SUCESS
    int     SYS_CALL

;--------------------------------------
; Funções
;--------------------------------------
impEstrela: ; print('*')
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, estrela
    mov     edx, 0x1
    int     SYS_CALL
    ret

impEstrelaFinal: ; println('*')
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, estrela
    mov     edx, 0x2
    int     SYS_CALL
    ret