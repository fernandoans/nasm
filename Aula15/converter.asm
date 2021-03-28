; -----------------------------------
; Programa de Conversão - Hex > Dec
; -----------------------------------
SECTION .data
    hexa    equ     0x30

SECTION .bss
    deci    resb    11    

SECTION .text    

global _start

_start:
    mov     esi, deci+11
    mov     byte[esi], 0xA   ; adicionando '\n'
    mov     eax, hexa
    mov     ebx, 0xA         ; divisor
    mov     ecx, 1           ; tamanho

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
    mov     ebx, 1           ; Stout
    mov     eax, 4           ; SysWrite
    int     0x80             ; chamada do Kernel

saida:
    mov     ebx, 0           ; Retorno
    mov     eax, 1           ; SysExit
    int     0x80             ; chamada do Kernel    


