%include 'bibliotecaE.inc'

SECTION .data
  arq   db  "Musica.txt"
  tam   equ 1024

SECTION .bss
  fd     resb 4
  buffer resb 1024

SECTION .text

global _start:

_start:
    mov eax, OPEN_FILE
    mov ebx, arq
    mov ecx, OPEN_READ
    int SYS_CALL
    mov [fd], eax

posicionar:
    mov eax, SEEK_FILE
    mov ebx, [fd]
    mov ecx, -131
    mov edx, SEEK_END
    int SYS_CALL

ler:
    mov eax, READ_FILE
    mov ebx, [fd]
    mov ecx, buffer
    mov edx, tam
    int SYS_CALL

saidaNoConsole:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, buffer
    mov edx, tam
    int SYS_CALL

fechar:
    mov eax, CLOSE_FILE
    mov ebx, [fd]
    int SYS_CALL

termino:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCESS 
    int SYS_CALL   

