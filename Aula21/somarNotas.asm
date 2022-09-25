%include 'bibliotecaE.inc'

section .data
    arq db 'Nota'
    tam equ 3
    fd  dq 0
    dispMsg db 'Resultado:'
    tamDispMsg  equ $-dispMsg
    salto   db '',LF
    tamValor    db 0

section .bss
    val1    resw    2
    val2    resw    2
    soma    resb    10

section .text

global _start:

_start:
    mov EAX, OPEN_FILE
    mov EBX, arq
    mov ECX, OPEN_READ
    int SYS_CALL
    mov [fd], EAX

lerLinha1:
    mov byte[soma], 0x0 

    mov EAX, READ_FILE
    mov EBX, [fd]
    mov ECX, val1
    mov EDX, tam   
    int SYS_CALL

    lea ESI, [val1]
    mov ECX, 0x2
    call string_to_int
    add [soma], EAX

    cmp EAX, 0
    je fecharArquivo

lerLinha2:
    mov EAX, READ_FILE
    mov EBX, [fd]
    mov ECX, val2
    mov EDX, tam   
    int SYS_CALL

    lea ESI, [val2]
    mov ECX, 0x2
    call string_to_int
    add [soma], EAX

dividePor2:
    mov EDX, 0
    mov EAX, [soma]
    mov EBX, 2
    div EBX
    mov [soma], EAX

resultado:
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, dispMsg
    mov EDX, tamDispMsg
    int SYS_CALL

    mov EAX, [soma]
    call int_to_string
    mov ECX, EAX
    call tamStr

    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    int SYS_CALL
    
    mov EAX, SYS_WRITE
    mov EBX, STD_OUT
    mov ECX, salto
    mov EDX, 0x2
    int SYS_CALL

    jmp lerLinha1

fecharArquivo:
    mov EAX, CLOSE_FILE
    mov EBX, [fd]
    int SYS_CALL

final:
    mov EAX, SYS_EXIT
    mov EBX, EXIT_SUCESS
    int SYS_CALL
