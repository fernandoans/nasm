; -------------------------------------
; Biblioteca para os registradores E
; -------------------------------------
segment .data
  LF            equ 10   ; Line Feed
  NULL          equ 0    ; Final da String
  EXIT_SUCESS   equ 0    ; Operação com Sucesso
  SYS_EXIT      equ 1    ; Codigo de chamada para finalizar

  STDIN         equ 0    ; System.in
  STDOUT        equ 1    ; System.out
  STDERR        equ 2    ; System.err

  SYS_READ      equ 0    ; read
  SYS_WRITE     equ 4    ; print

  SYS_CALL      equ 0x80 ; inteiro final