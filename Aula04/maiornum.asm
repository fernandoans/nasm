section .data

  x dd 10  ; dd - Define Double Word - 4 bytes
           ; db - Define Byte - 1 Byte
           ; dw - Define Word - 2 Bytes
           ; dq - Define Quad Word - 4 Bytes
           ; dt - Define Ten Word  - 10 Bytes
  y dd 50
  msg1 db 'X maior que Y', 0xa
  len1 equ $ - msg1
  msg2 db 'Y maior que X', 0xa
  len2 equ $ - msg2

section .text

global _start

_start:
  mov eax, DWORD [x]
  mov ebx, DWORD [y]
  cmp eax, ebx       ; comparacao
  jge maior          ; je = jg > jge >= jl < jle <= jne != 
  mov edx, len2
  mov ecx, msg2
  jmp final
  
maior:
  mov edx, len1
  mov ecx, msg1

final:
  mov ebx, 1
  mov eax, 4
  int 0x80
  mov eax, 1
  int 0x80  











