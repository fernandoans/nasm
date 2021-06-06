section .data
  v1 dw '105', 0xa

section .bss
  buffer: resb 10

section .text
  global _start

_start:
  call converter_valor
  call mostrar_valor

_final:
  mov eax, 1
  mov ebx, 0
  int 0x80

converter_valor:
  lea esi, [v1]
  mov ecx, 3
  call string_to_int
  add eax, 1
  ret

mostrar_valor:
  lea esi, [buffer]
  call int_to_string
  mov ecx, eax
  mov edx, 10
  mov eax, 4
  mov ebx, 1
  int 0x80
  ret

; ---------------------------------------
; Converte String para Inteiro
; Entrada: ESI (valor conv) ECX (tamanho)
; Saida..: EAX com o valor
; ---------------------------------------
string_to_int:
   xor ebx, ebx;
.prox_digito:
   movzx eax, byte[esi]
   inc esi
   sub al, '0'
   imul ebx, 10
   add ebx, eax ; ebx = ebx*10 + eax
   loop .prox_digito ; while (--ecx)
   mov eax, ebx
   ret

; ---------------------------------------
; Conveter Inteiro para string
; Entrada: EAX (valor conv) ESI (valor buffer)
; Saida..: EAX
; ---------------------------------------
int_to_string:
  add esi, 9
  mov byte [esi], 0
  mov ebx, 10
.prox_digito:
  xor edx, edx
  div ebx
  add dl, '0'
  dec esi
  mov [esi], dl
  test eax, eax
  jnz .prox_digito ; eax == 0
  mov eax, esi
  ret
