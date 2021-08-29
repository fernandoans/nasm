; -------------------------------------
; Biblioteca para os registradores R
; -------------------------------------
segment .data
  LF            equ 0xA    ; Line Feed
  NULL          equ 0xD    ; Final da String

  STD_IN        equ 0x0    ; System.in
  STD_OUT       equ 0x1    ; System.out
  STD_ERR       equ 0x2    ; System.err

  SYS_READ      equ 0x0    ; read
  SYS_WRITE     equ 0x1    ; print

  SYS_CALL      equ 0x3C   ; inteiro final

segment .text

; --------------------------------------
; void showMsg(String msg)
; Mostra a mensagem no terminal
; --------------------------------------
showMsg:
  push  rdi
  push  rsi
  push  rdx
  push  rax
  call  tamStr
  mov   rdx, rax
  pop   rax
  mov   rsi, rax
  mov   rax, STD_OUT
  mov   rdi, SYS_WRITE
  syscall
  pop   rdx
  pop   rsi
  pop   rdi
  ret

; --------------------------------------
; int tamStr(String msg)
; Calcular o tamanho da String
; --------------------------------------
tamStr:  
  push  rbx
  mov   rbx, rax
proxchar:
  cmp   byte[rax], NULL
  jz    terminei
  inc   rax
  jmp   proxchar  
terminei:
  sub   rax, rbx
  pop   rbx
  ret