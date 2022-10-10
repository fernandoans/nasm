section .data
    mensagem: db "Hello World 64 Bits!!!", 0xA
    tam: equ $- mensagem

section .text

global _start:

_start:
    mov RAX, 0x1 ; System call escrita
    mov RDI, 0x1 ; Informação Saída
    mov RSI, mensagem
    mov RDX, tam
    syscall

    mov RAX, 0x3C ; System call saída
    xor RDI, RDI
    syscall