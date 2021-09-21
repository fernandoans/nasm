; -------------------------------------
; Biblioteca para os registradores E
; -------------------------------------
segment .data
  LF            equ 0xA  ; Line Feed
  NULL          equ 0xD  ; Final da String
  EXIT_SUCESS   equ 0x0  ; Operação com Sucesso
  SYS_EXIT      equ 0x1  ; Codigo de chamada para finalizar

  STDIN         equ 0x0  ; System.in
  STDOUT        equ 0x1  ; System.out
  STDERR        equ 0x2  ; System.err

  SYS_READ      equ 0x3  ; read
  SYS_WRITE     equ 0x4  ; print

  SYS_CALL      equ 0x80 ; inteiro final