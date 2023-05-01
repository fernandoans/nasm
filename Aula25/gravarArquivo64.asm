section .data
    nomArquivo db 'arquivo.txt', 0x0
    conteudo db 'Hello World 2!', 0xA
    mens_erro db 'Erro ao abrir o arquivo!', 0x0

section .text
    global _start

_start:
    ; Abrir o arquivo
    mov rax, 0x2  
    mov rdi, nomArquivo
    mov rsi, 0x2 | 0x40 | 0x80 
    ; 0x0 - Open Read
    ; 0x1 - Open Write
    ; 0x2 - Open R/W
    ; 0x8 - Open Append
    ; 0x40 - Open Create
    ; 0x80 - Open Excl
    mov rdx, 0o666 ; 1 x 2 w 3 wx 4 r 5 rx 6 rw 7 rwx
    syscall

    cmp rax, 0x0
    jl erroExiste

continuar:
    mov rdi, rax
    mov rax, 0x1
    mov rsi, conteudo
    mov rdx, 15
    syscall
 
    ; Fechar arquivo
    mov rax, 0x3
    mov rdi, [rsp] ; O arquivo fica topo da pilha
    syscall
    jmp finalizar

erroExiste:
    ; Abrir o arquivo
    mov rax, 0x2  
    mov rdi, nomArquivo
    mov rsi, 0x2 | 0x8 | 0x80 
    ; 0x0 - Open Read
    ; 0x1 - Open Write
    ; 0x2 - Open R/W
    ; 0x8 - Open Append
    ; 0x40 - Open Create
    ; 0x80 - Open Excl
    mov rdx, 0o666 ; 1 x 2 w 3 wx 4 r 5 rx 6 rw 7 rwx
    syscall    

    cmp rax, 0x0
    jl erro
    jmp continuar

erro:
    mov rax, 0x1
    mov rdi, 0x1
    mov rsi, mens_erro
    mov rdx, 25
    syscall

finalizar:
    mov rax, 0x3C
    xor rdi, rdi
    syscall
