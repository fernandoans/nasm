%include 'bibliotecaR.inc'

section .data
  ent1: db "Informe o primeiro valor?", LF, NULL
  entx: db "Informe o segundo valor?", LF, NULL
  ent2: db "Informe o segundo valor?", LF, NULL

section .bss
  val1 resb 1
  val2 resb 1

section .text

global _start:

_start:
    mov     rax, ent1
    call    showMsg

    mov     rax, SYS_READ
    mov     rbx, STD_IN
    mov     ecx, val1
    mov     edx, 0xA
    syscall

    mov rax, SYS_CALL
    xor rdi, rdi
    syscall    

; --------------------------------------
; int string2int(String msg)
; Calcular o tamanho da String
; --------------------------------------
; Entrada: String em RSI
; Saida: inteiro em EAX
; --------------------------------------
string2int:
  push  rbx
	xor   rbx, rbx

.prox_digito:
	movzx rax, byte[rsi]
	inc   rsi
	sub   al, '0'
	imul  rbx, 0xA
	add   rbx, rax
	jmp .prox_digito
	mov   rax, rbx
  pop   rbx
	ret  