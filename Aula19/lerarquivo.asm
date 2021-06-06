;--------------------------------------
; Ler o Arquivo
;--------------------------------------
%include 'bibliotecaE.inc'

SECTION .data
    arq     db "Musica.txt"
    tam     equ 1024    ; Tam do Arquivo

SECTION .bss
    fd      resb 4      ; File Descriptor
    buffer  resb 1024   ; Descarregar Memória

SECTION .text

global _start:

_start:
    mov     eax, OPEN_FILE
    mov     ebx, arq
    mov     ecx, STDIN
    int     SYS_CALL

ler:
    mov     [fd], eax  ; Armazenando o File Descriptor
    mov     eax, READ_FILE
    mov     ebx, [fd]
    mov     ecx, buffer
    mov     edx, tam
    int     SYS_CALL

saidaNaConsole:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, buffer
    mov     edx, tam
    int     SYS_CALL

fechar:
    mov     eax, CLOSE_FILE
    mov     ebx, [fd]
    int     SYS_CALL

termino:
    mov     eax, SYS_EXIT
    mov     ebx, EXIT_SUCESS
    int     SYS_CALL
