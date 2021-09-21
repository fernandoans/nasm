section .text

global Fibonacci

Fibonacci:
    mov eax, 1
    mov r8d, 1
    mov r9d, 1
Calcular:
    sub edi, 1 
    cmp edi, 0
    je  Terminar
    mov eax, r8d     ; eax = r8d        |
    add eax, r9d     ; eax = eax + r9d  | eax = r8d + r9d

; -------------------------------------------------
;  Se vier 2      Se vier 3      Se vier 4 
;  r8d r9d eax    r8d r9d eax    r8d r9d eax
;  1   1   2   -> 1   2   3   -> 2   3   5
; -------------------------------------------------

Troca:
    mov r8d, r9d
    mov r9d, eax
    jmp Calcular

Terminar:
    ret