;--------------------------------------
; Arrays
;--------------------------------------
%include 'bibliotecaE.inc'

SECTION .data
    array      DD 1, 2, 3, 4, 5

SECTION .text

global _start:

_start:
    mov     eax, [array + 4 * 0]
    call    int2string
    call    saidaResultado

saida:
    mov     eax, SYS_EXIT
    mov     ebx, EXIT_SUCESS
    int     SYS_CALL    
