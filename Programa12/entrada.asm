; entrada.asm	
; Programa para Entrada de Dados
;
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
  msg db "Entre com seu nome: ", LF, NULL
  tam equ $- msg

section .bss
  nome resb 1

section .text

global _start

_start:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msg
  mov edx, tam
  int SYS_CALL

  ; Entrada Dados
  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, nome
  mov edx, 0xA
  int SYS_CALL

  mov eax, SYS_EXIT
  mov ebx, RET_EXIT ; xor ebx, ebx
  int SYS_CALL