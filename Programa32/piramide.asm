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

SECTION .bss
   altura       resb 0xA ; Altura (fixa)
   linha        resb 0xA ; linha atual
   qtdespacos   resb 0xA ; Qtd de espaços
   qtdestrelas  resb 0xA ; Qtd de estrelas
   qtdlinhas    resb 0xA ; Qtd linhas já impressa

SECTION .text

global _start

_start:
   mov      byte[altura], 0x4
   mov      byte[linha], 0x1
   mov      byte[qtdestrelas], 0x1
   mov      byte[qtdlinhas], 0x4

inicio:
   mov      edi, dword[altura]
   sub      edi, dword[linha]
   call     impEspacos
   mov      edi, dword[qtdestrelas]
   call     impEstrelas
   sub      byte[qtdlinhas], 0x1
   cmp      byte[qtdlinhas], 0x0
   je       saida
   add      byte[qtdestrelas], 0x2
   add      byte[linha], 0x1
   jmp      inicio

impEspacos:
   cmp      edi, 0x1
   jl       finalImpEspaco
   call     impEspaco
   sub      edi, 0x1
   jmp      impEspacos

finalImpEspaco:
   ret      

impEstrelas:
   cmp      edi, 0x1
   je       impEstrelaFinal
   call     impEstrela
   sub      edi, 0x1
   jmp      impEstrelas

saida:
   mov      eax, SYS_EXIT
   mov      ebx, EXIT_SUCESS
   int      SYS_CALL

;--------------------------------------
; Funções
;--------------------------------------
impEspaco: ; print(' ')
    mov     edx, 1
    mov     ecx, espaco
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    int     SYS_CALL
    ret

impEstrela: ; print('*')
    mov     edx, 1
    mov     ecx, estrela
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    int     SYS_CALL
    ret

impEstrelaFinal: ; println('*')
    mov     edx, 2
    mov     ecx, estrela
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    int     SYS_CALL
    ret