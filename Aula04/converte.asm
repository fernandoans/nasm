%include 'bibliotecaE.inc'

section .data
    v1 dw '108', LF, NULL

section .text

global _start

_start:
    call converter_valor
    call mostrar_valor

    mov eax, SYS_EXIT
    mov ebx, RET_EXIT
    int SYS_CALL

converter_valor:
    lea esi, [v1]
    mov ecx, 0x3
    call string_to_int
    add eax, 0x2
    ret

mostrar_valor:
    call int_to_string
    call saidaResultado
    ret    

;----------------------------------
; string para inteiro
;----------------------------------
; Entrada: ESI (valor conv) ECX (tam)
; Saida..: EAX
;----------------------------------
string_to_int:
  xor ebx, ebx
.prox_digito:
  movzx   eax, byte[esi]
  inc esi
  sub al, '0'
  imul ebx, 0xA
  add ebx, eax ; ebx = ebx*10 + eax
  loop .prox_digito ; while (--ecx)
  mov eax, ebx
  ret

;----------------------------------
; inteiro para string
;----------------------------------
; Entrada: inteiro em EAX
; Saida..: BUFFER (valor ECX) TAM_BUFFER (EDX)
;----------------------------------
int_to_string:
  lea esi, [BUFFER]
  add esi, 0x9
  mov byte[esi], 0xA
  mov ebx, 0xA
.prox_digito:
  xor edx, edx
  div ebx
  add dl, '0'
  dec esi
  mov [esi], dl
  test eax, eax
  jnz .prox_digito
  ret    