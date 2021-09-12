; ------------------------
; Programa Hello World
; ------------------------
; $ nasm -f elf64 hello.asm
; $ ld -s -o hello hello.o
; $ ./hello
; ------------------------
section .data
  msg db 'Hello World!', 0xA
  tam equ $- msg

section .text

global _start

_start:
  mov eax, 0x4
  mov ebx, 0x1
  mov ecx, msg
  mov edx, tam
  int 0x80

saida:
  mov eax, 0x1
  mov ebx, 0x0
  int 0x80
