segment .data
  LF        equ 0xA  ; Line Feed
  NULL      equ 0xD  ; Final da String
  SYS_CALL  equ 0x80 ; Envia informacao ao SO
  ; EAX
  SYS_EXIT  equ 0x1  ; Codigo de chamada para finalizar
  SYS_READ  equ 0x3  ; Operacao de leitura
  SYS_WRITE equ 0x4  ; Operacao de escrita
  ; EBX
  RET_EXIT  equ 0x0  ; Operacao realizada com Sucesso
  STD_IN    equ 0x0  ; Entrada padrao
  STD_OUT   equ 0x1  ; Saida padrao

section .data
  x dd 10
  y dd 50 
  msg1 db 'X maior que Y', LF, NULL
  tam1 equ $ - msg1
  msg2 db 'Y maior que X', LF, NULL
  tam2 equ $ - msg2

section .text

global _start

_start:
  mov EAX, DWORD[x]
  mov EBX, DWORD[y]
  ; if - Comparacao
  cmp EAX, EBX
  ; salto condicional
  jge maior ; EAX >= EBX
  mov ECX, msg2
  mov EDX, tam2
  ; je = jg > jge >= jl < jle <= jne !=
  jmp final
  ; Salto Incondicional jmp

maior:
  mov ECX, msg1
  mov EDX, tam1

final:
  mov EAX, SYS_WRITE
  mov EBX, STD_OUT
  int SYS_CALL

  mov EAX, SYS_EXIT
  xor EBX, EBX ; mov EBX, RET_EXIT     AND OR XOR
  int SYS_CALL
