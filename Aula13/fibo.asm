global Fibonacci

segment .text

Fibonacci:
    mov     rax, 1
    mov     r8, 1
    mov     r9, 1
Calcular:
    sub     rdi, 1 
    cmp     rdi, 0
    je      Terminar
    mov     rax, r8     ; rax = r8        |
    add     rax, r9     ; rax = rax + r9  | rax = r8 + r9

; -------------------------------------------------
;  Se vier 2     Se vier 3    Se vier 4 
;  r8 r9 rax     r8 r9 rax    r8 r9 rax
;  1  1  2    -> 1  2  3   -> 2  3  5
; -------------------------------------------------

Troca:
    mov     r8, r9
    mov     r9, rax
    call    Calcular

Terminar:
    ret    