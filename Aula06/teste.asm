%include 'bibliotecaE.inc'

SECTION .data
  msg1: DB 'Parte 1 ', LF, NULL
  msg2: DB 'Parte 2 ', LF, NULL
  msg3: DB 'Parte 3 ', LF, NULL
  msg4: DB 'Parte 4 ', LF, NULL

SECTION .text

global _start

_start:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, msg1 ; mensagem em string
    mov EDX, 0x1A  ; tamanho
    int SYS_CALL

    mov EAX, SYS_EXIT
    mov EBX, EXIT_SUCESS
    int SYS_CALL