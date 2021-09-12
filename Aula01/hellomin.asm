; ------------------------
; Programa Hello World
; ------------------------
; $ nasm -f elf64 hello.asm
; $ ld -s -o hello hello.o
; $ ./hello
; ------------------------
section .data

section .text

global _start

_start:
  mov eax, 0x1
  mov ebx, 0x0
  int 0x80