%include 'bibliotecaE.inc'

section .data
    arq         db 'Nota', STDIN
    tam         equ 3
    fd          dq 0
    dispMsg     db "Resultado: "
    tamDispMsg  equ $-dispMsg
    espaco      db ' ', LF, NULL
    tamValor    db 0

section .bss
    val1        resw 2
    val2        resw 2
    valT        resw 2
    soma        resb 10

section .text

global _start:

_start:
    mov     eax, OPEN_FILE
    mov     ebx, arq
    mov     ecx, OPEN_READ
    int     SYS_CALL
    mov     [fd], eax

lerLinha1:
    mov     byte[soma], 0x0

    mov     eax, READ_FILE
    mov     ebx, [fd]
    mov     ecx, val1
    mov     edx, tam
    int     SYS_CALL

    lea     esi, [val1]
    mov     ecx, 0x2
    call    string_to_int
    add     [soma], eax

    cmp     eax, 0
    je      fecharArquivo

lerLinha2:
    mov     eax, READ_FILE
    mov     ebx, [fd]
    mov     ecx, val2
    mov     edx, tam
    int     SYS_CALL

    lea     esi, [val2]
    mov     ecx, 0x2
    call    string_to_int
    add     [soma], eax

dividePor2:
    mov     edx, 0
    mov     eax, [soma]
    mov     ebx, 2
    div     ebx
    mov     [soma], eax

resultado:
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, dispMsg
    mov     edx, tamDispMsg
    int     SYS_CALL

    mov     eax, [soma]
    lea     esi, [buffer]
    call    int_to_string
    mov     [valT], eax
    mov     edx, eax
    call    _strlen

    mov     edx, eax
    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, [valT]
    int     SYS_CALL

    mov     eax, SYS_WRITE
    mov     ebx, STDOUT
    mov     ecx, espaco
    mov     edx, 2
    int     SYS_CALL

    jmp     lerLinha1

fecharArquivo:
    mov     eax, CLOSE_FILE
    mov     ebx, [fd]    
    int     SYS_CALL

final:
    mov     eax, SYS_EXIT
    mov     ebx, EXIT_SUCESS
    int     SYS_CALL
