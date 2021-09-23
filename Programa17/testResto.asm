%include 'bibliotecaE.inc'

section .text

global _start

_start:
  mov edi, 0x1
  mov edx, 0
  mov eax, edi
  mov ebx, 2
  div ebx

  mov eax, edx
  call int_to_string
  call saidaResultado
  
saida: 
  mov eax, SYS_EXIT
  int SYS_CALL