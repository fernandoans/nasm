%include 'bibliotecaR.inc'

section .data
  mensagem: db "Hello World 64 bits (1)!!! Vale um Joinha??", LF, NULL
  primeira: db "Hello World 64 bits (2)!!! Vale um Joinha??", LF, NULL
  olaMundo: db "Hello World 64 bits (3)!!! Vale um Joinha??", LF, NULL
  minhaProxima: db "Hello World 64 bits (4)!!! Vale um Joinha??", LF, NULL

section .text

global _start:

_start:
    mov rax, mensagem
    call showMsg

    mov rax, SYS_CALL
    xor rdi, rdi
    syscall

