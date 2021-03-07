; ------------------------
; Programa Hello World
; ------------------------
; $ nasm -f elf64 hello.asm
; $ ld -s -o hello hello.o
; $ ./hello
; ------------------------
segment .data
  msg db 'Hello, world!', 0xA, 0xD
  len equ $- msg

segment .text

global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg
  mov edx, len
  int 0x80

; saida
  mov eax, 1
  mov ebx, 5
  int 0x80
