 %include 'bibliotecaE.inc'

 section .text

 global _start

 _start:
    mov edx, 0x0
    mov eax, 0xA  ; Decimal 10
    mov ebx, 0x3
    div ebx       ; EAX = EAX / EBX -> Resto em EDX

    mov eax, edx
    call int_to_string
    call saidaResultado

saida:
    mov eax, SYS_EXIT    
    mov ebx, RET_EXIT
    int SYS_CALL
