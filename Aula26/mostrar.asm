section .data
  LF equ 0xA ; Line Feed
  mensagem: db "Hello World 64 bits!!!", LF

section .text

global _start:

_start:
    mov rax, 0x1 ; System Call escrita
    mov rdi, 0x1 ; Informação saida
    mov rsi, mensagem
    mov rdx, 0x17
    syscall

    mov rax, 0x3C ; System Call saida
    xor rdi, rdi
    syscall