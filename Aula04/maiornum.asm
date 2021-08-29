segment .data
  LF        equ 0xA  ; Line Feed
  NULL      equ 0xD  ; Final da String
  SYS_EXIT  equ 0x1  ; Codigo de chamada para finalizar
  RET_EXIT  equ 0x0  ; Operacao com Sucesso
  STD_IN    equ 0x0  ; Entrada padrao
  STD_OUT   equ 0x1  ; Saida padrao
  SYS_READ  equ 0x3  ; Operacao de Leitura
  SYS_WRITE equ 0x4  ; Operacao de Escrita
  SYS_CALL  equ 0x80 ; Envia informacao ao SO

section .data

  x dd 50  ; dd - Define Double Word - 4 bytes
           ; db - Define Byte - 1 Byte
           ; dw - Define Word - 2 Bytes
           ; dq - Define Quad Word - 4 Bytes
           ; dt - Define Ten Word  - 10 Bytes
  y dd 10
  msg1 db 'X maior que Y', LF, NULL
  tam1 equ $ - msg1
  msg2 db 'Y maior que X', LF, NULL
  tam2 equ $ - msg2

section .text

global _start

_start:
  mov eax, DWORD [x]
  mov ebx, DWORD [y]
  cmp eax, ebx       ; comparacao
  jge maior          ; je = jg > jge >= jl < jle <= jne != 
  mov ecx, msg2
  mov edx, tam2
  jmp final
  
maior:
  mov ecx, msg1
  mov edx, tam1

final:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  int SYS_CALL

  mov eax, SYS_EXIT
  mov ebx, RET_EXIT
  int SYS_CALL 











