 %include 'bibliotecaE.inc'

section .data
    msg db 'Entre com um valor de 3 digitos:', LF, NULL
    tamMsg equ $ - msg
    parMsg db 'Numero par!', LF, NULL
    tamPar equ $ - parMsg
    imparMsg db 'Numero impar!', LF, NULL
    tamImpar equ $ - imparMsg

section .bss
    num resb 1

 section .text

 global _start

 _start:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, msg
    mov edx, tamMsg
    int SYS_CALL

entrada_valor:
    mov eax, SYS_READ
    mov ebx, STD_IN
    mov ecx, num
    mov edx, 0x4
    int SYS_CALL

    lea esi, [num]
    mov ecx, 0x3
    call string_to_int    

verificar:    
    mov edx, 0x0
    mov ebx, 0x2
    div ebx
    cmp edx, 0x0
    jz mostra_par

mostra_impar:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, imparMsg
    mov edx, tamImpar
    int SYS_CALL
    jmp saida

mostra_par:
    mov eax, SYS_WRITE
    mov ebx, STD_OUT
    mov ecx, parMsg
    mov edx, tamPar
    int SYS_CALL

saida:
    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL
