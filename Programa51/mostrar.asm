section .data
  LF equ 0xA ; Line Feed
  mensagem: db "Hello World 64 bits!!! Vale um Joinha??", LF

section .text

global _start:

_start:
    mov rax, mensagem
    call showMsg

    mov rax, 0x3C ; System Call saida
    xor rdi, rdi
    syscall

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
  mov   rax, 0x1 ; System Call escrita
  mov   rdi, 0x1 ; Informação saida
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
  cmp   byte[rax], 0x0
  jz    terminei
  inc   rax
  jmp   proxchar  
terminei:
  sub   rax, rbx
  pop   rbx
  ret  