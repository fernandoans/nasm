; ------------------------------------------
; Ler um dados e gravar no Arquivo
; ------------------------------------------
%include 'bibliotecaE.inc'

section .data
    msg         db   "Entre com o valor da Nota (formato 00 a 10 ou 20 para terminar):", LF, NULL
    tamMsg      equ  $ - msg
    arq         db   'Nota', STDIN
    tamArq      equ  $ - arq
    dispMsg     db   "Nota Gravadas!", LF, NULL
    tamDispMsg  equ  $ - dispMsg 
    fd          dq   0

section .bss
    inpt        resb    2

section .text

global _start

_start:
    mov     eax, OPEN_FILE
    mov     ebx, arq
    mov     ecx, OPEN_CREATE+OPEN_WRITE+OPEN_APPEND
    mov     edx, 0o664
    int     SYS_CALL
    mov     [fd], eax

mostrarMsg:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, msg
    mov     edx, tamMsg
    int     SYS_CALL

obterNota:
    mov     eax, SYS_READ
    mov     ebx, STDIN
    mov     ecx, inpt
    mov     edx, 3
    int     SYS_CALL

verificar20:
    mov     ah, [inpt]
    sub     ah, '0'
    cmp     ah, 2
    je      fecharArquivo

escreverNoArquivo:
    mov     eax, WRITE_FILE
    mov     ebx, [fd]
    mov     ecx, inpt
    mov     edx, 3
    int     SYS_CALL
    jmp     mostrarMsg

fecharArquivo:
    mov     eax, CLOSE_FILE
    mov     ebx, [fd]
    int     SYS_CALL

mostrarMsgFinal:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, dispMsg
    mov     edx, tamDispMsg
    int     SYS_CALL

final:
    mov     eax, SYS_EXIT
    mov     ebx, EXIT_SUCESS
    int     SYS_CALL
