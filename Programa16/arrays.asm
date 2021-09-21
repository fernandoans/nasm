;--------------------------------------
; Arrays
;--------------------------------------
%include 'bibliotecaE.inc'

SECTION .data
    array: DD 10, 22, 13, 14, 55

SECTION .text

global _start:

_start:
    mov     eax, [array + 4 * 0]
    call    int_to_string
    call    saidaResultado

saida:
    mov     eax, SYS_EXIT
    mov     ebx, EXIT_SUCESS
    int     SYS_CALL    
