; -----------------------------------
; Programa de Conversão - Hex > Dec
; -----------------------------------
%include 'bibliotecaE.inc'

SECTION .data
    hexa    equ     0xFF

SECTION .bss
    deci    resb    1   

SECTION .text    

global _start

_start:
    mov     esi, deci+0xB
    mov     byte[esi], 0xA   ; adicionando '\n'
    mov     eax, hexa
    mov     ebx, 0xA         ; divisor
    mov     ecx, 0x1         ; tamanho

proximo_digito:
    inc     ecx
    xor     edx, edx         ; LIMPAR edx  -> XOR 0 0 : 0 | 1 0 : 1 | 0 1 : 1 | 1 1 : 0
    div     ebx              ; eax / ebx -> 15 / 10 -> 1,5

    add     edx, 0x30        ; Valor 0
    dec     esi
    mov     [esi], dl        ; colocar digito decimal como String
    cmp     eax, 0x0
    jnz     proximo_digito   ; Jump if Zero Flag is Unset

mostrar:
    mov     edx, ecx         ; tamanho
    mov     ecx, esi         ; String
    mov     eax, SYS_WRITE   ; SysWrite
    mov     ebx, STD_OUT     ; Stout
    int     SYS_CALL         ; chamada do Kernel

saida:
    mov     eax, SYS_EXIT    ; SysExit
    mov     ebx, RET_EXIT    ; Retorno
    int     SYS_CALL         ; chamada do Kernel    
