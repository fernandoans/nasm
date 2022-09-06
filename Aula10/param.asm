global PassarParam

segment .text

PassarParam:
  mov eax, edi ; 1º Param para EAX
  add eax, esi ; 2º Param adionando em EAX
  add eax, edx ; 3º Param adionando em EAX  
  ret