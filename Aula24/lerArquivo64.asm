section .data
    LF          equ 10 ; Line Feed
    NULL        equ 0  ; Final de uma string
    EXIT_SUCESS equ 0  ; Operação com Sucesso
    SYS_EXIT    equ 60 ; Código de chamada para finalizar

    STDIN       equ 0  ; System.in
    STDOUT      equ 1  ; System.out
    STDERR      equ 2  ; System.err

    SYS_READ    equ 0  ; leitura
    SYS_WRITE   equ 1  ; escrita / saída

    OPEN_READ   equ 0  ; abrir arquivo em modo leitura

    READ_FILE   equ 0  ; leitura do arquivo
    OPEN_FILE   equ 2  ; abrir arquivo
    CLOSE_FILE  equ 3  ; fechar arquivo

    file    db  'arquivo.txt', NULL
    tam_arq: equ 1024   ; 1 Kb Leitura

section .bss
    fd: resb    4 ; File Descriptor
    buffer: resb 4096    

section .text

global _start

_start:
    ; Abrir o arquivo
    mov rax, OPEN_FILE
    mov rdi, file
    mov rsi, OPEN_READ
    syscall

    ; Ler o conteúdo do arquivo
    mov [fd], rax ; armazenar o valor do File Descriptor
    mov rax, READ_FILE;
    mov rdi, [fd]
    mov rsi, buffer
    mov rdx, tam_arq
    syscall

    ; Escrever o conteúdo em tela
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, buffer
    mov rdx, tam_arq
    syscall

    ; Fechar Arquivo
    mov rax, CLOSE_FILE
    mov rdi, [fd]
    syscall

    ; Finalizar
    mov     RAX, SYS_EXIT
    xor rdi, rdi ; Zerar
    syscall