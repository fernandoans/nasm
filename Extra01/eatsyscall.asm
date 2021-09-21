; ------------------------
; Programa Coma no Joe's
; ------------------------
; $ nasm -f elf64 -g -F stabs eatsyscall.asm
;   ---- -------- -- -------- --------------
;     |      |     |    |          |
;     |      |     |    |          +--> Nome do arquivo fonte
;     |      |     |    |
;     |      |     |    +--> A informação do debug está em formato stabs
;     |      |     |
;     |      |     +--> A informação do debug deve ser incluída no arquivo de saída
;     |      |
;     |      +--> Arquivo deve ser gerado em formato ELF64 (ELF para 32 bits)
;     |
;     +--> Chama o compilador do assembly
;
; $ ld -o eatsyscall eatsyscall.o
;   -- ------------- ------------
;    |        |            |
;    |        |            +--> Especifica o nome do arquivo objeto gerado pelo compilador
;    |        |
;    |        +--> Especifica o nome do arquivo executável a ser gerado
;    |
;    +--> Chama o linkeditor
;
; $ ./eatsyscall
;
; Depurar: ddd eatsyscall
; ------------------------
section .data   ; Secao que contem os dados iniciais

EatMsg: db  "Coma no Joe's", 10
EatLen: equ $ - EatMsg

section .bss    ; Secao que contem os dados nao iniciais

section .text   ; Secao que contem o codigo

global _start   ; Ponto de entrada

    _start:
        nop             ; Este mantem o GDB feliz
        mov eax,4       ; Especifica sys_write syscall
        mov ebx,1       ; Especifica o descritor 1 na saida padrao
        mov ecx,EatMsg  ; Passa a mensagem
        mov edx,EatLen  ; Passa o offset da mensagem
        int 80H         ; Faz a chamda de saida

        mov eax,1       ; Especifica a saida
        mov ebx,0       ; Retorna o codigo 0
        int 80H         ; Termina o programa