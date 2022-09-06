%include 'bibliotecaE.inc'

SECTION .bss
  lado resb 0x1; Valor do Lado

SECTION .text

global _start

_start:
  mov byte[lado], 0x8 ; valor inicial do Lado
  mov edi, dword[lado] ; EDI -> 5 -> controlador de linha

inicio:
  mov esi, dword[lado] ; ESI -> 5 -> controlar coluna
  call impLinha
  sub edi, 0x1
  cmp edi, 0x0
  je saida
  jmp inicio

impLinha:
  mov edx, 0x1
  call impEstrela
  sub esi, 0x1
  cmp esi, 0x1
  jg impLinha
  mov edx, 0x2
  call impEstrela
  ret

saida:
  mov eax, SYS_EXIT
  mov ebx, RET_EXIT
  int SYS_CALL