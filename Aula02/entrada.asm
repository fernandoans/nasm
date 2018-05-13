; Programa para Entrada de Dados

SYS_EXIT  equ 1
RET_EXIT  equ 5
SYS_READ  equ 3
SYS_WRITE equ 4
STD_IN    equ 0
STD_OUT   equ 1
MAX_IN    equ 10

segment .data
  msg db "Entre com seu nome: ", 0xA, 0xD
  len equ $- msg

segment .bss
  nome resb 2

segment .text

global _start

_start:
  ; ax bx cx dx -> e
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msg
  mov edx, len
  int 0x80

  ; Entrada Dados
  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, nome
  mov edx, MAX_IN
  int 0x80
  
exit:
  mov eax, SYS_EXIT
  mov ebx, RET_EXIT ; xor ebx, ebx
  int 0x80
  
















