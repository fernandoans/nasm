segment .text

global Teste1
global Teste2

Teste1:
  cmp EDI, ESI
  jg voltaEDI
  jmp voltaESI

voltaEDI:
  mov EAX, EDI
  ret

voltaESI:
  mov EAX, ESI
  ret    

Teste2:
  cmp EDI, 1  
  je voltar5
  cmp EDI, 2
  je voltar6
  cmp EDI, 3
  je voltar7
  mov EAX, 0x0
  ret

voltar5:
  mov EAX, 0x5
  ret

voltar6:
  mov EAX, 0x6
  ret

voltar7:
  mov EAX, 0x7
  ret    