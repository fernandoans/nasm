;--------------------------------------
; Linhas em um Arquivo
;--------------------------------------
%include 'bibliotecaE.inc'

SECTION .data
    msg2    db "Aqui temos mais uma linha", LF
    tamMsg2 equ $ - msg2
    arq     db 'Hello', NULL
    tamArq  equ $ - arq
    fd      dq 0 ; File Descriptor

SECTION .text

global _start:

_start:
    mov eax, OPEN_FILE
    mov ebx, arq
    mov ecx, OPEN_CREATE+OPEN_WRITE+OPEN_APPEND
    mov edx, 0o664
    int SYS_CALL
    
    mov [fd], eax

escreverNoArquivo:
    mov eax, WRITE_FILE
    mov ebx, [fd]
    mov ecx, msg2
    mov edx, tamMsg2
    int SYS_CALL    

fecharArquivo:
    mov eax, CLOSE_FILE
    mov ebx, [fd]
    int SYS_CALL    

final:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCESS
    int SYS_CALL    
