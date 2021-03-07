; -------------------
; Programa de Pilhas
; -------------------
segment .data
  LF            equ 10  ; Line Feed
  NULL          equ 0   ; Final da String
  EXIT_SUCESS   equ 0   ; Operação com Sucesso
  SYS_EXIT      equ 60  ; Codigo de chamada para finalizar

  STDIN         equ 0   ; System.in
  STDOUT        equ 1   ; System.out
  STDERR        equ 2   ; System.err

  SYS_READ      equ 0   ; read
  SYS_WRITE     equ 1   ; print

  liv1          db '1. Moby Dick', LF, NULL
  liv2          db '2. Tom Swayer', LF, NULL  
  liv3          db '3. Duna', LF, NULL  

segment .text

global _start

_start:
  ; Colocar os livros na pilha
  push      liv1
  push      liv2
  push      liv3
  ; Retirar os livros da pilha
  pop       rdi
  call      _imprimir
  pop       rdi
  call      _imprimir
  pop       rdi
  call      _imprimir
  
  ; finalizar
  mov       rax, SYS_EXIT
  mov       rbx, EXIT_SUCESS
  syscall

;-------------------------------  
; Função de Impressão
; Recebe o valor por rdi
;-------------------------------  
_imprimir:
  call      _ctCaracteres
  mov       rax, SYS_WRITE
  mov       rsi, rdi
  mov       rdi, STDOUT
  syscall
  ret

_ctCaracteres:  ; while for
  mov       rbx, rdi
  mov       rdx, 0
fazLoop:
  cmp       byte[rbx], NULL
  je        termina
  inc       rdx
  inc       rbx
  jmp       fazLoop
termina:
  ret       


