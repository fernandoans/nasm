; -------------------------------------
; Biblioteca para os registradores E
; -------------------------------------
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