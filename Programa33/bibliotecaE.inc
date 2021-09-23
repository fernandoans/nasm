; -------------------------------------
; Biblioteca para os registradores E
; -------------------------------------
segment .data
  LF           equ 0xA  ; Line Feed
  NULL         equ 0x0  ; Final da String
  EXIT_SUCESS  equ 0x0  ; Operação com Sucesso
  SYS_EXIT     equ 0x1  ; Codigo de chamada para finalizar

  STD_OUT      equ 0x1  ; System.out
  SYS_WRITE    equ 0x4  ; print

  SYS_CALL     equ 0x80 ; inteiro final

  estrela  db '*', LF
  espaco   db ' ', LF

segment .text  

impEspaco:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, espaco
  int SYS_CALL
  ret

impEstrela:
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, estrela
  int SYS_CALL
  ret