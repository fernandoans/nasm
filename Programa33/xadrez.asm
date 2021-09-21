;--------------------------------------
; Piramides
;--------------------------------------
; Seção BSS - Espaços Reservados
;  - resb: Reserva qtd em bytes 
;  - resw: Reserva qtd em words (2 bytes)
;  - resq: Reserva qtd em N.Reais
;--------------------------------------
%include 'bibliotecaE.inc'

SECTION .data
   estrela  DB  '*', LF, NULL
   espaco   DB  ' ', LF, NULL

SECTION .text

global _start

_start:
   mov edi, 0x0

montaTabuleiro:
   add edi, 0x1
   mov esi, 0x0
   call linhaIniciaEstrela   
   mov esi, 0x0
   call linhaIniciaEspaco
   cmp edi, 0x4
   je saida
   jl montaTabuleiro

linhaIniciaEstrela:
   add esi, 0x1
   mov edx, 1
   call impEstrela 
   call impEspaco
   cmp esi, 0x7
   jl linhaIniciaEstrela
   mov edx, 2
   call impEstrela 
   ret

linhaIniciaEspaco:
   add esi, 0x1
   mov edx, 1
   call impEspaco
   call impEstrela 
   cmp esi, 0x8
   jl linhaIniciaEspaco
   mov edx, 2
   call impEspaco 
   ret

saida:
   mov      eax, SYS_EXIT
   mov      ebx, EXIT_SUCESS
   int      SYS_CALL

;--------------------------------------
; Funções
;--------------------------------------
impEspaco: ; print(' ')
    mov     ecx, espaco
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    int     SYS_CALL
    ret

impEstrela: ; print('*')
    mov     ecx, estrela
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    int     SYS_CALL
    ret
