%include 'bibliotecaE.inc'

section .text

global _start

_start:
  lea esi, [BUFFER] ; Load Effective Address
  add esi, 0x9
  mov byte[esi], 0xA

  dec esi
  mov dl, 0x13 ; -> 'C' 0x33 -> 'c'
  add dl, '0'
  mov [esi], dl

  dec esi
  mov dl, 0x12 ; -> 'B' 0x32 -> 'b'
  add dl, '0'
  mov [esi], dl

  dec esi
  mov dl, 0x11 ; -> 'A' 0x31 -> 'a'
  add dl, '0'
  mov [esi], dl

  call saidaResultado

  mov eax, SYS_EXIT
  mov ebx, RET_EXIT
  int SYS_CALL