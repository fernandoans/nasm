global PassarParam

segment .text

PassarParam:
    mov eax, edi   ; 1º Parâmetro movendo para EAX
    add eax, esi   ; 2º Parâmetro adicionar a EAX
    add eax, edx   ; 3º Parâmetro adicionar a EAX
    ret