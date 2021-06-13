%include 'bibliotecaE.inc'

section .data
    msg     db  'Hello World Fernando Anselmo', LF, NULL

section .text

global _start:

_start:
    mov edx, msg
    call _strlen
    mov edx, eax

_mostrar:
    mov eax, SYS_WRITE
    mov ebx, STDOUT
    mov ecx, msg
    int SYS_CALL

_final:
    mov eax, SYS_EXIT
    mov ebx, EXIT_SUCESS
    int SYS_CALL

_strlen:
    xor ecx, ecx

_proximo:
    cmp [edx], byte 0 
    jz  _finalizou
    inc ecx
    inc edx
    jmp _proximo

_finalizou:
    mov eax, ecx
    ret





