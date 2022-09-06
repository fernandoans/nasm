%include 'bibliotecaE.inc'

SECTION .data
    nom_arq: db "Musica.txt"
    tam_arq: equ 1024 ; 1 Kb leitura

SECTION .bss
    fd: resb 4  ; File Descriptor
    buffer: resb 1024 ; Descarregar Memória

SECTION .text

global _start:

_start:
    mov eax, OPEN_FILE
    mov ebx, nom_arq
    mov ecx, OPEN_READ
    int SYS_CALL

ler:
    mov [fd], eax ; armazena file descriptor
    mov eax, READ_FILE
    mov ebx, [fd]
    mov ecx, buffer
    mov edx, tam_arq
    int SYS_CALL

saidaNaConsole:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, buffer
    mov edx, tam_arq
    int SYS_CALL

fechar:        
    mov eax, CLOSE_FILE
    mov ebx, [fd]
    int SYS_CALL

termino:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL


