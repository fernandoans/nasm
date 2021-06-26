; -------------------------------------
; Biblioteca para os registradores E
; -------------------------------------
segment .data
  LF            equ 0xA    ; Line Feed
  NULL          equ 0xD    ; Final da String
  EXIT_SUCESS   equ 0x0    ; Operação com Sucesso
  SYS_EXIT      equ 0x1    ; Codigo de chamada para finalizar

  STDIN         equ 0x0    ; System.in
  STDOUT        equ 0x1    ; System.out
  STDERR        equ 0x2    ; System.err

  SYS_READ      equ 0x3    ; read
  SYS_WRITE     equ 0x4    ; print

  READ_FILE     equ 0x3    ; ler o arquivo
  WRITE_FILE    equ 0x4    ; escrever no arquivo
  OPEN_FILE     equ 0x5    ; abrir o arquivo
  CLOSE_FILE    equ 0x6    ; fechar o arquivo
  CREATE_FILE   equ 0x8    ; criar o arquivo
  SEEK_FILE     equ 0x13   ; posicionar no arquivo

  SYS_CALL      equ 0x80   ; inteiro final

  OPEN_READ     equ 0x0    ; Arquivo para leitura
  OPEN_WRITE    equ 0x1    ; Arquivo para escrita
  OPEN_RW       equ 0x2    ; Arquivo para leitura/escrita
  OPEN_CREATE   equ 0x40   ; Se arquivo não existe, cria
  OPEN_APPEND   equ 0x400  ; Arquivo para adição

  SEEK_SET      equ 0x0    ; Inicio do Arquivo
  SEEK_CUR      equ 0x1    ; Posição do Cursor
  SEEK_END      equ 0x2    ; Final do Arquivo

segment .bss
  buffer: resb 10

segment .text

; ---------------------------------------
; Converte String para Inteiro
; Entrada: ESI (valor conv) ECX (tamanho)
; Saida..: EAX com o valor
; ---------------------------------------
string_to_int:
   xor    ebx, ebx;
.prox_digito:
   movzx  eax, byte[esi]
   inc    esi
   sub    al, '0'
   imul   ebx, 10
   add    ebx, eax ; ebx = ebx*10 + eax
   loop .prox_digito ; while (--ecx)
   mov    eax, ebx
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

; ---------------------------------------
; Acha o tamanho total da String
; Entrada: EDX (valor STR)
; Saida..: EAX
; ---------------------------------------
_strlen:
  xor   ecx, ecx

_strlen_next:
  cmp   [edx], byte 0  ; null byte yet?
  jz    _strlen_null   ; yes, get out
  inc   ecx            ; char is ok, count it
  inc   edx            ; move to next char
  jmp   _strlen_next   ; process again

_strlen_null:
  mov   eax, ecx       ; rcx = the length (put in rax)
  ret                  ; get out    