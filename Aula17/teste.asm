%include 'bibliotecaE.inc'

SECTION .data
	msg1: DB 'Parte 1', LF, NULL
	msg2: DB 'Parte 2', LF, NULL
	msg3: DB 'Parte 3', LF, NULL
	msg4: DB 'Parte 4', LF, NULL

SECTION .text

global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg3
  mov edx, 18
  int 0x80

  mov eax, 1
  mov ebx, 5
  int 0x80    