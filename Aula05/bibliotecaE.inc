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

segment .text

; -----------------------------------
; Saida no termina da String
; -----------------------------------
mst_saida:
  call tamStr
  mov EAX, SYS_WRITE
  mov EBX, STD_OUT
  int SYS_CALL
  ret  

; -----------------------------------
; Calcular o tamanho da String
; -----------------------------------
; Entrada: valor da String em ECX
; Saida: tamanho da String em EDX
; -----------------------------------
tamStr:
 mov EDX, ECX
proxchar:
 cmp byte[EDX], NULL
 jz terminei
 inc EDX
 jmp proxchar
terminei:
 sub EDX, ECX
 ret 