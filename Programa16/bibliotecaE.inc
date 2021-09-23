; -------------------------------------
; Biblioteca para os registradores E
; -------------------------------------
segment .data
  LF            equ 0xA  ; Line Feed
  NULL          equ 0x0  ; Final da String
  EXIT_SUCESS   equ 0x0  ; Operação com Sucesso
  SYS_EXIT      equ 0x1  ; Codigo de chamada para finalizar

  STD_IN        equ 0x0  ; System.in
  STD_OUT       equ 0x1  ; System.out
  STDERR        equ 0x2  ; System.err

  SYS_READ      equ 0x0  ; read
  SYS_WRITE     equ 0x4  ; print

  SYS_CALL      equ 0x80 ; inteiro final
  TAM_BUFFER    equ 0xA

segment .bss
  BUFFER        resb 0x4

segment .text

; ---------------------------------------------
; Função de Conversão de Inteiro para String
; Criado em: 10/04/2021
; Criado por: Fernando Anselmo
; ---------------------------------------------
; Entrada: inteiro em EAX
; Saida..: BUFFER (usar EDX o TAM_BUFFER)
; ---------------------------------------------
int_to_string:
  lea   esi, [BUFFER]
  add   esi, 0x9
  mov   byte[esi], 0xA
  mov   ebx, 0xA

.prox_digito:
  xor   edx, edx
  div   ebx
  add   dl, '0'
  dec   esi
  mov   [esi], dl
  test  eax, eax
  jnz   .prox_digito
  ret

; ---------------------------------------------
; Função de Saída do Resultado
; Criado em: 10/04/2021
; Criado por: Fernando Anselmo
; ---------------------------------------------
; A partir da chamada para int2string, mostra
; o valor do BUFFER na saída do terminal.
; ---------------------------------------------
saidaResultado:
  mov     eax, SYS_WRITE
  mov     ebx, STD_OUT
  mov     ecx, BUFFER
  mov     edx, TAM_BUFFER
  int     SYS_CALL
  ret