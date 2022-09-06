%include 'bibliotecaE.inc'

SECTION .data
    msg db "Aqui temos uma linha", LF
    tamMsg equ $ - msg
    arq db 'Hello'
    tamArq equ $ - arq
    fd dq 0 ; File Descriptor

SECTION .text

global _start

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
   mov ecx, msg
   mov edx, tamMsg
   int SYS_CALL

fecharArquivo:
    mov eax, CLOSE_FILE
    mov ebx, [fd]
    int SYS_CALL

final:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL 